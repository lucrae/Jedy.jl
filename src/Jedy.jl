module Jedy

using CSV, Tables, Formatting, ProgressBars


"""
    Agent(body[, body_hidden])

Basic struct for a single agent.

### Fields

- `body` -- A `Dict` or `Array` data structure of attributes of the agent able to be involved in an evolutionary process.
- *(Optional)* `body_hidden` -- A `Dict` or `Array` data structure of attributes that will not be mutated/imitated/involved if the agent is used in an evolutionary process.

### Examples

```julia
using Jedy

# An agent with a simple body of normal attributes.
simple_agent = Jedy.Agent(Dict("behaviour" => 3))

# An agent with some normal (sharable) attributes and some hidden attributes.
complex_agent = Jedy.Agent(
    Dict("behaviour" => 3, "colour" => 2),
    body_hidden=Dict("reputation") => 1
)
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
- *(Optional)* `logger::Function` -- A function that takes in an `Array{Agent}` and returns a `Tuple{String, Array}` of a csv/log/txt file name and 1D-array of values to be written each epoch. Warning: currently slightly performance-heavy.

"""
function run_simulation!(agents::Array{Agent},
                         fitnesses_computer::Function,
                         evolutionary_process!::Function,
                         n_epochs::Int,
                         logger::Union{Function, Nothing}=nothing)

    # Initial log
    if !isnothing(logger)
        csv_file_name, vals = logger(agents)
        CSV.write(csv_file_name, Tables.table(transpose(hcat(vals))), writeheader=false)
    end

    # Run epochs
    for _ in ProgressBar(1:n_epochs)
        # Single epoch of simulation
        fitnesses = fitnesses_computer(agents)
        evolutionary_process!(agents, fitnesses)

        # Log
        if !isnothing(logger)
            csv_file_name, values = logger(agents)
            CSV.write(csv_file_name, Tables.table(transpose(hcat(vals))), writeheader=false, append=true)
        end
    end

    
end

# =============================================================================
# Submodules
# =============================================================================

include("EvolutionProcesses.jl")


# End module
end 