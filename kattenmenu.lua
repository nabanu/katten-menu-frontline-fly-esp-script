local SciptTitle = "KattenMenu"
print("starting "..SciptTitle)


local Destroyed = false
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local PhysicsService = game:GetService("PhysicsService")
local Cam = workspace.CurrentCamera
local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()

local UI = Instance.new("ScreenGui")
UI.Parent = Player.PlayerGui
UI.Name = SciptTitle
UI.ZIndexBehavior = Enum.ZIndexBehavior.Global
local Frame = Instance.new("Frame")
Frame.Parent = UI
Frame.Position = UDim2.new(0, 10, 0, 250)
Frame.ZIndex = 999
local MenuFeatures = 0
local FeatureUISize = 20
local FeatureColor = Color3.fromRGB(0, 0, 0)
local FeatureEnabledColor = Color3.fromRGB(23, 15, 40)
local TitleColor = Color3.fromRGB(113, 72, 195)
local FeatureTextColor = Color3.fromRGB(255, 255, 255)
local TitleTextColor = Color3.fromRGB(33, 33, 33)

local ExampleButton = Instance.new("TextLabel")
ExampleButton.ZIndex = 1000
ExampleButton.Size = UDim2.new(1, 0, 0, FeatureUISize)
ExampleButton.TextXAlignment = Enum.TextXAlignment.Left
ExampleButton.BackgroundColor3 = FeatureColor
ExampleButton.TextColor3 = FeatureTextColor

--start menu feature
MenuFeatures += 1
local FeatureName = "ESP"
local FeatureKey = "Insert"
local MenuFeatureTitle = ExampleButton:Clone()
MenuFeatureTitle.Name = FeatureName
MenuFeatureTitle.Parent = Frame
MenuFeatureTitle.Text = FeatureName .. " - " .. FeatureKey
MenuFeatureTitle.Position = UDim2.new(0, 0, 0, ((MenuFeatures-1)*FeatureUISize)+20)
local KeyValue = Instance.new("StringValue")
KeyValue.Parent = MenuFeatureTitle
KeyValue.Name = "KeyValue"
KeyValue.Value = FeatureKey
local FeatureValue = Instance.new("StringValue")
FeatureValue.Parent = MenuFeatureTitle
FeatureValue.Name = "FeatureValue"
FeatureValue.Value = FeatureName
local ESP = false
local LastESPUpdate = os.clock()
local PlayerESPColor = Color3.fromRGB(162, 0, 255)
local NameTagESPColor = Color3.fromRGB(162, 0, 255)
local WeaponESPColor = Color3.fromRGB(0, 255, 0)
local KnifeESPColor = Color3.fromRGB(255, 255, 255)

MenuFeatures += 1
local FeatureName = "Mouse TP"
local FeatureKey = "LeftAlt"
local MenuFeatureTitle = ExampleButton:Clone()
MenuFeatureTitle.Name = FeatureName
MenuFeatureTitle.Parent = Frame
MenuFeatureTitle.Text = FeatureName .. " - " .. FeatureKey
MenuFeatureTitle.Position = UDim2.new(0, 0, 0, ((MenuFeatures-1)*FeatureUISize)+20)
local KeyValue = Instance.new("StringValue")
KeyValue.Parent = MenuFeatureTitle
KeyValue.Name = "KeyValue"
KeyValue.Value = FeatureKey
local FeatureValue = Instance.new("StringValue")
FeatureValue.Parent = MenuFeatureTitle
FeatureValue.Name = "FeatureValue"
FeatureValue.Value = FeatureName

MenuFeatures += 1
local FeatureName = "Toggle barriers"
local FeatureKey = "RightShift"
local MenuFeatureTitle = ExampleButton:Clone()
MenuFeatureTitle.Name = FeatureName
MenuFeatureTitle.Parent = Frame
MenuFeatureTitle.Text = FeatureName .. " - " .. FeatureKey
MenuFeatureTitle.Position = UDim2.new(0, 0, 0, ((MenuFeatures-1)*FeatureUISize)+20)
local KeyValue = Instance.new("StringValue")
KeyValue.Parent = MenuFeatureTitle
KeyValue.Name = "KeyValue"
KeyValue.Value = FeatureKey
local FeatureValue = Instance.new("StringValue")
FeatureValue.Parent = MenuFeatureTitle
FeatureValue.Name = "FeatureValue"
FeatureValue.Value = FeatureName
local Barriers = false

