local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlayerTeleportGUI"
screenGui.Parent = player.PlayerGui


local COLORS = {
    BACKGROUND = Color3.new(0.15, 0.15, 0.15),
    SECONDARY = Color3.new(0.2, 0.2, 0.2),
    ACCENT = Color3.new(0.3, 0.7, 1),
    SUCCESS = Color3.new(0.2, 0.8, 0.4),
    DANGER = Color3.new(0.9, 0.3, 0.3),
    TEXT = Color3.new(1, 1, 1),
    TEXT_DARK = Color3.new(0.1, 0.1, 0.1)
}


local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 320, 0, 200)
frame.Position = UDim2.new(0.5, -160, 0.5, -100)
frame.BackgroundColor3 = COLORS.BACKGROUND
frame.BorderSizePixel = 0
frame.Parent = screenGui


local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = frame


local frameGradient = Instance.new("UIGradient")
frameGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.new(0.2, 0.2, 0.25)),
    ColorSequenceKeypoint.new(1, Color3.new(0.15, 0.15, 0.15))
}
frameGradient.Rotation = 45
frameGradient.Parent = frame


local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.new(0.4, 0.4, 0.4)
frameStroke.Thickness = 1
frameStroke.Parent = frame


local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -60, 0, 45)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "TP MENU"
titleLabel.TextColor3 = COLORS.TEXT
titleLabel.BackgroundColor3 = COLORS.SECONDARY
titleLabel.BorderSizePixel = 0
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = frame


local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = titleLabel


local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, COLORS.ACCENT),
    ColorSequenceKeypoint.new(1, Color3.new(0.2, 0.5, 0.8))
}
titleGradient.Rotation = 90
titleGradient.Parent = titleLabel


local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -45, 0, 2.5)
closeButton.Text = "✕"
closeButton.TextColor3 = COLORS.TEXT
closeButton.BackgroundColor3 = COLORS.DANGER
closeButton.BorderSizePixel = 0
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton


local hideButton = Instance.new("TextButton")
hideButton.Name = "HideButton"
hideButton.Size = UDim2.new(0, 50, 0, 50)
hideButton.Position = UDim2.new(0, 10, 0, 10)
hideButton.Text = "👁"
hideButton.TextColor3 = COLORS.TEXT
hideButton.BackgroundColor3 = COLORS.SECONDARY
hideButton.BorderSizePixel = 0
hideButton.TextScaled = true
hideButton.Font = Enum.Font.Gotham
hideButton.Parent = screenGui

local hideCorner = Instance.new("UICorner")
hideCorner.CornerRadius = UDim.new(1, 0)
hideCorner.Parent = hideButton

local hideStroke = Instance.new("UIStroke")
hideStroke.Color = COLORS.ACCENT
hideStroke.Thickness = 2
hideStroke.Parent = hideButton


local dropdownButton = Instance.new("TextButton")
dropdownButton.Name = "DropdownButton"
dropdownButton.Size = UDim2.new(1, -20, 0, 35)
dropdownButton.Position = UDim2.new(0, 10, 0, 55)
dropdownButton.Text = "📋 Выбрать игрока"
dropdownButton.TextColor3 = COLORS.TEXT_DARK
dropdownButton.BackgroundColor3 = Color3.new(0.9, 0.9, 0.9)
dropdownButton.BorderSizePixel = 0
dropdownButton.TextScaled = true
dropdownButton.Font = Enum.Font.Gotham
dropdownButton.Parent = frame

local dropdownCorner = Instance.new("UICorner")
dropdownCorner.CornerRadius = UDim.new(0, 6)
dropdownCorner.Parent = dropdownButton


local playerList = Instance.new("ScrollingFrame")
playerList.Name = "PlayerList"
playerList.Size = UDim2.new(0, 300, 0, 0)
playerList.Position = UDim2.new(0.5, 160, 0.5, -100)
playerList.BackgroundColor3 = COLORS.BACKGROUND
playerList.BorderSizePixel = 0
playerList.Visible = false
playerList.CanvasSize = UDim2.new(0, 0, 0, 0)
playerList.ScrollBarThickness = 8
playerList.ScrollBarImageColor3 = COLORS.ACCENT
playerList.Parent = screenGui

local listCorner = Instance.new("UICorner")
listCorner.CornerRadius = UDim.new(0, 8)
listCorner.Parent = playerList

