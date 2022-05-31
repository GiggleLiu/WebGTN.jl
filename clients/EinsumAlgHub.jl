using Graphs
using HTTP, JSON

# application 1: solve the graph property
d_solve = Dict(
    "api"=>"solve",
    "api.solve" => Dict(
        "graph"=>Dict("nv"=>10, "edges"=>[[e.src, e.dst] for e in edges(smallgraph(:petersen))]),
        "problem"=>"MaximalIS", 
        "property"=>"SizeMin",
    )
)

# application 2: access predefined graphs
d_graph = Dict(
    "api"=>"graph",
    "api.graph" => Dict(
        "type"=>"kings",
        "type.kings"=> Dict(
            "m"=>8, 
            "n"=>8, 
            "filling"=>0.8,
            "seed"=>2
        )
    )
)

# application 3: einsum contraction order optimization
d_opteinsum = Dict("api"=>"opteinsum",
    "api.opteinsum" => Dict(
        "inputs"=>[[1,2], [2,3], [3,4], [5,4]],
        "output"=>[1,5],
        "method"=>"TreeSA",
        "sizes"=>[[1, 2], [2, 2], [3, 2],
            [4, 2], [5, 2]]
    )
)

#IP = "http://localhost:8000"
IP = "http://alg-hub.com:8000"

function remotecall(IP::String, PKG::String, dict::AbstractDict)
    res = HTTP.request("POST", "$IP/$PKG", [("Content-Type", "application/json")], JSON.json(dict))
    JSON.parse(String(res.body))
end

# print available keys and its verifier
println(remotecall(IP, "EinsumAlgHub", Dict("api"=>"help"))["help"])

res_solve = remotecall(IP, "EinsumAlgHub", d_solve)
res_graph = remotecall(IP, "EinsumAlgHub", d_graph)
res_opteinsum = remotecall(IP, "EinsumAlgHub", d_opteinsum)