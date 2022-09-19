# To-do

[x] Create Julia package
[x] Set up documentation generation
[x] Write docstrings
[ ] Write simple tests
[ ] CSV
[ ] Running from command-line (pass a json file of parameters)

# Documentation

## Generate documentation

```julia
using DocumenterTools
DocumenterTools.generate()
```

## Compile documentation HTML

```bash
julia docs/make.jl
```

Will generate the web documentation in `docs/build/index.html`.

# Package commands

First of all, run `julia` and use `]` to enter package mode (`;` to go back), and activate Jedy in this REPL with `activate .`.

## Run tests

```
(Jedy) pkg> test
```

## Add dependency

```
(Jedy) pkg> add PACKAGE_NAME
```