local listStroke = Instance.new("UIStroke")
listStroke.Color = COLORS.ACCENT
listStroke.Thickness = 1
listStroke.Parent = playerList


local playerListLayout = Instance.new("UIListLayout")
playerListLayout.SortOrder = Enum.SortOrder.Name
playerListLayout.Padding = UDim.new(0, 2)
playerListLayout.Parent = playerList


local buttonContainer = Instance.new("Frame")
buttonContainer.Name = "ButtonContainer"
buttonContainer.Size = UDim2.new(1, -20, 0, 40)
buttonContainer.Position = UDim2.new(0, 10, 1, -50)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = frame

local buttonLayout = Instance.new("UIListLayout")
buttonLayout.FillDirection = Enum.FillDirection.Horizontal
buttonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
buttonLayout.Padding = UDim.new(0, 10)
buttonLayout.Parent = buttonContainer


local followButton = Instance.new("TextButton")
followButton.Name = "FollowButton"
followButton.Size = UDim2.new(0, 140, 0, 40)
followButton.Text = "🔗 Прилипание"
followButton.TextColor3 = COLORS.TEXT
followButton.BackgroundColor3 = COLORS.SUCCESS
followButton.BorderSizePixel = 0
followButton.TextScaled = true
followButton.Font = Enum.Font.GothamSemibold
followButton.Parent = buttonContainer

local followCorner = Instance.new("UICorner")
followCorner.CornerRadius = UDim.new(0, 6)
followCorner.Parent = followButton


local teleportButton = Instance.new("TextButton")
teleportButton.Name = "TeleportButton"
teleportButton.Size = UDim2.new(0, 140, 0, 40)
teleportButton.Text = "⚡ Телепорт"
teleportButton.TextColor3 = COLORS.TEXT
teleportButton.BackgroundColor3 = COLORS.ACCENT
teleportButton.BorderSizePixel = 0
teleportButton.TextScaled = true
teleportButton.Font = Enum.Font.GothamSemibold
teleportButton.Parent = buttonContainer

local teleportCorner = Instance.new("UICorner")
teleportCorner.CornerRadius = UDim.new(0, 6)
teleportCorner.Parent = teleportButton


local confirmDialog = Instance.new("Frame")
confirmDialog.Name = "ConfirmDialog"
confirmDialog.Size = UDim2.new(0, 300, 0, 150)
confirmDialog.Position = UDim2.new(0.5, -150, 0.5, -75)
confirmDialog.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
confirmDialog.BorderSizePixel = 0
confirmDialog.Visible = false
confirmDialog.Parent = screenGui


local confirmCorner = Instance.new("UICorner")
confirmCorner.CornerRadius = UDim.new(0, 12)
confirmCorner.Parent = confirmDialog


local confirmGradient = Instance.new("UIGradient")
confirmGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.new(0.15, 0.15, 0.2)),
    ColorSequenceKeypoint.new(1, Color3.new(0.1, 0.1, 0.1))
}
confirmGradient.Rotation = 45
confirmGradient.Parent = confirmDialog


local confirmStroke = Instance.new("UIStroke")
confirmStroke.Color = Color3.new(0.6, 0.3, 0.3)
confirmStroke.Thickness = 2
confirmStroke.Parent = confirmDialog


local confirmTitle = Instance.new("TextLabel")
confirmTitle.Name = "ConfirmTitle"
confirmTitle.Size = UDim2.new(1, -20, 0, 40)
confirmTitle.Position = UDim2.new(0, 10, 0, 10)
confirmTitle.Text = "⚠️ Confirmation"
confirmTitle.TextColor3 = Color3.new(1, 0.8, 0.2)
confirmTitle.BackgroundTransparency = 1
confirmTitle.TextScaled = true
confirmTitle.Font = Enum.Font.GothamBold
confirmTitle.Parent = confirmDialog


local confirmQuestion = Instance.new("TextLabel")
confirmQuestion.Name = "ConfirmQuestion"
confirmQuestion.Size = UDim2.new(1, -20, 0, 40)
confirmQuestion.Position = UDim2.new(0, 10, 0, 50)
confirmQuestion.Text = "Close script?"
confirmQuestion.TextColor3 = COLORS.TEXT
confirmQuestion.BackgroundTransparency = 1
confirmQuestion.TextScaled = true
confirmQuestion.Font = Enum.Font.Gotham
confirmQuestion.Parent = confirmDialog


