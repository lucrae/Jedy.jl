using Documenter

using Jedy


makedocs(
    sitename = "Jedy.jl",
    modules = [Jedy],
    repo = "github.com/lucrae/Jedy.jl.git",
    pages = [
        "Home" => "index.md",
        "Usage" => "usage.md",
        "API" => "api.md",
        "Examples" => "examples.md"
    ]
)

deploydocs(
    repo = "github.com/lucrae/Jedy.jl.git",
)
