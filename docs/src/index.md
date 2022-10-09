# Jedy.jl

> A Julia package for developing agent-based simulations & evolutionary dynamics.

Jedy provides fundamental tooling to work with agents and evolutionary algorithms, making use of Julia's speed and ease-of-development.

## Installation

Open the Julia REPL in your terminal with `julia`, type `]` to enter the Pkg mode, and run:

```
pkg> add https://github.com/lucrae/Jedy.jl.git
```

## Usage

Simply add `using Jedy` to the top of your script, for example:

```julia
using Jedy

a = Jedy.Agent("behaviour" => 1)
```

## Resources

- See [Introduction](@ref) for an in-depth explanation to Jedy's motivation and approach. 
- See [Examples](@ref) for examples of using Jedy.
- See [API](@ref) for complete documentation on Jedy's functions/types/etc.
