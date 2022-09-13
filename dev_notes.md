# Documentation

## Generate documentation

```julia
using DocumenterTools
DocumenterTools.generate()
```

## Compile documentation HTML

```bash
julia docs/make.js
```

Will generate the web documentation in `docs/build/index.html`.

# Package commands

First of all, run `julia` and use `]` to enter package mode (`;` to go back), and activate Jedy in this REPL with `activate .`.

## Run tests

```
(Jedy) pkg> test
```

