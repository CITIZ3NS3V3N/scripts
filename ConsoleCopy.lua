local console = game.CoreGui:WaitForChild("DevConsoleMaster")
local consoleframe = console:WaitForChild("DevConsoleWindow")

local mouse = game.Players.LocalPlayer:GetMouse()

consoleframe.InputBegan:connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton2 then
local guisAtPosition = game.CoreGui:GetGuiObjectsAtPosition(mouse.X, mouse.Y)
for i=1,#guisAtPosition do
if guisAtPosition[i].Parent.Name == "ClientLog" then
local selectedLog = guisAtPosition[i]
if consoleframe:findFirstChild("RightClickFrame") then
consoleframe:findFirstChild("RightClickFrame"):remove()
end

local RightClickFrame = Instance.new("Frame")
local CopyButton = Instance.new("TextButton")
local DeleteButton = Instance.new("TextButton")

RightClickFrame.Name = "RightClickFrame"
RightClickFrame.Parent = consoleframe
RightClickFrame.BackgroundColor3 = Color3.new(0, 0, 0)
RightClickFrame.BackgroundTransparency = 0.36
RightClickFrame.BorderColor3 = Color3.new(0.117647, 0.117647, 0.117647)
RightClickFrame.BorderSizePixel = 2
RightClickFrame.Position = UDim2.new(0, (mouse.x-consoleframe.AbsolutePosition.X)-5, 0, (mouse.y-consoleframe.AbsolutePosition.Y)-5)
RightClickFrame.Size = UDim2.new(0, 150, 0, 50)

CopyButton.Name = "CopyButton"
CopyButton.Parent = RightClickFrame
CopyButton.BackgroundColor3 = Color3.new(0, 0, 0)
CopyButton.BackgroundTransparency = 1
CopyButton.BorderColor3 = Color3.new(0.117647, 0.117647, 0.117647)
CopyButton.BorderSizePixel = 0
CopyButton.Size = UDim2.new(1, 0, 0.5, 0)
CopyButton.ZIndex = 2
CopyButton.Font = Enum.Font.Code
CopyButton.FontSize = Enum.FontSize.Size14
CopyButton.Text = "Copy"
CopyButton.TextColor3 = Color3.new(1, 1, 1)
CopyButton.TextSize = 14

DeleteButton.Name = "DeleteButton"
DeleteButton.Parent = RightClickFrame
DeleteButton.BackgroundColor3 = Color3.new(0, 0, 0)
DeleteButton.BackgroundTransparency = 1
DeleteButton.BorderColor3 = Color3.new(0.117647, 0.117647, 0.117647)
DeleteButton.BorderSizePixel = 0
DeleteButton.Position = UDim2.new(0, 0, 0.5, 0)
DeleteButton.Size = UDim2.new(1, 0, 0.5, 0)
DeleteButton.ZIndex = 2
DeleteButton.Font = Enum.Font.Code
DeleteButton.FontSize = Enum.FontSize.Size14
DeleteButton.Text = "Delete"
DeleteButton.TextColor3 = Color3.new(1, 1, 1)
DeleteButton.TextSize = 14

local action = false
spawn(function()
wait(1)
if action == false then
RightClickFrame:remove()
end
end)
RightClickFrame.MouseEnter:connect(function()
action = true
end)
RightClickFrame.MouseLeave:connect(function()
RightClickFrame:remove()
end)

CopyButton.MouseButton1Down:connect(function()
setclipboard(selectedLog.msg.Text)
RightClickFrame:remove()
end)
DeleteButton.MouseButton1Down:connect(function()
selectedLog.Visible = false -- just makes them go until you open and close the logs again (even with remove so yeah..)
RightClickFrame:remove()
end)

end
end
end
end)