MenuFeatures += 1
local FeatureName = "Easy kills"
local FeatureKey = "Delete"
local MenuFeatureTitle = ExampleButton:Clone()
MenuFeatureTitle.Name = FeatureName
MenuFeatureTitle.Parent = Frame
MenuFeatureTitle.Text = FeatureName .. " - " .. FeatureKey
MenuFeatureTitle.Position = UDim2.new(0, 0, 0, ((MenuFeatures-1)*FeatureUISize)+20)
local KeyValue = Instance.new("StringValue")
KeyValue.Parent = MenuFeatureTitle
KeyValue.Name = "KeyValue"
KeyValue.Value = FeatureKey
local FeatureValue = Instance.new("StringValue")
FeatureValue.Parent = MenuFeatureTitle
FeatureValue.Name = "FeatureValue"
FeatureValue.Value = FeatureName
local EasyKills = false
local Victim = nil

MenuFeatures += 1
local FeatureName = "Crazy movement"
local FeatureKey = "J"
local MenuFeatureTitle = ExampleButton:Clone()
MenuFeatureTitle.Name = FeatureName
MenuFeatureTitle.Parent = Frame
MenuFeatureTitle.Text = FeatureName .. " - " .. FeatureKey
MenuFeatureTitle.Position = UDim2.new(0, 0, 0, ((MenuFeatures-1)*FeatureUISize)+20)
local KeyValue = Instance.new("StringValue")
KeyValue.Parent = MenuFeatureTitle
KeyValue.Name = "KeyValue"
KeyValue.Value = FeatureKey
local FeatureValue = Instance.new("StringValue")
FeatureValue.Parent = MenuFeatureTitle
FeatureValue.Name = "FeatureValue"
FeatureValue.Value = FeatureName
local CrazyMovement = false

MenuFeatures += 1
local FeatureName = "Knife Fire"
local FeatureKey = "H"
local MenuFeatureTitle = ExampleButton:Clone()
MenuFeatureTitle.Name = FeatureName
MenuFeatureTitle.Parent = Frame
MenuFeatureTitle.Text = FeatureName .. " - " .. FeatureKey
MenuFeatureTitle.Position = UDim2.new(0, 0, 0, ((MenuFeatures-1)*FeatureUISize)+20)
local KeyValue = Instance.new("StringValue")
KeyValue.Parent = MenuFeatureTitle
KeyValue.Name = "KeyValue"
KeyValue.Value = FeatureKey
local FeatureValue = Instance.new("StringValue")
FeatureValue.Parent = MenuFeatureTitle
FeatureValue.Name = "FeatureValue"
FeatureValue.Value = FeatureName

MenuFeatures += 1
local FeatureName = "Custom reticle"
local FeatureKey = "L"
local MenuFeatureTitle = ExampleButton:Clone()
MenuFeatureTitle.Name = FeatureName
MenuFeatureTitle.Parent = Frame
MenuFeatureTitle.Text = FeatureName .. " - " .. FeatureKey
MenuFeatureTitle.Position = UDim2.new(0, 0, 0, ((MenuFeatures-1)*FeatureUISize)+20)
local KeyValue = Instance.new("StringValue")
KeyValue.Parent = MenuFeatureTitle
KeyValue.Name = "KeyValue"
KeyValue.Value = FeatureKey
local FeatureValue = Instance.new("StringValue")
FeatureValue.Parent = MenuFeatureTitle
FeatureValue.Name = "FeatureValue"
FeatureValue.Value = FeatureName
local CustomReticle = false
local CanSetReticle = true
local LastReticleUpdate = os.clock()

