module Jedy

using Formatting


"""
    Agent(body[, body_hidden])

Basic struct for a single agent.

### Fields

- `body` -- A `Dict` or `Array` data structure of attributes of the agent able to be involved in an evolutionary process.
- (OPTIONAL) `body_hidden` -- A `Dict` or `Array` data structure of attributes that will not be mutated/imitated/involved if the agent is used in an evolutionary process.

### Examples

```
julia> simple_agent = Jedy.Agent(Dict("behaviour" => 3))
julia> complex_agent = Jedy.Agent(Dict("behaviour" => 3, "colour" => 2), body_hidden=Dict("reputation) => 1))
```

""" 
mutable struct Agent
    body::Union{Dict, Array}
    body_hidden::Union{Nothing, Dict, Array}

    # Constructor
    function Agent(body, body_hidden=nothing)
        new(body, body_hidden)
    end
end


"""
    run_simulation!(agents, fitnesses_computer, evolutionary_process!, n_epochs)

Runs a simulation.

!!! note

    This is *in-place* for memory conservation, so the original `agents` array is mutated. Deep copy if there is a reason to preserve the original.

### Input

- `agents::Array{Agent}` -- An array of `Agent` objects.
- `fitness_computer::Function` -- A function that takes in an `Array{Agent}` and returns an `Array{Float64}` of the same length.
- `evolutionary_process!::Function` -- An in-place function that takes in an `Array{Agent}` and `Array{Float64}` of the same length and performs an evolutionary process on the `Array{Agent}`. 
- `n_epcohs::Int` -- The number of epochs (iterations) to run on the agents.

"""
function run_simulation!(agents::Array{Agent},
                         fitnesses_computer::Function,
                         evolutionary_process!::Function,
                         n_epochs::Int)

    for _ in 1:n_epochs
        fitnesses = fitnesses_computer(agents)
        evolutionary_process!(agents, fitnesses)
    end
end

# =============================================================================
# Submodules
# =============================================================================

include("EvolutionProcesses.jl")


# End module
end 