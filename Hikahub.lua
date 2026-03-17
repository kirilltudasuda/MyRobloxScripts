local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function createEmotionMenu()
    if game:GetService("CoreGui"):FindFirstChild("EmotionMenuUI") then return end

    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "EmotionMenuUI"
    screenGui.Parent = game:GetService("CoreGui")

    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 60, 0, 60)
    toggleButton.Position = UDim2.new(0, 10, 0, 10)
    toggleButton.Text = "😊"
    toggleButton.TextSize = 30
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    toggleButton.BackgroundTransparency = 0.2
    toggleButton.BorderSizePixel = 0
    toggleButton.Parent = screenGui

    local menu = Instance.new("Frame")
    menu.Size = UDim2.new(0, 300, 0, 220)
    menu.Position = UDim2.new(0, 80, 0, 80)
    menu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    menu.BorderSizePixel = 0
    menu.Visible = false
    menu.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = menu

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "Эмоции: Замена"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextScaled = true
    title.Parent = menu

    local inputCurrent = Instance.new("TextBox")
    inputCurrent.Size = UDim2.new(1, -20, 0, 40)
    inputCurrent.Position = UDim2.new(0, 10, 0, 40)
    inputCurrent.PlaceholderText = "Текущая эмоция"
    inputCurrent.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    inputCurrent.TextColor3 = Color3.new(1, 1, 1)
    inputCurrent.BorderSizePixel = 0
    inputCurrent.Parent = menu

    local inputNew = Instance.new("TextBox")
    inputNew.Size = UDim2.new(1, -20, 0, 40)
    inputNew.Position = UDim2.new(0, 10, 0, 90)
    inputNew.PlaceholderText = "Новая эмоция"
    inputNew.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    inputNew.TextColor3 = Color3.new(1, 1, 1)
    inputNew.BorderSizePixel = 0
    inputNew.Parent = menu

    local btnReplace = Instance.new("TextButton")
    btnReplace.Size = UDim2.new(1, -20, 0, 40)
    btnReplace.Position = UDim2.new(0, 10, 0, 140)
    btnReplace.Text = "Заменить"
    btnReplace.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btnReplace.TextColor3 = Color3.new(1, 1, 1)
    btnReplace.BorderSizePixel = 0
    local cornerBtn = Instance.new("UICorner")
    cornerBtn.CornerRadius = UDim.new(0, 8)
    cornerBtn.Parent = btnReplace
    btnReplace.Parent = menu

    btnReplace.MouseButton1Click:Connect(function()
        local currentEmotion = inputCurrent.Text
        local newEmotion = inputNew.Text
        if currentEmotion ~= "" and newEmotion ~= "" then
            humanoid:StopEmote()
            humanoid:PlayEmote(newEmotion)
        end
    end)

    local menuVisible = false
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.LeftAlt or input.KeyCode == Enum.KeyCode.RightAlt then
            menuVisible = not menuVisible
            menu.Visible = menuVisible
        end
    end)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(0, 100, 0, 40)
    titleLabel.Position = UDim2.new(1, -110, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Hikahub"
    titleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold

    local textShadow = Instance.new("TextLabel")
    textShadow.Size = titleLabel.Size
    textShadow.Position = titleLabel.Position + UDim2.new(0, 2, 0, 2)
    textShadow.BackgroundTransparency = 1
    textShadow.Text = "Hikahub"
    textShadow.TextColor3 = Color3.new(0, 0, 0)
    textShadow.TextScaled = true
    textShadow.Font = Enum.Font.GothamBold
    textShadow.Parent = menu
    titleLabel.Parent = menu

    -- Анимация при запуске
    menu.AnchorPoint = Vector2.new(0.5, 0.5)
    menu.Position = UDim2.new(0, 150, 0, 200)
    menu.Size = UDim2.new(0, 0, 0, 0)
    menu.BackgroundTransparency = 1
    menu.Visible = true

    local tweenInfo = TweenInfo.new(
        0.5,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    )

    local tweenSize = TweenService:Create(menu, tweenInfo, {Size = UDim2.new(0, 300, 0, 220)})
    local tweenTransparency = TweenService:Create(menu, tweenInfo, {BackgroundTransparency = 0})

    tweenSize:Play()
    tweenTransparency:Play()
end

createEmotionMenu()
-- Добавил скрипт для загрузки
