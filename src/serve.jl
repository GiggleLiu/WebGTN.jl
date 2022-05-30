function serve()
    route("/jsonpayload", method = POST) do
        js = jsonpayload()
        @show js
        res = handle_json(js)
        json(res)
    end
    up()
end

function handle_json(js)
    res = GraphUtilities.json_solve(js)
    return GraphUtilities.tojson(res)
end