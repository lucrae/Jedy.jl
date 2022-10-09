import Random

import Jedy


# Create set of agents
N = 100
agents = Array{Jedy.Agent}(undef, N)
for i in 1:N
    # Create agent, behaviour=(true, false)=(defects, cooperates)
    agents[i] = Jedy.Agent(Dict("behaviour" => rand(Bool)))
end


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


function compute_fitnesses(agents::Array{Jedy.Agent}) :: Array{Float64}
    n = length(agents)
    fitnesses = zeros(n)

    for f in 1:n
        # Agent[f] plays 1000 prisoner's dilemmas
        for _ in 1:100
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


perform_imitation_process! = Jedy.EvolutionProcesses.create_imitation_process(0.2)


# Create logger
function logger(agents::Array{Jedy.Agent})
    vals = map(a -> a.body["behaviour"], agents)
    return "temp.log", vals
end


Jedy.run_simulation!(agents,
                     compute_fitnesses,
                     perform_imitation_process!,
                     200)

println(agents)