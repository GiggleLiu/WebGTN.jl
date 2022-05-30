function remotecall(IP::String, PKG::String, dict::AbstractDict)
    res = HTTP.request("POST", "$IP/$PKG", [("Content-Type", "application/json")], JSON.json(dict))
    JSON.parse(String(res.body))
end