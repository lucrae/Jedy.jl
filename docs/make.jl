using Documenter

using Jedy


makedocs(
    sitename = "Jedy.jl",
    modules = [Jedy],
    repo = "github.com/lucrae/Jedy.jl.git"
)

deploydocs(
    repo = "github.com/lucrae/Jedy.jl.git",
)
