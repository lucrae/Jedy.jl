# To-do

[x] Create Julia package
[x] Set up documentation generation
[x] Write docstrings
[x] CSV logging
[x] Progress bar
[x] Deploy documentation
[x] Documentation - Introduction
[ ] Wright-Fisher evolutionary process
[ ] Examples
[ ] Optimise CSV logging (dataframe -> CSV)
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

## Install local dev package (to run scripts using Jedy)

```
(@) pkg> dev .
```

## Run tests

```
(Jedy) pkg> test
```

## Add dependency

```
(Jedy) pkg> add PACKAGE_NAME
```
