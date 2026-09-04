#!/usr/bin/env bash
# Deterministic notebook verifier — the blocking gate every task must pass.
#
# Checks, in order:
#   1. source notebook carries no baked cell outputs (they must not be committed)
#   2. every required heading from syllabus/manifest.yaml is present
#   3. the notebook executes top-to-bottom with no error output
#   4. wall clock is within the manifest's cap
#
# Resource caps are deliberate: this runs on the operator's workstation alongside
# their own sessions, so threads are limited and the process is niced.
set -uo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NB="${1:-}"
if [ -z "$NB" ]; then echo "usage: verify_notebook.sh notebooks/X.ipynb" >&2; exit 2; fi
[ -f "$REPO/$NB" ] || [ -f "$NB" ] || { echo "FAIL: notebook not found: $NB" >&2; exit 2; }
case "$NB" in /*) ABS="$NB";; *) ABS="$REPO/$NB";; esac
BASE="$(basename "$ABS")"

PY="$REPO/.venv/bin/python"
[ -x "$PY" ] || { echo "FAIL: .venv missing — run scripts/setup_env.sh" >&2; exit 2; }

# Bound CPU use so parallel seats cannot swamp the machine.
export OMP_NUM_THREADS=4 MKL_NUM_THREADS=4 OPENBLAS_NUM_THREADS=4
export TOKENIZERS_PARALLELISM=false
export PYTHONHASHSEED=0
export MPLBACKEND=Agg
export HF_HUB_DISABLE_TELEMETRY=1

CAP=$("$PY" - "$REPO" "$BASE" <<'PYEOF'
import sys, yaml, pathlib
repo, base = sys.argv[1], sys.argv[2]
m = yaml.safe_load(pathlib.Path(repo, "syllabus/manifest.yaml").read_text()) or {}
print((m.get(base) or {}).get("max_runtime_seconds", 600))
PYEOF
)

echo "== verify $BASE (cap ${CAP}s)"

# 1 + 2: static checks against the source notebook.
"$PY" - "$REPO" "$ABS" "$BASE" <<'PYEOF' || exit 1
import json, sys, pathlib, yaml
repo, path, base = sys.argv[1], sys.argv[2], sys.argv[3]
nb = json.loads(pathlib.Path(path).read_text())
cells = nb.get("cells", [])
baked = [i for i, c in enumerate(cells)
         if c.get("cell_type") == "code" and (c.get("outputs") or c.get("execution_count") is not None)]
if baked:
    print(f"FAIL: {len(baked)} code cell(s) carry committed outputs (cells {baked[:5]}) — clear before committing")
    sys.exit(1)
man = yaml.safe_load(pathlib.Path(repo, "syllabus/manifest.yaml").read_text()) or {}
required = (man.get(base) or {}).get("required_headings", [])
text = "\n".join("".join(c.get("source", [])) for c in cells if c.get("cell_type") == "markdown")
missing = [h for h in required if h.lower() not in text.lower()]
if missing:
    print(f"FAIL: missing required section(s): {missing}")
    sys.exit(1)
print(f"  static ok — {len(cells)} cells, {len(required)} required headings present")
PYEOF

# 3 + 4: execute.
OUT="$(mktemp -d)"
trap 'rm -rf "$OUT"' EXIT
START=$(date +%s)
nice -n 10 timeout $((CAP + 300)) "$REPO/.venv/bin/jupyter" nbconvert \
  --to notebook --execute --ExecutePreprocessor.timeout="$CAP" \
  --output-dir="$OUT" --output executed.ipynb "$ABS" > "$OUT/log" 2>&1
RC=$?
ELAPSED=$(( $(date +%s) - START ))

if [ $RC -ne 0 ]; then
  echo "FAIL: execution exited $RC after ${ELAPSED}s"
  tail -30 "$OUT/log"
  exit 1
fi

"$PY" - "$OUT/executed.ipynb" <<'PYEOF' || exit 1
import json, sys, pathlib
nb = json.loads(pathlib.Path(sys.argv[1]).read_text())
errs = [(i, o) for i, c in enumerate(nb.get("cells", []))
        for o in c.get("outputs", []) if o.get("output_type") == "error"]
if errs:
    i, o = errs[0]
    print(f"FAIL: {len(errs)} cell(s) produced errors; first at cell {i}: {o.get('ename')}: {o.get('evalue')}")
    sys.exit(1)
print("  execution ok — no error outputs")
PYEOF

if [ "$ELAPSED" -gt "$CAP" ]; then
  echo "FAIL: runtime ${ELAPSED}s exceeds cap ${CAP}s — reduce epochs or subsample data"
  exit 1
fi

echo "PASS: $BASE — clean execution in ${ELAPSED}s (cap ${CAP}s)"