local confirmButtonContainer = Instance.new("Frame")
confirmButtonContainer.Name = "ConfirmButtonContainer"
confirmButtonContainer.Size = UDim2.new(1, -20, 0, 40)
confirmButtonContainer.Position = UDim2.new(0, 10, 1, -50)
confirmButtonContainer.BackgroundTransparency = 1
confirmButtonContainer.Parent = confirmDialog


local confirmButtonLayout = Instance.new("UIListLayout")
confirmButtonLayout.FillDirection = Enum.FillDirection.Horizontal
confirmButtonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
confirmButtonLayout.Padding = UDim.new(0, 20)
confirmButtonLayout.Parent = confirmButtonContainer


local yesButton = Instance.new("TextButton")
yesButton.Name = "YesButton"
yesButton.Size = UDim2.new(0, 100, 0, 40)
yesButton.Text = "V Yes"
yesButton.TextColor3 = COLORS.TEXT
yesButton.BackgroundColor3 = COLORS.DANGER
yesButton.BorderSizePixel = 0
yesButton.TextScaled = true
yesButton.Font = Enum.Font.GothamSemibold
yesButton.Parent = confirmButtonContainer

local yesCorner = Instance.new("UICorner")
yesCorner.CornerRadius = UDim.new(0, 6)
yesCorner.Parent = yesButton


local noButton = Instance.new("TextButton")
noButton.Name = "NoButton"
noButton.Size = UDim2.new(0, 100, 0, 40)
noButton.Text = "✕ No"
noButton.TextColor3 = COLORS.TEXT
noButton.BackgroundColor3 = COLORS.SECONDARY
noButton.BorderSizePixel = 0
noButton.TextScaled = true
noButton.Font = Enum.Font.GothamSemibold
noButton.Parent = confirmButtonContainer

local noCorner = Instance.new("UICorner")
noCorner.CornerRadius = UDim.new(0, 6)
noCorner.Parent = noButton


local following = false
local targetPlayer = nil
local followConnection = nil


local function animateButton(button, hoverColor, originalColor)
    local tweenService = game:GetService("TweenService")
    local hoverTween = tweenService:Create(button, 
        TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
        {BackgroundColor3 = hoverColor}
    )
    local leaveTween = tweenService:Create(button, 
        TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
        {BackgroundColor3 = originalColor}
    )
    
    button.MouseEnter:Connect(function()
        hoverTween:Play()
    end)
    
    button.MouseLeave:Connect(function()
        leaveTween:Play()
    end)
end


animateButton(closeButton, Color3.new(1, 0.2, 0.2), COLORS.DANGER)
animateButton(followButton, Color3.new(0.3, 0.9, 0.5), COLORS.SUCCESS)
animateButton(teleportButton, Color3.new(0.4, 0.8, 1), COLORS.ACCENT)
animateButton(dropdownButton, Color3.new(0.8, 0.8, 0.8), Color3.new(0.9, 0.9, 0.9))
animateButton(yesButton, Color3.new(1, 0.2, 0.2), COLORS.DANGER)
animateButton(noButton, Color3.new(0.3, 0.3, 0.3), COLORS.SECONDARY)


local function createPlayerButton(playerName)
    local button = Instance.new("TextButton")
    button.Name = playerName .. "Button"
    button.Size = UDim2.new(1, -10, 0, 35)
    button.Text = "👤 " .. playerName
    button.TextColor3 = COLORS.TEXT
    button.BackgroundColor3 = COLORS.SECONDARY
    button.BorderSizePixel = 0
    button.TextScaled = true
    button.Font = Enum.Font.Gotham
    button.Parent = playerList
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = button
    
    
    animateButton(button, Color3.new(0.3, 0.3, 0.3), COLORS.SECONDARY)
    
    button.MouseButton1Click:Connect(function()
        local player = game.Players:FindFirstChild(playerName)
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
            end
        end
        targetPlayer = player
        dropdownButton.Text = "🎯 " .. playerName
        playerList.Visible = false
        
        
        local tweenService = game:GetService("TweenService")
        local hideTween = tweenService:Create(playerList, 
            TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
            {Size = UDim2.new(0, 300, 0, 0)}
        )
        hideTween:Play()
    end)
end