MenuFeatures += 1
local FeatureName = "Destroy menu"
local FeatureKey = "END"
local MenuFeatureTitle = ExampleButton:Clone()
MenuFeatureTitle.Name = FeatureName
MenuFeatureTitle.Parent = Frame
MenuFeatureTitle.Text = FeatureName .. " - " .. FeatureKey
MenuFeatureTitle.Position = UDim2.new(0, 0, 0, ((MenuFeatures-1)*FeatureUISize)+20)
local KeyValue = Instance.new("StringValue")
KeyValue.Parent = MenuFeatureTitle
KeyValue.Name = "KeyValue"
KeyValue.Value = FeatureKey
local FeatureValue = Instance.new("StringValue")
FeatureValue.Parent = MenuFeatureTitle
FeatureValue.Name = "FeatureValue"
FeatureValue.Value = FeatureName

--end menu features


Frame.Size = UDim2.new(0, 150, 0, MenuFeatures * FeatureUISize+20)


local MenuTitle = Instance.new("TextLabel")
MenuTitle.BackgroundColor3 = TitleColor
MenuTitle.TextColor3 = TitleTextColor
MenuTitle.Parent = Frame
MenuTitle.ZIndex = 1000
MenuTitle.Text = SciptTitle
MenuTitle.Position = UDim2.new(0, 0, 0, 0)
MenuTitle.Size = UDim2.new(1, 0, 0, FeatureUISize)
MenuTitle.TextXAlignment = Enum.TextXAlignment.Center


function AddESP()
    for _,Soldiers in pairs(workspace:GetChildren()) do
        if Soldiers ~= nil then
            if Soldiers.Name == "soldier_model" then
                if not Soldiers:FindFirstChild("EspHighlight") and not Soldiers:FindFirstChild("friendly_marker") and not Soldiers:FindFirstChild("fpv_rig") and Soldiers.HumanoidRootPart.Root_M.Position.Magnitude < 1 then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Parent = Soldiers
                    Highlight.Name = "EspHighlight"
                    Highlight.OutlineTransparency = .9
                    Highlight.FillTransparency = 0.9
                    Highlight.FillColor = PlayerESPColor
                elseif Soldiers:FindFirstChild("friendly_marker") or Soldiers:FindFirstChild("fpv_rig") or Soldiers.HumanoidRootPart.Root_M.Position.Magnitude > 1 then
                    if Soldiers:FindFirstChild("EspHighlight") then
                        Soldiers.EspHighlight:Destroy()
                    end
                    if Soldiers:FindFirstChild("ESPMarker") then
                        Soldiers.ESPMarker:Destroy()
                    end
                end
            elseif Soldiers.Name == "combat_knife" then
                if not Soldiers:FindFirstChild("EspHighlight") then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Parent = Soldiers
                    Highlight.Name = "EspHighlight"
                    Highlight.OutlineTransparency = .9
                    Highlight.FillTransparency = 0.1
                    Highlight.FillColor = KnifeESPColor
                end
            elseif Soldiers.Name == "Model" then
                if not Soldiers:FindFirstChild("EspHighlight") then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Parent = Soldiers
                    Highlight.Name = "EspHighlight"
                    Highlight.OutlineTransparency = .9
                    Highlight.FillTransparency = 0.9
                    Highlight.FillColor = WeaponESPColor
                end
            end
        end
    end
    if workspace:FindFirstChild("tpv_sol_guis") then
        for _,Markers in pairs(workspace.tpv_sol_guis:GetChildren()) do
            if Markers ~= nil then
                if Markers.Name == "enemy_gui" then
                    if Markers.Adornee ~= workspace.tpv_sol_guis then
                        if Markers.health_frame.BackgroundTransparency == 1 then
                            Markers.Enabled = true
                            Markers.AlwaysOnTop = true
                            Markers.marker.ImageTransparency = 0
                            Markers.marker.shadow.ImageTransparency = 0.5
                            Markers.name_label.TextTransparency = 0
                            Markers.name_label.shadow.TextStrokeTransparency = 0.61
                            Markers.name_label.shadow.TextTransparency = 0.61
                            
                            local ChangeMarkerColor = true
                            local MarkerColor =  NameTagESPColor
                            if ChangeMarkerColor == true then
                                Markers.marker.ImageColor3 = MarkerColor
                                Markers.name_label.TextColor3 = MarkerColor
                                Markers.health_frame.health_bar.BackgroundColor3 = MarkerColor
                            end
                            
                        end
                    end
                end
            end
        end
    end
