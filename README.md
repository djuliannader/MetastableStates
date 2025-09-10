# MetastableStates
This repository provides code for the analysis of metastable (Gamow) states arising in the quantum escape problem


clone as:


```bash
git clone https://github.com/djuliannader/InvertedOscillator.git
```

## Data 

This repository provides the scripts for the paper "Wigner Negativity as a Signature of Quantum Escape from Metastable States", by D. J. Nader. The paper is currently in progress.

The repository is currently being developed; please await its completion.  The src directory contains Julia scripts for obtaining metastable states via complex scaling and for computing the corresponding Wigner function.

## Environment Requirements  

To run this repository, please make sure the following environment is available:

- LinearAlgebra (stdlib)  
- HCubature
- QuantumOptics

## Usage  

- Metastable state for a particular scaling (theta) parameter:

Edit the parameters in MetastableState.jl and run:

```bash
julia MetastableState.jl
```

- Stability of the metastable states with respect to the scaling parameter (theta)

Edit the parameters in Stability_MetastableState.jl and run:

```bash
julia Stability_MetastableState.jl
```
