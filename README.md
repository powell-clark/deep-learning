# Deep Learning & Transformers

A complete, university-grade curriculum for deep learning — from a single neuron through
transformers, pretraining, alignment, generative models and deployment. Every method is
derived from first principles, implemented from scratch in NumPy, then reproduced with
PyTorch or Hugging Face. All notebooks run in Google Colab with no local setup.

## The series

Four repositories, one curriculum. The first three are *how* a model learns; the fourth is *what*
it is built from, and cuts across all three.

- [Supervised learning](https://github.com/powell-clark/supervised-learning) — learning from labelled examples
- [Unsupervised learning](https://github.com/powell-clark/unsupervised-learning) — finding structure with no labels
- [Reinforcement learning](https://github.com/powell-clark/reinforcement-learning) — learning from reward
- **[Deep learning & transformers](https://github.com/powell-clark/deep-learning)** — the architecture the other three can each be built on (you are here)

**Status:** 20 of 20 lessons complete (36 notebooks)

## Overview

- **From First Principles**: every algorithm derived from foundations, not quoted
- **Dual Structure**: theory (a) + practical (b) notebooks for each lesson
- **Story-Driven**: a real-world motivation before the mathematics
- **Complete Implementations**: from-scratch NumPy, then production libraries
- **Google Colab Compatible**: runs in the browser, no local setup
- **Machine-Verified**: every notebook executes top-to-bottom on CPU in under 10 minutes,
  checked by `scripts/verify_notebook.sh` before its task closed

## Lesson catalog

See [CURRICULUM_PLAN.md](CURRICULUM_PLAN.md) for the full table, including data used per lesson.

#### Foundations

- **Lesson 0**: Introduction to Deep Learning
  - [`0a_intro_deep_learning_theory.ipynb`](notebooks/0a_intro_deep_learning_theory.ipynb) — what stacking non-linear layers buys, representation learning, and the computational graph [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/0a_intro_deep_learning_theory.ipynb)
  - [`0b_intro_deep_learning_practical.ipynb`](notebooks/0b_intro_deep_learning_practical.ipynb) — tensors, autograd, `nn.Module`, and the training-loop skeleton, on MNIST [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/0b_intro_deep_learning_practical.ipynb)
- **Lesson 1**: From Linear Models to Neurons
  - [`1a_linear_to_neurons_theory.ipynb`](notebooks/1a_linear_to_neurons_theory.ipynb) — the perceptron and logistic regression as a one-layer net; loss surfaces; batch vs mini-batch vs SGD [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/1a_linear_to_neurons_theory.ipynb)
  - [`1b_linear_to_neurons_practical.ipynb`](notebooks/1b_linear_to_neurons_practical.ipynb) — the same model in PyTorch, with `DataLoader` and an overfit-one-batch sanity check [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/1b_linear_to_neurons_practical.ipynb)
- **Lesson 2**: Multilayer Perceptrons and Backpropagation
  - [`2a_mlp_backprop_theory.ipynb`](notebooks/2a_mlp_backprop_theory.ipynb) — the chain rule to backprop for an L-layer MLP, with manual gradients and gradient checking [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/2a_mlp_backprop_theory.ipynb)
  - [`2b_mlp_backprop_practical.ipynb`](notebooks/2b_mlp_backprop_practical.ipynb) — a PyTorch MLP, autograd checked against the manual gradients [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/2b_mlp_backprop_practical.ipynb)
- **Lesson 3**: Training Dynamics
  - [`3a_training_dynamics_theory.ipynb`](notebooks/3a_training_dynamics_theory.ipynb) — Xavier/He initialisation, vanishing/exploding gradients, BatchNorm/LayerNorm, and momentum/RMSProp/Adam, all derived [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/3a_training_dynamics_theory.ipynb)
  - [`3b_training_dynamics_practical.ipynb`](notebooks/3b_training_dynamics_practical.ipynb) — an initialisation × normalisation × optimiser ablation with learning-rate schedules, on CIFAR-10 [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/3b_training_dynamics_practical.ipynb)
- **Lesson 4**: Regularisation and Generalisation
  - [`4a_regularisation_theory.ipynb`](notebooks/4a_regularisation_theory.ipynb) — bias-variance in deep nets; weight decay as L2; dropout as an implicit ensemble; early stopping; augmentation [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/4a_regularisation_theory.ipynb)
  - [`4b_regularisation_practical.ipynb`](notebooks/4b_regularisation_practical.ipynb) — augmentation pipelines and dropout/weight-decay ablations, with learning curves [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/4b_regularisation_practical.ipynb)

#### Convolutional and Modern Architectures

- **Lesson 5**: Convolutional Networks
  - [`5a_convolutional_networks_theory.ipynb`](notebooks/5a_convolutional_networks_theory.ipynb) — convolution as a linear operator, parameter sharing, receptive fields and pooling, with backprop through conv from scratch [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/5a_convolutional_networks_theory.ipynb)
  - [`5b_convolutional_networks_practical.ipynb`](notebooks/5b_convolutional_networks_practical.ipynb) — a CNN on CIFAR-10 compared against a dense baseline, with feature-map visualisation [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/5b_convolutional_networks_practical.ipynb)
- **Lesson 6**: Modern Architectures and Transfer Learning
  - [`6a_modern_architectures_theory.ipynb`](notebooks/6a_modern_architectures_theory.ipynb) — why residual connections ease optimisation, norm placement, and the major architecture families [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/6a_modern_architectures_theory.ipynb)
  - [`6b_modern_architectures_practical.ipynb`](notebooks/6b_modern_architectures_practical.ipynb) — fine-tuning a pretrained torchvision ResNet, feature extraction vs full fine-tune [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/6b_modern_architectures_practical.ipynb)

#### Sequence Models and Language

- **Lesson 7**: Sequence Models
  - [`7a_sequence_models_theory.ipynb`](notebooks/7a_sequence_models_theory.ipynb) — the RNN forward pass and backpropagation through time, vanishing gradients, and LSTM/GRU gates, with a character RNN from scratch [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/7a_sequence_models_theory.ipynb)
  - [`7b_sequence_models_practical.ipynb`](notebooks/7b_sequence_models_practical.ipynb) — an LSTM language model with teacher forcing and temperature sampling [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/7b_sequence_models_practical.ipynb)
- **Lesson 8**: Embeddings and Tokenisation
  - [`8a_embeddings_tokenisation_theory.ipynb`](notebooks/8a_embeddings_tokenisation_theory.ipynb) — the distributional hypothesis and skip-gram with negative sampling, derived [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/8a_embeddings_tokenisation_theory.ipynb)
  - [`8b_embeddings_tokenisation_practical.ipynb`](notebooks/8b_embeddings_tokenisation_practical.ipynb) — byte-pair encoding from scratch vs the `tokenizers` library, and a pretrained embedding space visualised [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/8b_embeddings_tokenisation_practical.ipynb)
- **Lesson 9**: Attention
  - [`9a_attention_theory.ipynb`](notebooks/9a_attention_theory.ipynb) — the alignment problem; additive and scaled dot-product attention derived as a differentiable soft lookup [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/9a_attention_theory.ipynb)
  - [`9b_attention_practical.ipynb`](notebooks/9b_attention_practical.ipynb) — seq2seq with attention on a synthetic task, with attention heatmaps and masking [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/9b_attention_practical.ipynb)
- **Lesson 10**: The Transformer
  - [`10a_the_transformer_theory.ipynb`](notebooks/10a_the_transformer_theory.ipynb) — multi-head self-attention, positional encodings, residual+layer-norm blocks, and causal masking [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/10a_the_transformer_theory.ipynb)
  - [`10b_the_transformer_practical.ipynb`](notebooks/10b_the_transformer_practical.ipynb) — a decoder-only Transformer trained and compared against the Lesson 7 LSTM, with head/layer ablation [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/10b_the_transformer_practical.ipynb)

#### Large Language Models

- **Lesson 11**: Language Model Pretraining
  - [`11a_lm_pretraining_theory.ipynb`](notebooks/11a_lm_pretraining_theory.ipynb) — the autoregressive objective, cross-entropy and perplexity, scaling intuition, and a mini-GPT's forward pass [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/11a_lm_pretraining_theory.ipynb)
  - [`11b_lm_pretraining_practical.ipynb`](notebooks/11b_lm_pretraining_practical.ipynb) — a GPT-style model trained briefly and compared against Hugging Face GPT-2 inference [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/11b_lm_pretraining_practical.ipynb)
- **Lesson 12**: Fine-tuning and Adaptation
  - [`12a_finetuning_adaptation_theory.ipynb`](notebooks/12a_finetuning_adaptation_theory.ipynb) — full fine-tuning vs feature extraction; LoRA's low-rank update derived; catastrophic forgetting [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/12a_finetuning_adaptation_theory.ipynb)
  - [`12b_finetuning_adaptation_practical.ipynb`](notebooks/12b_finetuning_adaptation_practical.ipynb) — Hugging Face fine-tuning of a small encoder, and LoRA via PEFT [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/12b_finetuning_adaptation_practical.ipynb)
- **Lesson 13**: Alignment: RLHF and Preference Optimisation
  - [`13a_alignment_rlhf_theory.ipynb`](notebooks/13a_alignment_rlhf_theory.ipynb) — preference modelling and the Bradley-Terry reward model, derived; the RLHF loop; DPO derived [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/13a_alignment_rlhf_theory.ipynb)
  - [`13b_alignment_rlhf_practical.ipynb`](notebooks/13b_alignment_rlhf_practical.ipynb) — a reward model trained on a tiny preference set, DPO on a small language model, and a reproduced reward-hacking failure [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/13b_alignment_rlhf_practical.ipynb)

#### Generative Models and Efficiency

- **Lesson 14**: Generative Models
  - [`14a_generative_models_theory.ipynb`](notebooks/14a_generative_models_theory.ipynb) — autoencoders; the VAE ELBO and reparameterisation trick derived; the diffusion forward/reverse process derived [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/14a_generative_models_theory.ipynb)
  - [`14b_generative_models_practical.ipynb`](notebooks/14b_generative_models_practical.ipynb) — a VAE and a minimal diffusion model, trained and sampled from, on MNIST [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/14b_generative_models_practical.ipynb)
- **Lesson 15**: Efficient and Scalable Deep Learning
  - [`15a_efficient_scalable_theory.ipynb`](notebooks/15a_efficient_scalable_theory.ipynb) — compute/memory accounting; mixed precision; int8 quantisation derived; distillation [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/15a_efficient_scalable_theory.ipynb)
  - [`15b_efficient_scalable_practical.ipynb`](notebooks/15b_efficient_scalable_practical.ipynb) — automatic mixed precision, dynamic quantisation and distillation, measured against a full-precision baseline [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/15b_efficient_scalable_practical.ipynb)

#### Professional Practice

- **Lesson X1**: Debugging Deep Networks
  - [`X1_debugging_deep_networks.ipynb`](notebooks/X1_debugging_deep_networks.ipynb) — loss-curve taxonomy, gradient norms, dead ReLUs, overfit-one-batch, and NaN hunting [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/X1_debugging_deep_networks.ipynb)
- **Lesson X2**: Evaluation and Benchmarking
  - [`X2_evaluation_benchmarking.ipynb`](notebooks/X2_evaluation_benchmarking.ipynb) — splits and leakage, metrics beyond accuracy, calibration, and statistical comparison of runs [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/X2_evaluation_benchmarking.ipynb)
- **Lesson X3**: Deployment and Safety
  - [`X3_deployment_safety.ipynb`](notebooks/X3_deployment_safety.ipynb) — TorchScript/ONNX export, latency and throughput, monitoring and drift, robustness, and responsible use [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/X3_deployment_safety.ipynb)
- **Lesson X4**: Research Frontiers
  - [`X4_research_frontiers.ipynb`](notebooks/X4_research_frontiers.ipynb) — scaling laws, mixture of experts, state-space models, multimodal models, and interpretability [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/powell-clark/deep-learning/blob/main/notebooks/X4_research_frontiers.ipynb)

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
