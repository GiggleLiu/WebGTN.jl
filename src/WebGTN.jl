module WebGTN

using Genie, Genie.Router, Genie.Requests, Genie.Renderer.Json
using HTTP, JSON

include("serve.jl")
include("client.jl")

end
