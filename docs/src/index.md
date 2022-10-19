# Jedy.jl

> A Julia package for developing agent-based simulations & evolutionary dynamics.

Jedy provides fundamental tooling to work with agents and evolutionary algorithms, making use of Julia's speed and ease-of-development.

- See [Introduction](@ref) for an in-depth explanation to Jedy's motivation and approach.
- See [Examples](@ref) for examples of using Jedy.
- See [API](@ref) for complete documentation on Jedy's functions/types/etc.

## Installation

Open the Julia REPL in your terminal with `julia`, type `]` to enter the Pkg mode, and run:

```
pkg> add https://github.com/lucrae/Jedy.jl.git
```

## Usage

Simply import `Jedy` and use the functions/types in the [API](@ref). For example:

```julia
import Jedy

a = Jedy.Agent("behaviour" => 1)
```

---

Latest release:

[![Version](https://shields.io/github/v/release/lucrae/Jedy.jl?display_name=tag)](https://github.com/lucrae/Jedy.jl/releases) [![Docs](https://img.shields.io/badge/docs-stable-blue.svg)](https://lucrae.github.io/Jedy.jl/stable)  [![Tests](https://github.com/lucrae/Jedy.jl/actions/workflows/tests.yml/badge.svg)](https://github.com/lucrae/Jedy.jl/actions/workflows/tests.yml) [![Documentation](https://github.com/lucrae/Jedy.jl/actions/workflows/documentation.yml/badge.svg)](https://lucrae.github.io/Jedy.jl)

Open-sourced on [GitHub](https://github.com/lucrae/Jedy.jl).