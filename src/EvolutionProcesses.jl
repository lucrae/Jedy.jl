module EvolutionProcesses
using Jedy

import Random


"""
    imitation_process!(agents, fitnesses, w)

Performs an (in-place) imitation process on some `agents` and their `fitnesses` with a given `w` intensity of selection.

### Input

- `agents::Array{Jedy.Agent}` -- An array of `Agent` objects.
- `fitnesses::Array{Float64}` -- An array of floats corresponding to each agent.
- `w::Float64` -- The intensity of selection (between 0 and 1).
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
    moran_process!(agents, fitnesses, w)

Performs an (in-place) moran process on some `agents` and their `fitnesses` with a given `w` intensity of selection.

### Input

- `agents::Array{Jedy.Agent}` -- An array of `Agent` objects.
- `fitnesses::Array{Float64}` -- An array of floats corresponding to each agent.
- `w::Float64` -- The intensity of selection (between 0 and 1).
"""
function moran_process!(agents::Array{Jedy.Agent}, fitnesses::Array{Float64}, w::Float64)
    error("unimplemented")

    # Java implementation for reference:
    # https://github.com/juliangarcia/agentbased/blob/master/agentbased/src/main/java/com/evolutionandgames/agentbased/extensive/AgentBasedWrightFisherProcessWithAssortment.java

    n = length(agents)
    moran_fitnesses = 1 - w .+ w * fitnesses


end

# =============================================================================
# SHORTHANDS
# =============================================================================

"""
    create_imitation_process(w)

Shorthand to create an imitation process function. See [`Jedy.EvolutionProcesses.imitation_process!`](@ref).

### Input

- `w::Float64` -- The intensity of selection (between 0 and 1).
"""
function create_imitation_process(args...) :: Function
    return (agents, fitnesses) -> imitation_process!(agents, fitnesses, args...)
end


"""
    create_moran_process(w)

Shorthand to create a moran process function. See [`Jedy.EvolutionProcesses.moran_process!`](@ref).

### Input

- `w::Float64` -- The intensity of selection (between 0 and 1).
"""
function create_moran_process(args...)
    return (agents, fitnesses) -> moran_process!(agents, fitnesses, args...)
end








end