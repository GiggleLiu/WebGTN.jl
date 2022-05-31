using WebGTN
using Graphs

# specify the task
d_solve = Dict(
    "api"=>"solve",
    "api.solve" => Dict(
        "graph"=>Dict("nv"=>10, "edges"=>[[e.src, e.dst] for e in edges(smallgraph(:petersen))]),
        "problem"=>"MaximalIS", 
        "property"=>"SizeMin",
    )
)

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

d_opteinsum = Dict("api"=>"opteinsum",
    "api.opteinsum" => Dict(
        "inputs"=>[[1,2], [2,3], [3,4], [5,4]],
        "output"=>[1,6],
        "method"=>"TreeSA",
        "sizes"=>[[1, 2], [2, 2], [3, 2],
            [4, 2], [5, 2]]
    )
)

res_solve = WebGTN.remotecall("http://localhost:8000", "GraphUtilities", d_solve)
res_graph = WebGTN.remotecall("http://localhost:8000", "GraphUtilities", d_graph)
res_help = WebGTN.remotecall("http://localhost:8000", "GraphUtilities", Dict("api"=>"help"))
res_opteinsum = WebGTN.remotecall("http://localhost:8000", "GraphUtilities", d_opteinsum)