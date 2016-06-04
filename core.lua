local fName = ...
local txt
do
    local h = http.get(fName)
    txt = h.readAll()
    h.close()
end

local cursor = {1, 1}

local lines = 0
local function findLines()
    _, lines = txt:gsub("\n", "\n")
    lines = lines + 1
end

fondLines()

local function event(...)
    if args[1] ~= "key" then return nil end
    local key = args[2]
    if not args[3] then
        if (key == keys.up) and (cursor[2] > 1) then
            cursor[2] = cursor[2] - 1
        elseif (key == keys.down) and (cursor[2] < lines) then
            cursor[2] = cursor[2] + 1
        elseif (key == keys.left
