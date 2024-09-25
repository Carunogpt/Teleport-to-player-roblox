local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
frame.Visible = true

local titleLabel = Instance.new("TextLabel", frame)
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Выберите игрока"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
titleLabel.TextScaled = true

local closeButton = Instance.new("TextButton", frame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.new(0.8, 0, 0)
closeButton.TextScaled = true

local hideButton = Instance.new("TextButton", screenGui)
hideButton.Size = UDim2.new(0, 30, 0, 30)
hideButton.Position = UDim2.new(0, 5, 0, 5)
hideButton.Text = "-"
hideButton.TextColor3 = Color3.new(1, 1, 1)
hideButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
hideButton.TextScaled = true

local dropdownButton = Instance.new("TextButton", frame)
dropdownButton.Size = UDim2.new(1, -10, 0, 30)
dropdownButton.Position = UDim2.new(0, 5, 0, 40)
dropdownButton.Text = "Выбрать игрока"
dropdownButton.TextColor3 = Color3.new(0, 0, 0)
dropdownButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
dropdownButton.TextScaled = true

local playerList = Instance.new("ScrollingFrame", screenGui)
playerList.Size = UDim2.new(0, 200, 0, 0)
playerList.Position = UDim2.new(0.5, 105, 0.5, -75)
playerList.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
playerList.Visible = false
playerList.CanvasSize = UDim2.new(0, 0, 5, 0)
playerList.ScrollBarThickness = 10

local followButton = Instance.new("TextButton", frame)
followButton.Size = UDim2.new(0, 90, 0, 30)
followButton.Position = UDim2.new(0.5, -95, 1, -40)
followButton.Text = "Прилипание"
followButton.TextColor3 = Color3.new(1, 1, 1)
followButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.2)
followButton.TextScaled = true

local teleportButton = Instance.new("TextButton", frame)
teleportButton.Size = UDim2.new(0, 90, 0, 30)
teleportButton.Position = UDim2.new(0.5, 5, 1, -40)
teleportButton.Text = "Телепорт"
teleportButton.TextColor3 = Color3.new(1, 1, 1)
teleportButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.2)
teleportButton.TextScaled = true

local following = false
local targetPlayer = nil

-- Функция для создания кнопок с именами игроков
local function createPlayerButton(playerName)
    local button = Instance.new("TextButton", playerList)
    button.Size = UDim2.new(1, -10, 0, 30)
    button.Position = UDim2.new(0, 5, 0, #playerList:GetChildren() * 35)
    button.Text = playerName
    button.TextColor3 = Color3.new(0, 0, 0)
    button.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
    button.TextScaled = true

    button.MouseButton1Click:Connect(function()
        targetPlayer = game.Players:FindFirstChild(playerName)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
        end
        dropdownButton.Text = "Выбран: " .. playerName
        playerList.Visible = false
        playerList.Size = UDim2.new(0, 200, 0, 0)
    end)
end

-- Создание кнопок для всех игроков
local function updatePlayerList()
    playerList:ClearAllChildren()
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            createPlayerButton(otherPlayer.Name)
        end
    end
end

updatePlayerList()

-- Обновление списка игроков при их добавлении и удалении
game.Players.PlayerAdded:Connect(updatePlayerList)
game.Players.PlayerRemoving:Connect(updatePlayerList)

-- Функция для включения/выключения режима "прилипание"
local RunService = game:GetService("RunService")
local followConnection

followButton.MouseButton1Click:Connect(function()
    following = not following
    followButton.BackgroundColor3 = following and Color3.new(0, 1, 0) or Color3.new(0.2, 0.6, 0.2)
    
    if following then
        followConnection = RunService.Heartbeat:Connect(function()
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and frame.Visible then
                player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            end
        end)
    else
        if followConnection then
            followConnection:Disconnect()
        end
    end
end)

-- Функция для телепортации к выбранному игроку
teleportButton.MouseButton1Click:Connect(function()
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end)

-- Показать/скрыть список игроков
dropdownButton.MouseButton1Click:Connect(function()
    playerList.Visible = not playerList.Visible
    playerList.Size = playerList.Visible and UDim2.new(0, 200, 0, 150) or UDim2.new(0, 200, 0, 0)
end)

-- Закрыть GUI
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    if followConnection then
        followConnection:Disconnect()
    end
end)

-- Скрыть/показать GUI
hideButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)
