# Report

## Agent-based simulations

Agent-based simulations are a highly important scientific computing task in [game theory](https://en.wikipedia.org/wiki/Game_theory). Setting up theoretical agent-based models, these simulations play out the actions and interactions of autonomous agents in theoretical situations to prove or disprove hypotheses or reveal new insights into problems of social conflict, dilemmas, and cooperation.

## Scientific computing and Julia

The compromises between [low-level](https://en.wikipedia.org/wiki/Low-level_programming_language) and [high-level](https://en.wikipedia.org/wiki/High-level_programming_language) programming languages presents a challenge for [scientific computing](https://en.wikipedia.org/wiki/Computational_science).

Relatively lower-level languages (by modern stanards) such as C/C++ provide highly efficient performance, but because their design is oriented towards systems programming they have a strong specificity for low-level or “machine-oriented” operations such as memory allocation that bloats development time and makes them very unsuitable for fast or intuitive prototyping—an attribute very important for scientific computing.

Higher-level languages such as Python have consequently become popular in many areas of modern scientific computing due to a “friendlier” approach to readability and automation of low-level operations, but the implementation of being easy and dynamic, mainly through being interpreted—rather than compiled—also produces far less optimal performance. Especially in computing tasks that rely on optimised, repeated operations, such as simulations, the slowness of Python and other popular high-level languages produces magnitudes of inefficiency.

First appearing in 2012–relatively recent for a programming language–the Julia programming language has emerged as a solution to this rift between ease and performance, providing the high-level dynamic readability of Python, but through sophisticated design decisions such as a [just-in-time (JIT) compiler](https://en.wikipedia.org/wiki/Just-in-time_compilation) and [eager evaluation](https://en.wikipedia.org/wiki/Evaluation_strategy#Eager_evaluation), it delivers on the optimised performance seen by the likes of C/C++, [achieving petaFLOP computations](https://juliacomputing.com/case-studies/celeste/index.html). Julia, as a result, presents new and exciting potential for new works in scientific computing.

## The Jedy package

Jedy (name originating from from *J*ulia *E*volutionary *DY*namics) is a package for Julia that provides useful building blocks to run agent-based simuations. The primary focus is to provide abstractions that allow for quick, intuitive, and reliable development of agent-based ideas, and already implemented and tested functions to run commonly-used evolutionary algorithms such as imitation processes and Wright-Fisher evolution.

Jedy has been developed by [Lucien Rae Gentil](https://lucienrae.com) with the supervision and expertise of [Julián García](https://www.garciajulian.com/). The source code is open-source and available [here](https://github.com/lucrae/Jedy.jl), open to contributions, alongside thorough [documentation](https://lucrae.github.io/Jedy.jl/stable/).

For in-depth examples and complete documentation of Jedy's API:

- See [Examples](@ref) for examples of using Jedy.
- See [API](@ref) for complete documentation on Jedy's functions/types/etc.

## References and Resources

- Hindersin, L., Wu, B., Traulsen, A., &#38; García, J. (2019). Computation and Simulation of Evolutionary Game Dynamics in Finite Populations. *Scientific Reports*, *9*(1). [Open Access](https://doi.org/10.1038/s41598-019-43102-z).
- Traulsen, A., &#38; Hauert, C. (2009). Stochastic evolutionary game dynamics. *Reviews of Nonlinear Dynamics and Complexity*, *2*, 25–61. [PDF](https://arxiv.org/pdf/0811.3538.pdf).
- Xu, J., Garcia, J., &#38; Handfield, T. (2019). Cooperation with bottom-up reputation dynamics. *Proceedings of the 18th International Conference on Autonomous Agents and MultiAgent Systems*, 269–276. [PDF](https://www.ifaamas.org/Proceedings/aamas2019/pdfs/p269.pdf).