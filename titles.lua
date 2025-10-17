local function split_params_title(param)
    local args = {}

    -- Extract first three space-separated args
    local count = 0
    for word in param:gmatch("%S+") do
        count = count + 1
        if count <= 3 then
            table.insert(args, word)
        else
            break
        end
    end

    -- Extract the 4th arg (text) — everything after first three args
    local pattern = "^%S+%s+%S+%s+%S+%s+(.+)$"  -- everything after the 3rd arg + space
    local text = param:match(pattern) or ""

    -- Remove surrounding quotes if present
    text = text:gsub('^"(.-)"$', "%1")

    table.insert(args, text)

    return args
end

minetest.register_chatcommand("title", {
    description = "Show a title-like text on screen. Usage: <player> <color> <time> <text> (text between quotes)",
    func = function(name, param)
        local args = split_params_title(param)
        local playerName = args[1] or "greatbigdiamond"
        local color = args[2] or "white"
        local time = tonumber(args[3]) or 3
        local text = args[4] or "nil"

        minetest.chat_send_player(name, "args[1]: "..tostring(args[1]))
        minetest.chat_send_player(name, "args[2]: "..tostring(args[2]))
        minetest.chat_send_player(name, "args[3]: "..tostring(args[3]))
        minetest.chat_send_player(name, "args[4]: "..tostring(args[4]))


        local colors = {
            white      = 0xFFFFFF,
            black      = 0x000000,
            red        = 0xFF0000,
            green      = 0x00FF00,
            blue       = 0x0000FF,
            yellow     = 0xFFFF00,
            cyan       = 0x00FFFF,
            magenta    = 0xFF00FF,
            orange     = 0xFFA500,
            purple     = 0x800080,
            pink       = 0xFFC0CB,
            gray       = 0x808080, -- american
            grey       = 0x808080, -- british (country of tea)
            lightgray  = 0xD3D3D3, -- american
            lightgrey  = 0xD3D3D3, -- british (country of "lorry")
            darkgray   = 0x404040,
            darkgrey   = 0x404040,
            brown      = 0x8B4513,
            lime       = 0x32CD32,
            navy       = 0x000080,
            teal       = 0x008080,
            gold       = 0xFFD700,
        }


        local target = minetest.get_player_by_name(playerName)
        if not target then
            return false, "Player not found: " .. playerName
        end

        -- Add HUD element
        local hud_title = target:hud_add({
            hud_elem_type = "text",
            position  = {x=0.5, y=0.4},
            offset    = {x=0, y=0},
            text      = text ~= "" and text or "nil",
            alignment = {x=0, y=0},
            scale     = {x=100, y=100},
            number    = colors[color:lower()] or 0xFFFFFF,  -- white color
            size      = {x=2, y=2}, -- makes the text larger
        })

        -- Remove HUD after 5 seconds
        minetest.after(time, function()
            target:hud_remove(hud_title)
        end)
    end,
})


minetest.register_chatcommand("subtitle", {
    description = "Show a title-like text on screen, below the actual title. Usage: /subtitle <player> <color> <time> <text> (text between quotes)",
    func = function(name, param)
        local args = split_params_title(param)
        local playerName = args[1] or "greatbigdiamond"
        local color = args[2] or "white"
        local time = tonumber(args[3]) or 3
        local text = args[4] or "nil"

        minetest.chat_send_player(name, "args[1]: "..tostring(args[1]))
        minetest.chat_send_player(name, "args[2]: "..tostring(args[2]))
        minetest.chat_send_player(name, "args[3]: "..tostring(args[3]))
        minetest.chat_send_player(name, "args[4]: "..tostring(args[4]))


        local colors = {
            white      = 0xFFFFFF,
            black      = 0x000000,
            red        = 0xFF0000,
            green      = 0x00FF00,
            blue       = 0x0000FF,
            yellow     = 0xFFFF00,
            cyan       = 0x00FFFF,
            magenta    = 0xFF00FF,
            orange     = 0xFFA500,
            purple     = 0x800080,
            pink       = 0xFFC0CB,
            gray       = 0x808080, -- american
            grey       = 0x808080, -- british (country of tea)
            lightgray  = 0xD3D3D3, -- american
            lightgrey  = 0xD3D3D3, -- british (country of "lorry")
            darkgray   = 0x404040,
            darkgrey   = 0x404040,
            brown      = 0x8B4513,
            lime       = 0x32CD32,
            navy       = 0x000080,
            teal       = 0x008080,
            gold       = 0xFFD700,
        }


        local target = minetest.get_player_by_name(playerName)
        if not target then
            return false, "Player not found: " .. playerName
        end

        -- Add HUD element
        local hud_title = target:hud_add({
            hud_elem_type = "text",
            position  = {x=0.5, y=0.45},
            offset    = {x=0, y=0},
            text      = text ~= "" and text or "nil",
            alignment = {x=0, y=0},
            scale     = {x=100, y=100},
            number    = colors[color:lower()] or 0xFFFFFF,  -- white color
            size      = {x=1.7, y=1.7}, -- makes the text larger
        })

        -- Remove HUD after 5 seconds
        minetest.after(time, function()
            target:hud_remove(hud_title)
        end)
    end,
})
