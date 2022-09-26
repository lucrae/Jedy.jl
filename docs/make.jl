using Documenter

using Jedy


makedocs(
    sitename = "Jedy.jl",
    modules = [Jedy],
    repo = "github.com/lucrae/Jedy.jl.git"
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
