using Documenter
using Jedy

makedocs(
    sitename = "Jedy",
    format = Documenter.HTML(),
    modules = [Jedy]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
