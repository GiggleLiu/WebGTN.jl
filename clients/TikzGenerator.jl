using TikzGenerator
using HTTP, JSON

# application: generate a svg picture
tikz = canvas() do c
    vertex!(c, 0.2, 0.3; shape="circle")
end |> generate_standalone

#IP = "http://localhost:8000"
IP = "http://alg-hub.com:8000"

function remotecall(IP::String, PKG::String, dict::AbstractDict)
    res = HTTP.request("POST", "$IP/$PKG", [("Content-Type", "application/json")], JSON.json(dict))
    JSON.parse(String(res.body))
end

# print available keys and its verifier
println(remotecall(IP, "TikzGenerator", Dict("tex"=>tikz))["svg"])