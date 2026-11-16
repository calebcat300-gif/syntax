# Research and engineering roadmap

## Foundation
- [ ] C++ tensor shape, storage, validation and tests
- [ ] CPU matrix multiplication benchmark
- [ ] CMake builds and test infrastructure

## GPU
- [ ] CUDA build on GB10
- [ ] Compare CPU/GPU correctness
- [ ] Profile launch costs, compute and memory bandwidth

## Runtime
- [ ] First small supported model
- [ ] Tokenization, prefill, decode and sampling
- [ ] KV cache correctness and resource tracking

## Agent
- [ ] Original Go terminal renderer
- [ ] Agent tool permissions and sessions
- [ ] Streamed local inference responses

## Hyperstream research
- [ ] Real MoE expert routing traces
- [ ] Memory resident expert cache + NVMe I/O tests
- [ ] Exact vs approximate outputs
- [ ] Compression and latency experiments