end
function RemoveESP()
    for _,Soldiers in pairs(workspace:GetChildren()) do
        if Soldiers ~= nil then
            if Soldiers.Name == "soldier_model" then
                if Soldiers:FindFirstChild("EspHighlight") then
                    Soldiers.EspHighlight:Destroy()
                end
                if Soldiers:FindFirstChild("ESPMarker") then
                    Soldiers.ESPMarker:Destroy()
                end
            elseif Soldiers.Name == "combat_knife" then
                if Soldiers:FindFirstChild("EspHighlight") then
                    Soldiers.EspHighlight:Destroy()
                end
            elseif Soldiers.Name == "Model" then
                if Soldiers:FindFirstChild("EspHighlight") then
                    Soldiers.EspHighlight:Destroy()
                end
            end
        end
    end
    if workspace:FindFirstChild("tpv_sol_guis") then
        for _,Markers in pairs(workspace.tpv_sol_guis:GetChildren()) do
            if Markers ~= nil then
                if Markers.Name == "enemy_gui" then
                    if Markers.Adornee ~= workspace.tpv_sol_guis then
                        Markers.Enabled = true
                        Markers.AlwaysOnTop = false
                        Markers.marker.ImageTransparency = 1
                        Markers.marker.shadow.ImageTransparency = 1
                        Markers.name_label.TextTransparency = 1
                        Markers.name_label.shadow.TextStrokeTransparency = 1
                        Markers.name_label.shadow.TextTransparency = 1
                        
                        Markers.marker.ImageColor3 = Color3.fromRGB(234, 50, 50)
                        Markers.name_label.TextColor3 = Color3.fromRGB(234, 50, 50)
                        Markers.health_frame.health_bar.BackgroundColor3 = Color3.fromRGB(234, 50, 50)
                    end
                end
            end
        end
    end
end

function RemoveBarriers()
    local CollectionService = game:GetService("CollectionService")
    for _, Barriers in pairs(CollectionService:GetTagged("MAP_BOUNDARY")) do
        if Barriers.CanCollide == true and Barriers.Transparency == 1 then
            Barriers:AddTag("RemovedBarrier")
            Barriers.CanCollide = false
        end
    end
end
function RestoreBarriers()
    local CollectionService = game:GetService("CollectionService")
    for _, Barriers in pairs(CollectionService:GetTagged("RemovedBarrier")) do
        if Barriers ~= nil then
            Barriers.CanCollide = true
        end
    end
end


function EnableNoclip()
    local Character = nil
    for _,Soldiers in pairs(workspace:GetChildren()) do
        if Soldiers ~= nil  then
            if Soldiers.Name == "soldier_model" then
                if Soldiers:FindFirstChild("fpv_rig") then
                    Character = Soldiers
                end
            end
        end
    end
    if Character ~= nil then
        Character.HumanoidRootPart.CanCollide =  false
    end
end
function DisableNoclip()
    local Character = nil
    for _,Soldiers in pairs(workspace:GetChildren()) do
        if Soldiers ~= nil  then
            if Soldiers.Name == "soldier_model" then
                if Soldiers:FindFirstChild("fpv_rig") then
                    Character = Soldiers
                end
            end
        end
    end
    if Character ~= nil then
        Character.HumanoidRootPart.CanCollide =  true
    end
end


function GetRandomEnemy()
    for _,Markers in pairs(workspace.tpv_sol_guis:GetChildren()) do
        if Markers ~= nil then
            if Markers.Name == "enemy_gui" then
                if Markers.Adornee ~= workspace.tpv_sol_guis then
                    Victim = Markers
                    break
                end
            end
        end
    end
end