local function updatePlayerList()
   
    for _, child in pairs(playerList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    local playerCount = 0
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            createPlayerButton(otherPlayer.Name)
            playerCount = playerCount + 1
        end
    end
    
    
    playerList.CanvasSize = UDim2.new(0, 0, 0, playerCount * 37)
end


local function showConfirmDialog()
    confirmDialog.Visible = true
    confirmDialog.Size = UDim2.new(0, 0, 0, 0)
    
    local tweenService = game:GetService("TweenService")
    local showTween = tweenService:Create(confirmDialog, 
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), 
        {Size = UDim2.new(0, 300, 0, 150)}
    )
    showTween:Play()
end


local function hideConfirmDialog()
    local tweenService = game:GetService("TweenService")
    local hideTween = tweenService:Create(confirmDialog, 
        TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
        {Size = UDim2.new(0, 0, 0, 0)}
    )
    hideTween:Play()
    hideTween.Completed:Connect(function()
        confirmDialog.Visible = false
    end)
end


updatePlayerList()


game.Players.PlayerAdded:Connect(updatePlayerList)
game.Players.PlayerRemoving:Connect(updatePlayerList)


local RunService = game:GetService("RunService")

followButton.MouseButton1Click:Connect(function()
    following = not following
    
    if following then
        followButton.Text = "🔓 Отключить"
        followButton.BackgroundColor3 = COLORS.DANGER
        
        followConnection = RunService.Heartbeat:Connect(function()
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        end)
    else
        followButton.Text = "🔗 Прилипание"
        followButton.BackgroundColor3 = COLORS.SUCCESS
        
        if followConnection then
            followConnection:Disconnect()
            followConnection = nil
        end
    end
end)


teleportButton.MouseButton1Click:Connect(function()
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end)


dropdownButton.MouseButton1Click:Connect(function()
    local tweenService = game:GetService("TweenService")
    
    if playerList.Visible then
        local hideTween = tweenService:Create(playerList, 
            TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
            {Size = UDim2.new(0, 300, 0, 0)}
        )
        hideTween:Play()
        hideTween.Completed:Connect(function()
            playerList.Visible = false
        end)
    else
        playerList.Visible = true
        playerList.Size = UDim2.new(0, 300, 0, 0)
        local showTween = tweenService:Create(playerList, 
            TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
            {Size = UDim2.new(0, 300, 0, 200)}
        )
        showTween:Play()
    end
end)


yesButton.MouseButton1Click:Connect(function()
    hideConfirmDialog()
    
    
    if followConnection then
        followConnection:Disconnect()
    end
    
    
    local tweenService = game:GetService("TweenService")
    local closeTween = tweenService:Create(frame, 
        TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
        {Size = UDim2.new(0, 0, 0, 0)}
    )
    closeTween:Play()
    closeTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end)


noButton.MouseButton1Click:Connect(function()
    hideConfirmDialog()
end)


closeButton.MouseButton1Click:Connect(function()
    showConfirmDialog()
end)


hideButton.MouseButton1Click:Connect(function()
    local tweenService = game:GetService("TweenService")
    
    if frame.Visible then
        hideButton.Text = "👁‍🗨"
        local hideTween = tweenService:Create(frame, 
            TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
            {Position = UDim2.new(0.5, -160, 0, -250)}
        )
        hideTween:Play()
        hideTween.Completed:Connect(function()
            frame.Visible = false
        end)
    else
        frame.Visible = true
        hideButton.Text = "👁"
        frame.Position = UDim2.new(0.5, -160, 0, -250)
        local showTween = tweenService:Create(frame, 
            TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
            {Position = UDim2.new(0.5, -160, 0.5, -100)}
        )
        showTween:Play()
    end
end)


local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if playerList.Visible then
            local mouse = player:GetMouse()
            local mousePos = Vector2.new(mouse.X, mouse.Y)
            local listPos = playerList.AbsolutePosition
            local listSize = playerList.AbsoluteSize
            
            if mousePos.X < listPos.X or mousePos.X > listPos.X + listSize.X or
               mousePos.Y < listPos.Y or mousePos.Y > listPos.Y + listSize.Y then
                playerList.Visible = false
                local tweenService = game:GetService("TweenService")
                local hideTween = tweenService:Create(playerList, 
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
                    {Size = UDim2.new(0, 300, 0, 0)}
                )
                hideTween:Play()
            end
        end
    end
end)
