var documenterSearchIndex = {"docs":
[{"location":"api/#API","page":"API","title":"API","text":"","category":"section"},{"location":"api/","page":"API","title":"API","text":"Documentation of the functions/structs/etc. of the Jedy API.","category":"page"},{"location":"api/#Base","page":"API","title":"Base","text":"","category":"section"},{"location":"api/","page":"API","title":"API","text":"Modules = [Jedy]","category":"page"},{"location":"api/#Jedy.Agent","page":"API","title":"Jedy.Agent","text":"Agent(body[, body_hidden])\n\nBasic struct for a single agent.\n\nFields\n\nbody – A Dict or Array data structure of attributes of the agent able to be involved in an evolutionary process.\n(Optional) body_hidden – A Dict or Array data structure of attributes that will not be mutated/imitated/involved if the agent is used in an evolutionary process.\n\nExamples\n\nusing Jedy\n\n# An agent with a simple body of normal attributes.\nsimple_agent = Jedy.Agent(Dict(\"behaviour\" => 3))\n\n# An agent with some normal (sharable) attributes and some hidden attributes.\ncomplex_agent = Jedy.Agent(\n    Dict(\"behaviour\" => 3, \"colour\" => 2),\n    body_hidden=Dict(\"reputation\") => 1\n)\n\n\n\n\n\n","category":"type"},{"location":"api/#Jedy.run_simulation!","page":"API","title":"Jedy.run_simulation!","text":"run_simulation!(agents, fitnesses_computer, evolutionary_process!, n_epochs)\n\nRuns a simulation.\n\nnote: Note\nThis is in-place for memory conservation, so the original agents array is mutated. Deep copy if there is a reason to preserve the original.\n\nInput\n\nagents::Array{Agent} – An array of Agent objects.\nfitness_computer::Function – A function that takes in an Array{Agent} and returns an Array{Float64} of the same length.\nevolutionary_process!::Function – An in-place function that takes in an Array{Agent} and Array{Float64} of the same length and performs an evolutionary process on the Array{Agent}. \nn_epcohs::Int – The number of epochs (iterations) to run on the agents.\n(Optional) logger::Function – A function that takes in an Array{Agent} and returns a Tuple{String, Array} of a csv/log/txt file name and 1D-array of values to be written each epoch. Warning: currently slightly performance-heavy.\n\n\n\n\n\n","category":"function"},{"location":"api/#Evolution-Processes","page":"API","title":"Evolution Processes","text":"","category":"section"},{"location":"api/","page":"API","title":"API","text":"Modules = [Jedy.EvolutionProcesses]","category":"page"},{"location":"api/#Jedy.EvolutionProcesses.create_imitation_process-Tuple","page":"API","title":"Jedy.EvolutionProcesses.create_imitation_process","text":"create_imitation_processes(w)\n\nShorthand to create an imitation process function.\n\nSee Jedy.EvolutionProcesses.imitation_process! for more information.\n\n\n\n\n\n","category":"method"},{"location":"api/#Jedy.EvolutionProcesses.imitation_process!-Tuple{Array{Jedy.Agent, N} where N, Array{Float64, N} where N, Float64}","page":"API","title":"Jedy.EvolutionProcesses.imitation_process!","text":"imitation_process!(agents, fitnesses, w)\n\nPerforms an (in-place) imitation process on some agents and their fitnesses with a given w value.\n\nInput\n\nagents::Array{Jedy.Agent} – An array of Agent objects.\nfitnesses::Array{Float64} – An array of floats corresponding to each agent.\nw::Float64 – The w factor between 0 and 1 for the imitation process.\n\n\n\n\n\n","category":"method"},{"location":"#Jedy.jl","page":"Jedy.jl","title":"Jedy.jl","text":"","category":"section"},{"location":"","page":"Jedy.jl","title":"Jedy.jl","text":"Julia Evolutionary Dynamics","category":"page"},{"location":"","page":"Jedy.jl","title":"Jedy.jl","text":"warning: Warning\nUnder construction...","category":"page"},{"location":"#Contents","page":"Jedy.jl","title":"Contents","text":"","category":"section"},{"location":"","page":"Jedy.jl","title":"Jedy.jl","text":"Pages = [\"api.md\"]","category":"page"}]
}