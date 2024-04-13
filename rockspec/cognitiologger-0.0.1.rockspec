package = "CognitioLogger"
version = "0.0.1"
source = {
    url = "https://github.com/Kuaralaboratories/CognitioLogger/archive/refs/tags/prerelease.tar.gz",
    tag = "v0.0.1",
}
description = {
    summary = "Burası paketinizin kısa açıklamasıdır.",
    detailed = [[
        Buraya daha detaylı bir açıklama ekleyebilirsiniz.
    ]],
    license = "MIT",
    homepage = "https://github.com/Kuaralaboratories/CognitioLogger",
}
dependencies = {
    "lua >= 5.1",
}
build = {
    type = "builtin",
    modules = {
        ["cognitiologger"] = "CognitioLogger.lua",
    }
}
