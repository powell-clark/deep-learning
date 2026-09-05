# Deep Learning & Transformers

A complete, university-grade curriculum for deep learning — from a single neuron through
transformers, pretraining, alignment, generative models and deployment. Every method is
derived from first principles, implemented from scratch in NumPy, then reproduced with
PyTorch or Hugging Face. All notebooks run in Google Colab with no local setup.

**Status**: ✅ CORPUS-READY — 36 of 36 notebooks complete.

Fourth in the machine-learning series, after
[supervised-learning](https://github.com/powell-clark/supervised-learning),
[unsupervised-learning](https://github.com/powell-clark/unsupervised-learning) and
[reinforcement-learning](https://github.com/powell-clark/reinforcement-learning).

## Approach

- **From first principles** — every architecture and optimiser derived, not asserted
- **Dual implementation** — from-scratch NumPy, then the production framework
- **Story-driven** — motivation before mathematics
- **Verified** — every notebook executes top-to-bottom on CPU in under 10 minutes, checked
  by `scripts/verify_notebook.sh` before its task closes
- **Colab-ready** — no local setup required

## Curriculum

| Lesson | Topic | Theory | Practical |
|---|---|---|---|
| 0 | Introduction to Deep Learning | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/0a_intro_deep_learning_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/0b_intro_deep_learning_practical.ipynb) |
| 1 | From Linear Models to Neurons | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/1a_linear_to_neurons_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/1b_linear_to_neurons_practical.ipynb) |
| 2 | Multilayer Perceptrons and Backpropagation | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/2a_mlp_backprop_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/2b_mlp_backprop_practical.ipynb) |
| 3 | Training Dynamics | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/3a_training_dynamics_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/3b_training_dynamics_practical.ipynb) |
| 4 | Regularisation and Generalisation | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/4a_regularisation_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/4b_regularisation_practical.ipynb) |
| 5 | Convolutional Networks | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/5a_convolutional_networks_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/5b_convolutional_networks_practical.ipynb) |
| 6 | Modern Architectures and Transfer Learning | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/6a_modern_architectures_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/6b_modern_architectures_practical.ipynb) |
| 7 | Sequence Models | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/7a_sequence_models_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/7b_sequence_models_practical.ipynb) |
| 8 | Embeddings and Tokenisation | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/8a_embeddings_tokenisation_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/8b_embeddings_tokenisation_practical.ipynb) |
| 9 | Attention | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/9a_attention_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/9b_attention_practical.ipynb) |
| 10 | The Transformer | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/10a_the_transformer_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/10b_the_transformer_practical.ipynb) |
| 11 | Language Model Pretraining | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/11a_lm_pretraining_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/11b_lm_pretraining_practical.ipynb) |
| 12 | Fine-tuning and Adaptation | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/12a_finetuning_adaptation_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/12b_finetuning_adaptation_practical.ipynb) |
| 13 | Alignment: RLHF and Preference Optimisation | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/13a_alignment_rlhf_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/13b_alignment_rlhf_practical.ipynb) |
| 14 | Generative Models | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/14a_generative_models_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/14b_generative_models_practical.ipynb) |
| 15 | Efficient and Scalable Deep Learning | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/15a_efficient_scalable_theory.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/15b_efficient_scalable_practical.ipynb) |
| X1 | Debugging Deep Networks | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/X1_debugging_deep_networks.ipynb) | |
| X2 | Evaluation and Benchmarking | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/X2_evaluation_benchmarking.ipynb) | |
| X3 | Deployment and Safety | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/X3_deployment_safety.ipynb) | |
| X4 | Research Frontiers | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/X4_research_frontiers.ipynb) | |

See [CURRICULUM_PLAN.md](CURRICULUM_PLAN.md) for what each notebook covers.

## Local use

```bash
scripts/setup_env.sh                              # build .venv from requirements.txt
scripts/verify_notebook.sh notebooks/0a_intro_deep_learning_theory.ipynb
```

## How this repository is built

The curriculum is written by autonomous Claude Code sessions under the
[consciousness](https://github.com/powell-clark/consciousness) plugin. `CONSCIOUSNESS/`
carries the directive, stories, features, tasks and every review verdict — the full
provenance of what was built, by which seat, against which acceptance criteria.

## Licence

See [LICENSE.md](LICENSE.md).
