module EvolutionProcesses
using Jedy

import Random


"""
    imitation_process!(agents, fitnesses, w)

Performs an (in-place) imitation process on some `agents` and their `fitnesses` with a given `w` value.

### Input

- `agents::Array{Jedy.Agent}` -- An array of `Agent` objects.
- `fitnesses::Array{Float64}` -- An array of floats corresponding to each agent.
- `w::Float64` -- The `w` factor between 0 and 1 for the imitation process.

"""
function imitation_process!(agents::Array{Jedy.Agent}, fitnesses::Array{Float64}, w::Float64)
    n = length(agents)
    pair_array = Random.shuffle(1:n)

    for i in 1:2:n-1
        f = pair_array[i]
        r = pair_array[i+1]
        
        p = 1/(1 + ℯ^(w*(fitnesses[f] - fitnesses[r])))
        if rand(Float64) <= p
            agents[f].body = deepcopy(agents[r].body)
        end
    end
end


"""
    create_imitation_processes(w)

Shorthand to create an imitation process function.
    
See [`Jedy.EvolutionProcesses.imitation_process!`](@ref) for more information.
"""
function create_imitation_process(args...) :: Function
    return (agents, fitnesses) -> imitation_process!(agents, fitnesses, args...)
end


end