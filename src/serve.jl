function serve()
    route("/generictensornetworks", method = POST) do
        js = jsonpayload()
        res = GraphUtilities.application(js)
        json(res)
    end
    up()
end