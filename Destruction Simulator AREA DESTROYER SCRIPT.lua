local explodeRocket = game:GetService("ReplicatedStorage").Remotes.explodeRocket
local areaValue = game:GetService("Players").LocalPlayer.CurrentArea.Value
local areaFolder = game:GetService("Workspace").Areas

if areaValue ~= "NoZone" then
   local area = areaFolder[areaValue]
   local descendants = area:GetDescendants()
   for i, descendant in pairs(descendants) do
       if descendant.ClassName == "Part" then
           explodeRocket:FireServer(
               tick(),
               game:GetService("Players").LocalPlayer.Backpack.Launcher.Stats,
               descendant.Position,
               game:GetService("Players").LocalPlayer.Backpack.Launcher.Assets.Rocket.Boom
           )
       end
   end
else
   warn("Not In A Zone!")
end