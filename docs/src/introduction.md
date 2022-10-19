# Background

## Game theory

The field of [game theory](https://en.wikipedia.org/wiki/Game_theory) studies the strategic interactions between (agents)[[https://en.wikipedia.org/wiki/Rational_agent](https://en.wikipedia.org/wiki/Rational_agent)], most commonly analysing the behaviour resulting from models of actions and payoffs. The analysis of game theory scenarios lead into the reasoning real-world complex systems in economics, political science, biology, computing, and social structures, primarily dissecting processes of decision making and behavioural relations.

## **Agent-based simulation**

Agent-based simulations are a highly important scientific computing task in game theory. While mathematical analysis can provide closed-form or sound theoretical results to problems, developing and running simulations to play out the actions and interactions of autonomous agents in the theoretical of game theory are extremely useful in proving or disproving hypotheses, or revealing new insights into the model and the greater problems of social conflict, dilemmas, and cooperation that the model represents.

## **Scientific computing and the Julia language**

The compromises between [low-level](https://en.wikipedia.org/wiki/Low-level_programming_language) and [high-level](https://en.wikipedia.org/wiki/High-level_programming_language) programming languages presents a challenge for [scientific computing](https://en.wikipedia.org/wiki/Computational_science).

Relatively lower-level languages (by modern standards) such as C/C++ provide highly efficient performance, but because their design is oriented towards systems programming they have a strong specificity for low-level or “machine-oriented” operations such as memory allocation that bloats development time and makes them very unsuitable for fast or intuitive prototyping—an attribute very important for scientific computing.

Higher-level languages such as Python have consequently become popular in many areas of modern scientific computing due to a “friendlier” approach to readability and automation of low-level operations, but the implementation of being easy and dynamic, mainly through being interpreted—rather than compiled—also produces far less optimal performance. Especially in computing tasks that rely on optimised, repeated operations, such as simulations, the slowness of Python and other popular high-level languages produces magnitudes of inefficiency.

First appearing in 2012–relatively recent for a programming language–the Julia programming language has emerged as a solution to this rift between ease and performance, providing the high-level dynamic readability of Python, but through sophisticated design decisions such as a [just-in-time (JIT) compiler](https://en.wikipedia.org/wiki/Just-in-time_compilation) and [eager evaluation](https://en.wikipedia.org/wiki/Evaluation_strategy#Eager_evaluation), it delivers on the optimised performance seen by the likes of C/C++, [achieving petaFLOP computations](https://juliacomputing.com/case-studies/celeste/index.html). Julia, as a result, presents new and exciting potential for new works in scientific computing.

# Design of the **Jedy package**

Jedy (name originating from from **J**ulia **E**volutionary **DY**namics) is a package developed to provide a lightweight framework for building reliable and efficient agent-based simulations in Julia.

The primary focus is to provide abstractions that allow for quick, intuitive, and reliable development of agent-based ideas, as well as already implemented and tested functions to run commonly-used evolutionary algorithms such as imitation processes and Wright-Fisher evolution.

A very important aspect to the development of this package is an understanding of Julia’s design as a language, aiming for Jedy to be *idiomatic* to the language to fully leverage its strengths.

## Typing

The [type system]([https://en.wikipedia.org/wiki/Type_system](https://en.wikipedia.org/wiki/Type_system)) of a programming language regulates the usage of different data types/structures in a program. Formally, Julia is *strongly typed*, that is each variable/object must remain the same type in its lifetime (as opposed to weak, like Python, where terms can change type), and *dynamically type-checked*, that is the validity of this typing is checked at run-time (as opposed to static type-checking, like C++, done at compile time).

Dynamic type checking allows the types of variables to be “inferred”, such that Julia variables can be defined like such:

```julia
a = 4
```

While convenient, a notable concern is the ambiguity of variable types, especially in the context of parameters of functions where using the correct type may be useful, or different types may require different functions (overloading). To solve this, Julia allows for rich, in-built type hinting. For example:

```julia
function divide(a::Int, b::Int) :: Float64
    return a/b
end
```

Here it is clear that the divide function will take in two integers, and return a floating point number. 

For the goal of “reliability” for Jedy, this element of Julia is highly important. Consider: 

```julia
function imitation_process!(agents::Array{Jedy.Agent},
                            fitnesses::Array{Float64},
                            w::Float64)
    # ...
end
```

In this function all the types are clearly set out, including the core custom type of the “Agent.” Also note there is no returning type, thus this function does not return anything, and the Julia convention of this function’s naming using a “!” makes the clear that it uses in-place operations on the parameter types (i.e. the mutable array of agents can be manipulated).

The philosophy of clear typing, even when the implicit typing is possible, is the clear *Julianic* way of a package such as Jedy to promote reliability.

## Composition over inheritance

While (object-oriented)[[https://en.wikipedia.org/wiki/Object-oriented_programming](https://en.wikipedia.org/wiki/Object-oriented_programming)] languages such as Java will greatly favour (inheritance)[[https://en.wikipedia.org/wiki/Inheritance_(object-oriented_programming)](https://en.wikipedia.org/wiki/Inheritance_(object-oriented_programming))], using children of parents to represent sophisticated objects, [Julia does not support inheritance]([https://discourse.julialang.org/t/composition-and-inheritance-the-julian-way/11231](https://discourse.julialang.org/t/composition-and-inheritance-the-julian-way/11231)). Instead, there aren’t sophisticated objects, rather sophisticated combinations of objects, most ideally implemented [functionally]([https://en.wikipedia.org/wiki/Functional_programming](https://en.wikipedia.org/wiki/Functional_programming)) (that is, using functions).

For Jedy, this means not creating seperate special different types of `Agent`s or encapsulating simulations within an object, but rather focusing on various functions and specifying what types can be given to them. For scientific computing, this approach has a huge advantage on reliability, and at times efficiency when evading overly-clunky object operations, by minimising the complexity of relationships.

## Thorough documentation

Documentation is extremely important to a package’s utility. For Jedy, a modern use of Julia’s `Documenter.jl` was used to generate a detailed static website, found [here]([https://lucrae.github.io/Jedy.jl/stable/](https://lucrae.github.io/Jedy.jl/stable/)) in a conventional documentation structure with an introduction, usage, examples, as well as API documentation generated from Jedy's in-script docstrings with the `@autodocs` feature. Paired with the use of tagging to clearly version documentation, this makes for a thorough resource to learn and understand Jedy with easy scalibility to future developments.

## Open-sourcing

Julia makes a very interesting choice for packages (importable libraries/tools developed for Julia) to naturally be git repositories (contribution/version control directories). As this makes open-sourcing extremely easy, almost every Julia repository is open-source. Jedy is no different, and the source-code is accessible and able to be contributed to [here](https://github.com/lucrae/Jedy.jl).

## Logging customisation

Being able to record intermediate and resulting data is key to scientific computing, so Julia implements as a first-class feature the use of a custom log, with the flexible solution of providing a function that takes in the agents and returns some array that will constitute each line in the outputted CSV.

## Example

The [Prisoner's Dilemma](https://en.wikipedia.org/wiki/Prisoner%27s_dilemma) is a staple problem in game theory. Two agents must choose to either defect or cooperate with the other, without knowing the others' choice, where defecting when the other cooperates provides the highest reward `T` and lowest `S` to the other, but both defecting provides a low reward `P`, and both cooperating provides a decent reward `R` such that `T > R > P > S`. The key insight from analysing behaviour in the prisoner's dilemma is that agents will tend to defect instead of cooperate as the [Nash Equilibrium](https://en.wikipedia.org/wiki/Nash_equilibrium), even though this will result in an overall worse payoff in the end than cooperation. This is of fundamental interest to the study of how unoptimal consequences of cooperation/defection in the real world can occur.

We can use Jedy to simulate agents playing the repeated [Prisoner's Dilemma](https://en.wikipedia.org/wiki/Prisoner%27s_dilemma) with an evolutionary process to see the success of defecting vs. cooperating.

### 1. Define population

First, let's make a population of 100 agents with a randomly-assigned boolean attribute "`behaviour`" that defines if they defect (true) or cooperate (false):

```julia
import Jedy
import Random

N = 100
agents = Array{Jedy.Agent}(undef, N)
for i in 1:N
    agents[i] = Jedy.Agent(Dict("behaviour" => rand(Bool)))
end
```

### 2. Define way of determining payoffs/fitness

We use a straight-forward function for two agents to play the Prisoner's Dilemma:

```julia
function play_prisoners_dilemma(agent_a::Jedy.Agent, agent_b::Jedy.Agent) :: Tuple{Int, Int}
    T, R, P, S = 3, 2, 1, 0
    action_a = agent_a.body["behaviour"]
    action_b = agent_b.body["behaviour"]
    if action_a && action_b
        return (P, P)
    elseif action_a && !action_b
        return (T, S)
    elseif !action_a && action_b
        return (S, T)
    else
        return (R, R)
    end
end
```

We can then use this for our `compute_fitness` function. Here we compute fitness by the total payoff each agent accumulates against 1000 random opponents.

```julia
function compute_fitnesses(agents::Array{Jedy.Agent}) :: Array{Float64}
    n = length(agents)
    fitnesses = zeros(n)

    for f in 1:n
        for _ in 1:100 # Agent[f] plays 100 prisoner's dilemmas
            r = f
            while r == f # Pick non-self opponent
                r = rand(1:n)
            end
            payoff_f, payoff_r = play_prisoners_dilemma(agents[f], agents[r])
            fitnesses[f] += payoff_f
            fitnesses[r] += payoff_r
        end
    end
    return fitnesses
end
```

### 3. Define evolution process

Let's use an [imitation process](https://journals.aps.org/pre/abstract/10.1103/PhysRevE.84.046111).

```julia
# Imitation process with w=0.2 (weak selection)
imitation_process! = Jedy.EvolutionProcesses.create_imitation_process(0.2)
```

### 4. Run simulation!

Here we do 200 epochs:

```julia
Jedy.run_simulation!(agents,
                     compute_fitnesses,
                     imitation_process!,
                     200)
```

### (Optional) Logging to CSV

It's very useful to be able to log values from each epoch's agents. We can add a highly-customisable logger function easily:

```julia
# Logs the behaviour of each agent
function logger(agents::Array{Jedy.Agent})
    vals = map(a -> a.body["behaviour"], agents)
    return "temp.log", vals
end

# Run simulation with logger
Jedy.run_simulation!(agents,
                     compute_fitnesses,
                     perform_imitation_process!,
                     200,
                     logger)
```

Full code available [here](https://github.com/lucrae/Jedy.jl/tree/master/examples/pd_imitation.jl).

# Future work

The project so far has been on the groundwork and approach of Jedy, but there are many more features and developments that could contribute well to the package in future work. Most prominently:

- Implementation of more evolutionary processes.

- Direct visualisation tools (i.e. shorthands for common plots).

- Advanced debugging (i.e. customisable verification tools).

As [Jedy is open-source](https://github.com/lucrae/Jedy.jl), the progression of new features are clear, and of course open to contributions as a living project.