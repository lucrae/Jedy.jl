# Introduction

## Scientific computing and Julia

The compromises between [low-level](https://en.wikipedia.org/wiki/Low-level_programming_language) and [high-level](https://en.wikipedia.org/wiki/High-level_programming_language) programming languages presents a challenge for [scientific computing](https://en.wikipedia.org/wiki/Computational_science).

Relatively lower-level languages (by modern stanards) such as C/C++ provide highly efficient performance, but because their design is oriented towards systems programming they have a strong specificity for low-level or “machine-oriented” operations such as memory allocation that bloats development time and makes them very unsuitable for fast or intuitive prototyping—an attribute very important for scientific computing.

Higher-level languages such as Python have consequently become popular in many areas of modern scientific computing due to a “friendlier” approach to readability and automation of low-level operations, but the implementation of being easy and dynamic, mainly through being interpreted—rather than compiled—also produces far less optimal performance. Especially in computing tasks that rely on optimised, repeated operations, such as simulations, the slowness of Python and other popular high-level languages produces magnitudes of inefficiency.

First appearing in 2012–relatively recent for a programming language–the Julia programming language has emerged as a solution to this rift between ease and performance, providing the high-level dynamic readability of Python, but through sophisticated design decisions such as a [just-in-time (JIT) compiler](https://en.wikipedia.org/wiki/Just-in-time_compilation) and [eager evaluation](https://en.wikipedia.org/wiki/Evaluation_strategy#Eager_evaluation), it delivers on the optimised performance seen by the likes of C/C++, [achieving petaFLOP computations](https://juliacomputing.com/case-studies/celeste/index.html). Julia, as a result, presents new and exciting potential for new works in scientific computing.

## Agent-based simulations

Agent-based simulations are a highly important computational task in [game theory](https://en.wikipedia.org/wiki/Game_theory). Setting up theoretical agent-based models, these simulations play out the actions and interactions of autonomous agents in theoretical situations to prove or disprove hypotheses or reveal new insights into problems of social conflict, dilemmas, and cooperation.

## The Jedy package

Jedy (name originating from from *J*ulia *E*volutionary *DY*namics) is a package for Julia that provides useful building blocks to run agent-based simuations. The primary focus is to provide abstractions that allow for quick, intuitive, and reliable development of agent-based ideas, and already implemented and tested functions to run commonly-used evolutionary algorithms such as imitation processes and Wright-Fisher evolution.

## Development

Jedy has been developed by [Lucien Rae Gentil](https://lucienrae.com) with the supervision and expertise of [Julian Garcia](https://www.garciajulian.com/). The source code is open-source and available [here](https://github.com/lucrae/Jedy.jl), open to contributions, alongside thorough [documentation](https://lucrae.github.io/Jedy.jl/stable/).
