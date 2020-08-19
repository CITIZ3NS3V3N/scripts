game.StarterGui:SetCore("SendNotification", {
    Title = "By.DestinyTakes/Goraatime",
    Text  = "Chams Have Been Loaded :)"
})

---Colors---
Really_Red = Color3.new(255,0,0)
Really_Blue = Color3.new(0, 0, 255)
Hot_Pink = Color3.new(255, 0, 191)
Lime_Green = Color3.new(0, 255, 0)
New_Yeller = Color3.new(255, 255, 0)
Tooth_Paste = Color3.new(0, 255, 255)
---Global Variables---
_G.trans = 0.4 
_G.enemyteamcolor = Really_Red
_G.alieteamcolor = Really_Blue
---Bool---
hattog = false
---UI-Libary---
local library = loadstring(game:HttpGet("https://pastebin.com/raw/zH17BK2a", true))()
local Chams = library:CreateWindow({text = "ESP/Render."})
local Credits = library:CreateWindow({text = "Credits..."})

Credits:AddLabel("Made By.DestinyTakes...")
Credits:AddButton("Coppie V3rm...",function()
    setclipboard("https://v3rmillion.net/member.php?action=profile&uid=1423702")
end)
Credits:AddButton("Coppie Discord...",function()
    setclipboard("DestinyTakes#0001")
end)
---Toggle For Chams---
Chams:AddToggle("Chams.", function(s)
    _G.toggle = s
end)
---Cham Thickness---
Chams:AddBox("Chams Thickness.", function(focus)
    if focus then  
        _G.trans = tostring(focus.Text)
    end
end)
---Label---
Chams:AddLabel("              ---Team-Color---")
---Drop---
Chams:AddDropdown({"Really Blue", "Really Red", "Hot Pink", "Tooth Paste", "Really Yellow", "Lime Green" }, function(a)
    if a == "Really Blue" then 
        _G.alieteamcolor = Really_Blue
    end
    if a == "Hot Pink" then 
        _G.alieteamcolor = Hot_Pink
    end
    if a == "Tooth Paste" then 
        _G.alieteamcolor = Tooth_Paste
    end 
    if a == "Really Yellow" then 
        _G.alieteamcolor = New_Yeller
    end
    if a == "Lime Green" then 
        _G.alieteamcolor = Lime_Green
    end 
    if a == "Really Red" then 
        _G.alieteamcolor = Really_Red
    end
end)
---Label---
Chams:AddLabel("             ---Enemy-Color---")
---Drop---
Chams:AddDropdown({"Really Red", "Hot Pink", "Really Blue", "Tooth Paste", "Really Yellow", "Lime Green"}, function(a)
    if a == "Really Blue" then 
        _G.enemyteamcolor = Really_Blue
    end
    if a == "Hot Pink" then 
        _G.enemyteamcolor = Hot_Pink
    end
    if a == "Tooth Paste" then 
        _G.enemyteamcolor = Tooth_Paste
    end 
    if a == "Really Yellow" then 
        _G.enemyteamcolor = New_Yeller
    end
    if a == "Lime Green" then 
        _G.enemyteamcolor = Lime_Green
    end 
    if a == "Really Red" then 
        _G.enemyteamcolor = Really_Red
    end
end)
---Remove Hats---
Chams:AddToggle("Remove Hats.", function(s)
    hattog = s
end)
---MainChams---
function MainChams()   
  for i,v in pairs(game.Players:GetChildren()) do 
      if v ~= game.Players.LocalPlayer then
         local Child = v.Character ~= nil and v.Character:GetChildren()
         if Child then
             if type(Child) == "table" then 
              for i,Parts in pairs(Child) do 
                  if Parts:IsA("Part") or Parts:IsA("MeshPart") then
                    if v.TeamColor ~= game.Players.LocalPlayer.TeamColor then 
                      if Parts:FindFirstChild("BoxHandleAdornment") then
                          Parts.BoxHandleAdornment:Destroy()
                        end
                          local Chams = Instance.new("BoxHandleAdornment")
                          Chams.Size = Parts.Size 
                          Chams.AlwaysOnTop = true 
                          Chams.Adornee = Parts
                          Chams.Parent = Parts
                          Chams.ZIndex = 5
                          Chams.Visible = true
                          Chams.Color3 = _G.enemyteamcolor
                          Chams.Transparency = _G.trans
                    end
                end
            end
        end
     end
  end
end
end
function TeamEsp()
  for i,v in pairs(game.Players:GetChildren()) do 
      if v ~= game.Players.LocalPlayer then
          local Child = v.Character ~= nil and v.Character:GetChildren()
        if Child then 
            if type(Child) == "table" then
              for i,Parts in pairs(Child) do 
                  if Parts:IsA("Part") or Parts:IsA("MeshPart") then
                    if v.TeamColor == game.Players.LocalPlayer.TeamColor then 
                      if Parts:FindFirstChild("BoxHandleAdornment") then
                          Parts.BoxHandleAdornment:Destroy()
                        end
                          local Chams = Instance.new("BoxHandleAdornment")
                          Chams.Size = Parts.Size 
                          Chams.AlwaysOnTop = true 
                          Chams.Adornee = Parts
                          Chams.Parent = Parts
                          Chams.ZIndex = 5
                          Chams.Visible = true
                          Chams.Transparency = _G.trans 
                          Chams.Color3 = _G.alieteamcolor
                      
                      end  
                    end
                end
            end
        end
    end
end
end

---DestroyHats---
function Destroy1()
  for i,v in pairs(game.Players:GetChildren()) do 
      local Chilldren = v.Character:GetChildren()
      for i,v in pairs(Chilldren) do 
          if v:IsA("Accessory") then 
              v:Destroy()
          end
      end
  end
end

---Loop---
coroutine.resume(
    coroutine.create(function()
        while wait(0.01) do 
            if _G.toggle == true then
                local winning, losing = pcall(MainChams)
                if losing then 
                    coroutine.resume(
                        coroutine.create(function()
                            wait(9e9)
                            print("Error")
                        end)
                    )
                else
                    MainChams()
                    if retoggle == true then 
                        Delete()
                        print("Destroyed")
                    end
                end
                local winning losing = pcall(TeamEsp)
                if losing then 
                    coroutine.resume(
                        coroutine.create(function()
                            wait(9e9)
                            print("Error")
                        end)
                    )
                else
                    TeamEsp()
                end
            else
            function Delete()
                for i,v in pairs(game.Players:GetChildren()) do 
                    local charr = v.Character:GetChildren()
                    for i,v in pairs(charr) do 
                        if v:IsA("Part") or v:IsA('MeshPart') then 
                            if v:FindFirstChild("BoxHandleAdornment") then 
                                v.BoxHandleAdornment:Destroy()
                            end
                        end
                    end
                end
            end
            local p,s = pcall(Delete)
            if s then 
                coroutine.resume(
                    coroutine.create(function()
                        wait(10000)
                        print("Error")
                    end)
                )
            else
               Delete()
                end
            end
        end
    end)
)
---Loop---
coroutine.resume(
    coroutine.create(function()
        while wait(0.1) do 
            if hattog == true then 
                local sus,fail = pcall(Destroy1)
                    if sus then 
                        Destroy1()
                    else
                        coroutine.resume(
                         coroutine.create(function()
                             wait(10000)
                             print("Error")
                        end)
                    )
                end
            end
        end
    end)
)

--https://v3rmillion.net/showthread.php?tid=1037883
--By: Goraatime