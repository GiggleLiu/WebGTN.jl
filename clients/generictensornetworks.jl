using WebGTN
using Graphs

# specify the task
d = Dict(
    "graph"=>Dict("nv"=>10, "edges"=>[[e.src, e.dst] for e in edges(smallgraph(:petersen))]),
    "problem"=>"MaximalIS", 
    "property"=>"SizeMin",
)

res = WebGTN.remotecall("http://localhost:8000", "GenericTensorNetworks", d)