using HTTP, JSON
using Graphs

d = Dict(
    "graph"=>Dict("nv"=>10, "edges"=>[[e.src, e.dst] for e in edges(smallgraph(:petersen))]),
    "problem"=>"MaximalIS", 
    "property"=>"SizeMin",
)

res = HTTP.request("POST", "http://localhost:8000/generictensornetworks", [("Content-Type", "application/json")], JSON.json(d))
JSON.parse(String(res.body))