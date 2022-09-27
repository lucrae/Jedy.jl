using Documenter

using Jedy


makedocs(
    sitename = "Jedy",
    modules = [Jedy],
    repo = "github.com/lucrae/Jedy.jl.git"
)

deploydocs(
    repo = "github.com/lucrae/Jedy.jl.git",
)
