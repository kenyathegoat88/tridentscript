local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "TridenteKT7_UI"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 320)
Frame.Position = UDim2.new(0.5, -150, 0.5, -160)
Frame.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
Frame.BackgroundTransparency = 0.1
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "Tridente KT7"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(30, 30, 30)

local Reach = Instance.new("TextBox", Frame)
Reach.PlaceholderText = "Reach (1-50)"
Reach.Position = UDim2.new(0.1, 0, 0, 50)
Reach.Size = UDim2.new(0.8, 0, 0, 30)
Reach.Font = Enum.Font.Gotham
Reach.TextSize = 18
Reach.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
Reach.TextColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", Reach).CornerRadius = UDim.new(0, 6)

local React = Instance.new("TextButton", Frame)
React.Text = "React"
React.Position = UDim2.new(0.1, 0, 0, 90)
React.Size = UDim2.new(0.8, 0, 0, 30)
React.Font = Enum.Font.GothamBold
React.TextSize = 18
React.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
React.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", React).CornerRadius = UDim.new(0, 6)

local Chest = Instance.new("TextBox", Frame)
Chest.PlaceholderText = "Chest Reach (1-50)"
Chest.Position = UDim2.new(0.1, 0, 0, 130)
Chest.Size = UDim2.new(0.8, 0, 0, 30)
Chest.Font = Enum.Font.Gotham
Chest.TextSize = 18
Chest.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
Chest.TextColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", Chest).CornerRadius = UDim.new(0, 6)

-- Toggle Hitboxes Button
local ToggleBtn = Instance.new("TextButton", Frame)
ToggleBtn.Text = "Ocultar Hitboxes"
ToggleBtn.Position = UDim2.new(0.1, 0, 0, 180)
ToggleBtn.Size = UDim2.new(0.8, 0, 0, 30)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 18
ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

-- Botones minimizar y cerrar
local btnMin = Instance.new("TextButton", Frame)
btnMin.Text = "_"
btnMin.Position = UDim2.new(1, -70, 0, 5)
btnMin.Size = UDim2.new(0, 30, 0, 25)
btnMin.Font = Enum.Font.GothamBold
btnMin.TextSize = 20
btnMin.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
btnMin.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnMin).CornerRadius = UDim.new(0, 6)

local btnClose = Instance.new("TextButton", Frame)
btnClose.Text = "X"
btnClose.Position = UDim2.new(1, -35, 0, 5)
btnClose.Size = UDim2.new(0, 30, 0, 25)
btnClose.Font = Enum.Font.GothamBold
btnClose.TextSize = 20
btnClose.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
btnClose.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnClose).CornerRadius = UDim.new(0, 6)

btnClose.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Botón flotante al minimizar
local OpenBtn = Instance.new("TextButton", ScreenGui)
OpenBtn.Size = UDim2.new(0, 130, 0, 35)
OpenBtn.Position = UDim2.new(0, 10, 0, 10)
OpenBtn.Text = "Tridente KT7"
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextSize = 18
OpenBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
OpenBtn.TextColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 8)
OpenBtn.Visible = false

btnMin.MouseButton1Click:Connect(function()
	Frame.Visible = false
	OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
	Frame.Visible = true
	OpenBtn.Visible = false
end)

-- Hitbox para ambas piernas
local hitboxDer, hitboxIzq

local function crearHitboxes(valor)
	valor = tonumber(valor)
	if not valor or valor < 1 or valor > 50 then return end

	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local footR = char:FindFirstChild("RightFoot") or char:FindFirstChild("Right Leg") or char:FindFirstChild("RightLowerLeg")
	local footL = char:FindFirstChild("LeftFoot") or char:FindFirstChild("Left Leg") or char:FindFirstChild("LeftLowerLeg")
	if not footR or not footL then return end

	if hitboxDer then hitboxDer:Destroy() end
	if hitboxIzq then hitboxIzq:Destroy() end

	local function crearHitbox(pierna)
		local box = Instance.new("Part")
		box.Size = Vector3.new(valor / 5, 0.5, valor / 5)
		box.Shape = Enum.PartType.Block
		box.Transparency = 0.5
		box.CanCollide = false
		box.Anchored = false
		box.Color = Color3.fromRGB(0, 255, 0)
		box.Material = Enum.Material.ForceField
		box.Name = "Hitbox_" .. pierna.Name
		box.Parent = char

		local weld = Instance.new("WeldConstraint")
		weld.Part0 = pierna
		weld.Part1 = box
		weld.Parent = box

		box.CFrame = pierna.CFrame * CFrame.new(0, -0.5, 0)
		return box
	end

	hitboxDer = crearHitbox(footR)
	hitboxIzq = crearHitbox(footL)
end

-- Campo Reach activa hitboxes
Reach.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		crearHitboxes(Reach.Text)
	end
end)

-- Toggle visibilidad de hitboxes
local visible = true
ToggleBtn.MouseButton1Click:Connect(function()
	visible = not visible
	if hitboxDer then hitboxDer.Transparency = visible and 0.5 or 1 end
	if hitboxIzq then hitboxIzq.Transparency = visible and 0.5 or 1 end
	ToggleBtn.Text = visible and "Ocultar Hitboxes" or "Mostrar Hitboxes"
end)

-- Función react pendiente
React.MouseButton1Click:Connect(function()
	warn("React activado (pendiente)")
end)
