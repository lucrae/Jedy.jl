# To-do

[x] Create Julia package
[x] Set up documentation generation
[ ] Write docstrings
[ ] Set up testing system


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

## Install local dev package

```
(Jedy) pkg> dev .
```

## Run tests

```
(Jedy) pkg> test
```

## Add dependency

```
(Jedy) pkg> add PACKAGE_NAME
```