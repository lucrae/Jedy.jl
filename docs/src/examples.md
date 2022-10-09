# Examples

Full code can be found on [GitHub](https://github.com/lucrae/Jedy.jl/tree/master/examples).

## The Prisoner's Dilemma

We can use Jedy to simulate agents playing the repeated [Prisoner's Dilemma](https://en.wikipedia.org/wiki/Prisoner%27s_dilemma) and an evolutionary process to see the success of defecting vs. cooperating.

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
