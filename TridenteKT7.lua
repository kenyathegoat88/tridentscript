local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TridenteKT7"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 350)
Frame.Position = UDim2.new(0, 20, 0, 50)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.7
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

-- Reach Input Label
local reachLabel = Instance.new("TextLabel")
reachLabel.Text = "Reach (1-50):"
reachLabel.Position = UDim2.new(0, 20, 0, 20)
reachLabel.Size = UDim2.new(0, 100, 0, 25)
reachLabel.BackgroundTransparency = 1
reachLabel.TextColor3 = Color3.fromRGB(20,20,20)
reachLabel.Font = Enum.Font.Gotham
reachLabel.TextSize = 18
reachLabel.Parent = Frame

local reachBox = Instance.new("TextBox")
reachBox.Position = UDim2.new(0, 120, 0, 20)
reachBox.Size = UDim2.new(0, 60, 0, 25)
reachBox.PlaceholderText = "10"
reachBox.Text = "10"
reachBox.ClearTextOnFocus = false
reachBox.Font = Enum.Font.Gotham
reachBox.TextSize = 18
reachBox.TextColor3 = Color3.fromRGB(20, 20, 20)
reachBox.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
reachBox.Parent = Frame

-- React Button
local function createButton(text, posY)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 260, 0, 35)
    btn.Position = UDim2.new(0, 20, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 20
    btn.Text = text
    btn.Parent = Frame
    return btn
end

local reactBtn = createButton("Activar React", 60)
local reactActive = false
reactBtn.MouseButton1Click:Connect(function()
    reactActive = not reactActive
    reactBtn.Text = reactActive and "Desactivar React" or "Activar React"
    print("React está " .. (reactActive and "activado" or "desactivado"))
end)

-- Chest Reach Input Label
local chestLabel = Instance.new("TextLabel")
chestLabel.Text = "Chest Reach (1-50):"
chestLabel.Position = UDim2.new(0, 20, 0, 105)
chestLabel.Size = UDim2.new(0, 140, 0, 25)
chestLabel.BackgroundTransparency = 1
chestLabel.TextColor3 = Color3.fromRGB(20,20,20)
chestLabel.Font = Enum.Font.Gotham
chestLabel.TextSize = 18
chestLabel.Parent = Frame

local chestBox = Instance.new("TextBox")
chestBox.Position = UDim2.new(0, 160, 0, 105)
chestBox.Size = UDim2.new(0, 60, 0, 25)
chestBox.PlaceholderText = "10"
chestBox.Text = "10"
chestBox.ClearTextOnFocus = false
chestBox.Font = Enum.Font.Gotham
chestBox.TextSize = 18
chestBox.TextColor3 = Color3.fromRGB(20, 20, 20)
chestBox.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
chestBox.Parent = Frame

-- Skybox selector
local skyLabel = Instance.new("TextLabel")
skyLabel.Text = "Cambiar cielo:"
skyLabel.Position = UDim2.new(0, 20, 0, 145)
skyLabel.Size = UDim2.new(0, 100, 0, 25)
skyLabel.BackgroundTransparency = 1
skyLabel.TextColor3 = Color3.fromRGB(20,20,20)
skyLabel.Font = Enum.Font.Gotham
skyLabel.TextSize = 18
skyLabel.Parent = Frame

local skyBox = Instance.new("TextBox")
skyBox.Position = UDim2.new(0, 120, 0, 145)
skyBox.Size = UDim2.new(0, 140, 0, 25)
skyBox.PlaceholderText = "SkyboxId"
skyBox.Text = ""
skyBox.ClearTextOnFocus = false
skyBox.Font = Enum.Font.Gotham
skyBox.TextSize = 18
skyBox.TextColor3 = Color3.fromRGB(20, 20, 20)
skyBox.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
skyBox.Parent = Frame

local skyBtn = createButton("Cambiar Skybox", 185)
skyBtn.MouseButton1Click:Connect(function()
    local skyId = skyBox.Text
    if skyId ~= "" then
        local lighting = game:GetService("Lighting")
        local newSky = Instance.new("Sky")
        newSky.SkyboxBk = "rbxassetid://"..skyId
        newSky.SkyboxDn = "rbxassetid://"..skyId
        newSky.SkyboxFt = "rbxassetid://"..skyId
        newSky.SkyboxLf = "rbxassetid://"..skyId
        newSky.SkyboxRt = "rbxassetid://"..skyId
        newSky.SkyboxUp = "rbxassetid://"..skyId
        newSky.Parent = lighting
        print("Skybox cambiado a "..skyId)
    else
        print("Ingresa un ID de Skybox válido")
    end
end)

-- Minimize and Close buttons
local minimized = false

local btnMinimize = Instance.new("TextButton")
btnMinimize.Size = UDim2.new(0, 40, 0, 25)
btnMinimize.Position = UDim2.new(1, -90, 0, 10)
btnMinimize.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
btnMinimize.TextColor3 = Color3.new(1,1,1)
btnMinimize.Font = Enum.Font.GothamBold
btnMinimize.TextSize = 20
btnMinimize.Text = "_"
btnMinimize.Parent = Frame

local btnClose = Instance.new("TextButton")
btnClose.Size = UDim2.new(0, 40, 0, 25)
btnClose.Position = UDim2.new(1, -45, 0, 10)
btnClose.BackgroundColor3 = Color3.fromRGB(160, 40, 40)
btnClose.TextColor3 = Color3.new(1,1,1)
btnClose.Font = Enum.Font.GothamBold
btnClose.TextSize = 20
btnClose.Text = "X"
btnClose.Parent = Frame

local minimizedLabel = Instance.new("TextLabel")
minimizedLabel.Size = UDim2.new(0, 150, 0, 30)
minimizedLabel.Position = UDim2.new(0, 20, 0, 50)
minimizedLabel.BackgroundTransparency = 0.7
minimizedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
minimizedLabel.TextColor3 = Color3.fromRGB(20, 20, 20)
minimizedLabel.Font = Enum.Font.GothamBold
minimizedLabel.TextSize = 22
minimizedLabel.Text = "Tridente KT7"
minimizedLabel.Visible = false
minimizedLabel.Parent = ScreenGui

btnMinimize.MouseButton1Click:Connect(function()
    if minimized == false then
        Frame.Visible = false
        minimizedLabel.Visible = true
        minimized = true
    else
        Frame.Visible = true
        minimizedLabel.Visible = false
        minimized = false
    end
end)

btnClose.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("Script Tridente KT7 cargado")