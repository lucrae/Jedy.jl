using Documenter

using Jedy


makedocs(
    sitename = "Jedy.jl",
    modules = [Jedy],
    repo = "github.com/lucrae/Jedy.jl.git",
    pages = [
        "Home" => "index.md",
        "Examples" => "examples.md",
        "API" => "api.md",
        "Report" => "report.md"
    ]
)

deploydocs(
    repo = "github.com/lucrae/Jedy.jl.git",
)
