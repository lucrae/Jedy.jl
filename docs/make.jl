using Documenter

using Jedy


makedocs(
    sitename = "Jedy.jl",
    modules = [Jedy],
    repo = "github.com/lucrae/Jedy.jl.git",
    pages = [
        "Home" => "index.md",
        "Introduction" => "introduction.md",
        "Getting Started" => "getting_started.md",
        "API" => "api.md",
        "Examples" => "examples.md"
    ]
)

deploydocs(
    repo = "github.com/lucrae/Jedy.jl.git",
)
