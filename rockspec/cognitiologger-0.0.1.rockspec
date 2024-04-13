package = "CognitioLogger"
version = "0.0.1"
source = {
    url = "https://github.com/Kuaralaboratories/CognitioLogger/mypackage-1.0.tar.gz",
    tag = "v0.0.1",
    -- Yedek olarak URL kullanılabilir.
    -- url = "git://github.com/user/mypackage.git",
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
