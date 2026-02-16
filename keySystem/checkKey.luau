-- experimental key system
local button = script.Parent
local textbox = button.Parent.checkKey

local strings = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

local function generate(length)
    local result = ""
    for i = 1, length do
        local randIndex = math.random(1, #strings)
        result = result .. string.sub(strings, randIndex, randIndex)
    end
    return result
end

local encrypted = generate(math.random(16,24))

local key = "KEY_" ..encrypted
button.Activated:Connect(function()
    if textbox.Text == key then
        button.Active = false
        button.Text = "Correct!"
        -- do things
    else
        button.Text = "Wrong key!"
    end
end)
