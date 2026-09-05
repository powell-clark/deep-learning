# Curriculum Plan

**Status**: ✅ Complete — all 36 notebooks shipped, verified, and linked from [README.md](README.md).

Sixteen lessons (0–15), each a theory (`a`) + practical (`b`) pair, plus four
professional-practice notebooks (X1–X4). Every theory notebook derives its subject from
first principles and implements the core algorithm from scratch in NumPy; every practical
notebook reproduces it with PyTorch or Hugging Face. Every notebook executes top-to-bottom
on CPU in under 10 minutes with fixed seeds, checked by `scripts/verify_notebook.sh` before
its task closed.

| # | Lesson | Theory covers | Practical covers | Data |
|---|---|---|---|---|
| 0 | Introduction to Deep Learning | What stacking non-linear layers buys; representation learning; the computational graph; a forward-only two-layer net | Tensors, autograd, `nn.Module`, the training-loop skeleton | MNIST |
| 1 | From Linear Models to Neurons | Perceptron → logistic regression as a one-layer net; loss surfaces; batch vs mini-batch vs SGD; learning-rate effects | The same model in PyTorch; `DataLoader`; overfit-one-batch sanity check | MNIST |
| 2 | Multilayer Perceptrons and Backpropagation | Chain rule → backprop for an L-layer MLP; manual gradients; gradient checking; sigmoid/tanh/ReLU derivatives | PyTorch MLP; autograd vs manual gradients | MNIST subset |
| 3 | Training Dynamics | Xavier/He initialisation derived; vanishing/exploding gradients; BatchNorm/LayerNorm; momentum, RMSProp, Adam derived | Init × norm × optimiser ablation; learning-rate schedules | CIFAR-10 subset |
| 4 | Regularisation and Generalisation | Bias–variance in deep nets; weight decay as L2; dropout as ensemble; early stopping; augmentation | Augmentation pipelines; dropout/weight-decay ablations; learning curves | CIFAR-10 subset |
| 5 | Convolutional Networks | Convolution as a linear operator; parameter sharing; padding/stride; receptive fields; pooling; backprop through conv | CNN on CIFAR-10 vs a dense baseline; feature-map visualisation | MNIST, CIFAR-10 |
| 6 | Modern Architectures and Transfer Learning | Residual connections and why they help; norm placement; architecture families | Fine-tune a pretrained torchvision ResNet; feature extraction vs full fine-tune | Small image set |
| 7 | Sequence Models | RNN forward pass and backpropagation through time; vanishing gradients; LSTM/GRU gates derived; character RNN from scratch | LSTM language model; teacher forcing; sampling with temperature | Tiny text corpus |
| 8 | Embeddings and Tokenisation | Distributional hypothesis; skip-gram with negative sampling derived; embedding geometry and analogies | Byte-pair encoding from scratch vs the `tokenizers` library; a pretrained embedding space visualised | Small corpus |
| 9 | Attention | The alignment problem; additive and scaled dot-product attention derived; attention as a differentiable soft lookup | Seq2seq with attention on a synthetic task; attention heatmaps; masking | Synthetic |
| 10 | The Transformer | Multi-head self-attention; positional encodings; residual + layer-norm blocks; causal masking; parameter counting | Decoder-only Transformer trained and compared against the Lesson 7 LSTM; head/layer ablation | Synthetic / tiny text |
| 11 | Language Model Pretraining | The autoregressive objective; cross-entropy and perplexity; scaling intuition; a mini-GPT's forward pass and loss | A GPT-style model trained briefly, then compared against Hugging Face GPT-2 inference | Tiny text corpus |
| 12 | Fine-tuning and Adaptation | Full fine-tuning vs feature extraction; LoRA's low-rank update derived; catastrophic forgetting | Hugging Face fine-tuning of a small encoder; LoRA via PEFT | Small sentiment subset |
| 13 | Alignment: RLHF and Preference Optimisation | Preference modelling; the Bradley-Terry reward model derived; the RLHF loop (linking to the reinforcement-learning series' PPO lesson); DPO derived | A reward model trained on a tiny preference set; DPO run on a small language model; a reproduced reward-hacking failure | Tiny preference set |
| 14 | Generative Models | Autoencoders; the VAE ELBO and the reparameterisation trick derived; the diffusion forward/reverse process derived | A VAE and a minimal diffusion model trained and sampled from | MNIST |
| 15 | Efficient and Scalable Deep Learning | Compute/memory accounting; mixed precision; int8 quantisation derived; distillation | Automatic mixed precision, dynamic quantisation and distillation measured directly against a full-precision baseline | CIFAR-10 subset |
| X1 | Debugging Deep Networks | Loss-curve taxonomy; gradient norms; dead ReLUs; overfit-one-batch; NaN hunting | | |
| X2 | Evaluation and Benchmarking | Splits and leakage; metrics beyond accuracy; calibration; statistical comparison of runs | | |
| X3 | Deployment and Safety | TorchScript/ONNX export; latency and throughput; monitoring and drift; robustness; responsible use | | |
| X4 | Research Frontiers | Scaling laws; mixture of experts; state-space models; multimodal models; interpretability | | |

File names follow the series convention: `notebooks/{n}a_{slug}_theory.ipynb`,
`notebooks/{n}b_{slug}_practical.ipynb`, `notebooks/X{n}_{slug}.ipynb` — see
[README.md](README.md) for the full table with Open-in-Colab links.

## Provenance

Built by autonomous Claude Code builder seats under the
[consciousness](https://github.com/powell-clark/consciousness) plugin, task by task, each
verified by `scripts/verify_notebook.sh` before its task closed. `CONSCIOUSNESS/` carries the
directive, stories, features, tasks and every review verdict for the full build history.
