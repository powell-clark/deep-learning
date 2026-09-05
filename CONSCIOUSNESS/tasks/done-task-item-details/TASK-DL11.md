# TASK-DL11: Lesson 5a Convolutional Networks theory

## Context
Deliverable: `notebooks/5a_convolutional_networks_theory.ipynb` for STORY-DL6 (Convolutional Networks). Theory: derive from first principles and implement from scratch in NumPy. Data: MNIST, CIFAR-10.

## Acceptance Criteria
- [x] **AC-1** — Presents convolution as a linear operator with parameter sharing, contrasting parameter counts against a dense layer
- [x] **AC-2** — Explains padding, stride and dilation with their output-size formula
- [x] **AC-3** — Derives the receptive field of a stacked convolutional network
- [x] **AC-4** — Implements a 2D convolution forward and backward pass in NumPy and verifies against a reference
- [x] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-7** — Contains every section listed for `5a_convolutional_networks_theory.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/5a_convolutional_networks_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL6 (Convolutional Networks)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)

## Closing Note
Convolution derived as a constrained linear operator with a concrete parameter-count contrast,
the padding/stride/dilation output-size formula verified against torch, receptive field derived
and confirmed via an autograd-based empirical measurement, max pooling implemented from scratch
with a measured shift-invariance effect, and a from-scratch im2col conv2d forward+backward
verified to floating-point precision against `torch.nn.functional.conv2d` and its autograd
gradients, applied to real MNIST/CIFAR-10 images with a Sobel kernel. `scripts/verify_notebook.sh
notebooks/5a_convolutional_networks_theory.ipynb` — PASS: clean execution in 21s (cap 600s), 33
cells, 8/8 required headings present, no committed outputs.
