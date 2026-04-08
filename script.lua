local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 1. Create the ScreenGui (Invisible container)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ModderMenu"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false -- Keep UI after death

-- 2. Create the Main Frame (The "Window")
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 500, 0, 300) -- Smaller than screen
frame.Position = UDim2.new(0.5, -150, 0.5, -75) -- Centered
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45) -- Dark grey background
frame.BorderSizePixel = 2
frame.Parent = screenGui

-- MAKE IT DRAGGABLE
frame.Active = true
frame.Draggable = true

local textLabel = Instance.new("TextLabel", screenGui)
-- Set the position and scaling
textLabel.AnchorPoint = Vector2.new(0.5, 0)
textLabel.Position = UDim2.new(0.5, 0, 0, 0) -- Top Center
textLabel.Size = UDim2.new(1, 0, 0.1, 0)    -- 100% width, 10% height

textLabel.Text = "ModderMenu V1        (by Thatonemodder)"
textLabel.TextScaled = true -- Makes the font size fit the box
textLabel.BackgroundTransparency = 0.5 -- Optional: see through the background
textLabel.Parent = frame

-- 3. Create the Button (Inside the Frame)
local button1 = Instance.new("TextButton")
button1.Name = "SpeedButton"
button1.Size = UDim2.new(0, 200, 0, 50) 
button1.Position = UDim2.new(0.5, 40, 0.5, 80)
button1.Text = "WalkSpeed Cheat (100)"
button1.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button1.TextColor3 = Color3.fromRGB(255, 255, 255)
button1.Parent = frame -- Parented to the FRAME, not the ScreenGui

-- Round the Main Frame corners
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12) -- 12 pixels of roundness
frameCorner.Parent = frame

-- Round the Button corners
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8) -- Slightly smaller rounding for the button
buttonCorner.Parent = button1

-- 4. The Logic
button1.MouseButton1Click:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = 100
        print("WalkSpeed updated Successfully")
    else
        print("Character or Humanoid not found.")
    end
end)
