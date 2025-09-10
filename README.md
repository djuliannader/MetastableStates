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

To run the code, navigate to the /src folder and execute the corresponding file:

- Transmission probabilities and Wigner function

Edit the parameters in Probabilities_Fock.jl and run:

```bash
julia Probabilities_Fock.jl
```

- Absolute volume of the Wigner function in the classically forbiden region

Edit the parameters in Wigner_Volume.jl and run:

```bash
julia Wigner_Volume.jl
```