function KnifeFire()
    for _,Knife in pairs(workspace:GetChildren()) do
        if Knife.Name == "Model" then
            if Knife:FindFirstChild("combat_knife") then
                if not Knife.combat_knife.Knife1.equipment:FindFirstChild("ParticleEmitter") then
                    --it is a knife
                    local Particles = Instance.new("ParticleEmitter")
                    Particles.Parent = Knife.combat_knife.Knife1.equipment
                    Particles.Color = ColorSequence.new(Color3.fromRGB(255,156,106))
                    Particles.LightInfluence = 1
                    Particles.LightEmission = 1
                    Particles.Size = NumberSequence.new(0.15)
                    Particles.Texture = "rbxassetid://101816370754006"
                    Particles.Transparency = NumberSequence.new(0.6,1)
                    Particles.Lifetime = NumberRange.new(2)
                    Particles.Rate = 6
                    Particles.Rotation = NumberRange.new(-360,360)
                    Particles.Speed = NumberRange.new(0.1,0.4)
                    Particles.LockedToPart = true
                    Particles.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8
                    Particles.FlipbookFramerate = 70
                    Particles.FlipbookMode = Enum.ParticleFlipbookMode.Loop
                    Particles.FlipbookStartRandom = true
                end
            end
        end
    end
end



function SetReticle()
    local Gun = nil
    for _,CheckGun in pairs(workspace:GetChildren()) do
        if CheckGun.Name == "Model" then
            Gun = CheckGun
            for _,Attachments in pairs(Gun:GetChildren()) do
                if Attachments:FindFirstChild("reticle") then
                    local Sight = Attachments
                    Sight.reticle.ImageLabel.Image = "rbxassetid://106681394040192"
                end
            end
        end
    end
end
function RestoreReticle()
    local Gun = nil
    for _,CheckGun in pairs(workspace:GetChildren()) do
        if CheckGun.Name == "Model" then
            Gun = CheckGun
            for _,Attachments in pairs(Gun:GetChildren()) do
                if Attachments:FindFirstChild("reticle") then
                    local Sight = Attachments
                    Sight.reticle.ImageLabel.Image = "rbxassetid://13741782316"
                end
            end
        end
    end
end



UserInputService.InputBegan:Connect(function(input)
    if Destroyed == false then
        for _,CheckFeatures in pairs(Frame:GetChildren()) do
            if CheckFeatures:FindFirstChild("KeyValue") then
                if input.KeyCode == (Enum.KeyCode[CheckFeatures.KeyValue.Value]) then
                    if CheckFeatures.FeatureValue.Value == "ESP" then
                        if ESP == false then
                            ESP = true
                            CheckFeatures.BackgroundColor3 = FeatureEnabledColor
                            AddESP()
                        else
                            ESP = false
                            CheckFeatures.BackgroundColor3 = FeatureColor
                            RemoveESP()
                        end
                    elseif CheckFeatures.FeatureValue.Value == "Toggle barriers" then
                        if Barriers == false then
                            Barriers = true
                            CheckFeatures.BackgroundColor3 = FeatureEnabledColor
                            RemoveBarriers()
                        else
                            Barriers = false
                            CheckFeatures.BackgroundColor3 = FeatureColor
                            RestoreBarriers()
                        end
                    elseif CheckFeatures.FeatureValue.Value == "Easy kills" then
                        if EasyKills == false then
                            EasyKills = true
                            CheckFeatures.BackgroundColor3 = FeatureEnabledColor
                            Victim = nil
                        else
                            EasyKills = false
                            CheckFeatures.BackgroundColor3 = FeatureColor
                            Victim = nil
                        end
                    elseif CheckFeatures.FeatureValue.Value == "Crazy movement" then
                        if CrazyMovement == false then
                            CrazyMovement = true
                            CheckFeatures.BackgroundColor3 = FeatureEnabledColor
                        else
                            CrazyMovement = false
                            CheckFeatures.BackgroundColor3 = FeatureColor
                        end
                    elseif CheckFeatures.FeatureValue.Value == "Knife Fire" then
                        KnifeFire()
                    elseif CheckFeatures.FeatureValue.Value == "Custom reticle" then
                        if CustomReticle == false then
                            CustomReticle = true
                            CheckFeatures.BackgroundColor3 = FeatureEnabledColor
                            SetReticle()
                        else
                            CustomReticle = false
                            CheckFeatures.BackgroundColor3 = FeatureColor
                            RestoreReticle()
                        end
                    end
                    break
                end
            end
        end
    end
end)

