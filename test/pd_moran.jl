import Random

import Jedy


function play_prisoners_dilemma(agent_a::Jedy.Agent, agent_b::Jedy.Agent) :: Tuple{Int, Int}
    # Payoff values where T > R > P > S
    T, R, P, S = 3, 2, 1, 0

    # Get actions (true, false)=(defects, cooperates)
    action_a = agent_a.body["behaviour"]
    action_b = agent_b.body["behaviour"]
    
    # Return payoffs from actions (true is defect, false is cooperate)
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


function compute_prisoners_dilemma_fitnesses(agents::Array{Jedy.Agent}) :: Array{Float64}
    n = length(agents)
    fitnesses = zeros(n)

    for f in 1:n
        # Agent[f] plays 1000 prisoner's dilemmas
        for _ in 1:1000
            r = f
            while r == f
                r = rand(1:n)
            end
            payoff_f, payoff_r = play_prisoners_dilemma(agents[f], agents[r])
            fitnesses[f] += payoff_f
            fitnesses[r] += payoff_r
        end
    end
    return fitnesses
end


evolution! = Jedy.EvolutionProcesses.create_moran_process(1.0)


# Create set of agents
n = 6
agents = Array{Jedy.Agent}(undef, n)
for i in 1:n
    # Create agent, behaviour=(true, false)=(defects, cooperates)
    agents[i] = Jedy.Agent(Dict("behaviour" => rand(Bool)))
end


println(agents)


fitnesses = compute_prisoners_dilemma_fitnesses(agents)

evolution!(agents, fitnesses)


# Jedy.run_simulation!(agents,
#                      compute_prisoners_dilemma_fitnesses,
#                      evolution!,
#                      1,
#                      nothing)

println(agents)