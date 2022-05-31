import networkx
import requests, json
import pdb

# application 1: solve the graph property
d_solve = {
    "api" : "solve",
    "api.solve" : {
        "graph" : {"nv" : 10, "edges" : [[i, j] for i, j in networkx.petersen_graph().edges]},
        "problem" : "MaximalIS", 
        "property" : "SizeMin",
    }
}

# application 2: access predefined graphs
d_graph = {
    "api":"graph",
    "api.graph" : {
        "type":"kings",
        "type.kings": {
            "m":8, 
            "n":8, 
            "filling":0.8,
            "seed":2
        }
    }
}

# application 3: einsum contraction order optimization
d_opteinsum = {"api":"opteinsum",
    "api.opteinsum" : {
        "inputs":[[1,2], [2,3], [3,4], [5,4]],
        "output":[1,5],
        "method":"TreeSA",
        "sizes":[[1, 2], [2, 2], [3, 2],
            [4, 2], [5, 2]]
    }
}

IP = "http://alg-hub.com:8000"

def remotecall(IP:str, PKG:str, d:dict):
    r = requests.post('%s/%s'%(IP, PKG), json=d)
    return json.loads(r.content)

# print available keys and its verifier
print(remotecall(IP, "EinsumAlgHub", {"api" : "help"})["help"])

res_solve = remotecall(IP, "EinsumAlgHub", d_solve)
print(res_solve)
res_graph = remotecall(IP, "EinsumAlgHub", d_graph)
print(res_graph)
res_opteinsum = remotecall(IP, "EinsumAlgHub", d_opteinsum)
print(res_opteinsum)