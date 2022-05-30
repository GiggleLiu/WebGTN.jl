function serve(PKGS::Vector{Module})
    for PKG in PKGS
        route("/$PKG", method = POST) do
            js = jsonpayload()
            # application taks a dictionary in, and a dictionary out.
            res = PKG.application(js)
            Json.json(res)
        end
    end
    up()
end