while true do
    wait(0)
    if ESP == true then
        if os.clock() -.25 > LastESPUpdate then
            print("UpdateESP")
            AddESP()
            LastESPUpdate = os.clock()
        end
    end
    local Character = nil
    for _,Soldiers in pairs(workspace:GetChildren()) do
        if Soldiers ~= nil then
            if Soldiers.Name == "soldier_model" then
                if Soldiers:FindFirstChild("fpv_rig") then
                    Character = Soldiers
                end
            end
        end
    end
    if Character ~= nil and CustomReticle == true then
        if os.clock() -1 > LastReticleUpdate or CanSetReticle == true then
            wait(0)
            print("setReticle")
            CanSetReticle = false
            LastReticleUpdate = os.clock()
            SetReticle()
        end
    else
        CanSetReticle = true
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
        Character.HumanoidRootPart.Velocity = workspace.CurrentCamera.CFrame.LookVector * 100
        Frame["Mouse TP"].BackgroundColor3 = FeatureEnabledColor
    else
        Frame["Mouse TP"].BackgroundColor3 = FeatureColor
    end
    if CrazyMovement == true and Character ~= nil then
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            Character.HumanoidRootPart.Velocity = Character.HumanoidRootPart.CFrame.LookVector * 100
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            Character.HumanoidRootPart.Velocity += Vector3.new(0,35,0)
        end
    else
        CrazyMovement = false
    end
    if EasyKills == true and Character ~= nil then
        if Victim == nil then
            GetRandomEnemy()
        end
        if Victim ~= nil then
            EnableNoclip()
            local VictimCharacter = Victim.Adornee.Parent
            if VictimCharacter ~= workspace then
                Character.HumanoidRootPart.Velocity = ((VictimCharacter.HumanoidRootPart.Position+Vector3.new(0,0,0)-(VictimCharacter.HumanoidRootPart.CFrame.LookVector*1))-Character.HumanoidRootPart.Position) * 23
                --cap velocity
            else
                Victim = nil
                DisableNoclip()
            end
        else
            DisableNoclip()
        end
    else
        DisableNoclip()
        EasyKills = false
    end
    if CrazyMovement == true or EasyKills ==  true and Character ~= nil then
        if Character.HumanoidRootPart.Velocity.X > 140 then
            Character.HumanoidRootPart.Velocity = Vector3.new(140,Character.HumanoidRootPart.Velocity.Y,Character.HumanoidRootPart.Velocity.Z)
        end
        if Character.HumanoidRootPart.Velocity.X < -140 then
            Character.HumanoidRootPart.Velocity = Vector3.new(-140,Character.HumanoidRootPart.Velocity.Y,Character.HumanoidRootPart.Velocity.Z)
        end
        if Character.HumanoidRootPart.Velocity.Y > 100 then
            Character.HumanoidRootPart.Velocity = Vector3.new(Character.HumanoidRootPart.Velocity.X,100,Character.HumanoidRootPart.Velocity.Z)
        end
        if Character.HumanoidRootPart.Velocity.Y < -100 then
            Character.HumanoidRootPart.Velocity = Vector3.new(Character.HumanoidRootPart.Velocity.X,-100,Character.HumanoidRootPart.Velocity.Z)
        end
        if Character.HumanoidRootPart.Velocity.Z > 140 then
            Character.HumanoidRootPart.Velocity = Vector3.new(Character.HumanoidRootPart.Velocity.X,Character.HumanoidRootPart.Velocity.Y,140)
        end
        if Character.HumanoidRootPart.Velocity.Z < -140 then
            Character.HumanoidRootPart.Velocity = Vector3.new(Character.HumanoidRootPart.Velocity.X,Character.HumanoidRootPart.Velocity.Y,-140)
        end
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.End) then
        print("destroying "..SciptTitle)
        UI:Destroy()
        Destroyed = true
        RemoveESP()
        RestoreBarriers()
        DisableNoclip()
        break
    end
end
