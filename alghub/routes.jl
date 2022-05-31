using Genie, Genie.Router, Genie.Requests, Genie.Renderer.Json
using GraphUtilities

#route("/") do
#  serve_static_file("welcome.html")
#end

PKGS = [GraphUtilities]

for PKG in PKGS
    route("/$PKG", method = POST) do
        js = jsonpayload()
        # application taks a dictionary in, and a dictionary out.
        res = PKG.application(js)
        Json.json(res)
    end
end

