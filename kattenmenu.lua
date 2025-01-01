local SciptTitle = "KattenMenu(nabanu version="
print("starting "..SciptTitle)


local Destroyed = false
local RGBHue = 0
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
local FeatureEnabledColor = Color3.fromRGB(162, 0, 255)
local TitleColor = Color3.fromRGB(160, 15, 250)
local FeatureTextColor = Color3.fromRGB(255, 255, 255)
local TitleTextColor = Color3.fromRGB(255, 255, 255)

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
local FeatureName = "Increase hitbox"
local FeatureKey = "Home"
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
local IncreaseHitboxToggle = false
local LastHitboxFix = os.clock()

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
local FeatureName = "Glass camo"
local FeatureKey = "Zero"
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
local FeatureName = "Camo2"
local FeatureKey = "Nine"
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
local FeatureName = "Camo3"
local FeatureKey = "Eight"
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
local FeatureName = "Camo4"
local FeatureKey = "Seven"
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
local FeatureName = "One handed mode"
local FeatureKey = "Z"
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
local OneHanded = false

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
local FeatureName = "Lock settings"
local FeatureKey = "Slash/Enter"
local MenuFeatureTitle = ExampleButton:Clone()
MenuFeatureTitle.Name = FeatureName
MenuFeatureTitle.Parent = Frame
MenuFeatureTitle.Text = FeatureName .. " - " .. FeatureKey
MenuFeatureTitle.Position = UDim2.new(0, 0, 0, ((MenuFeatures-1)*FeatureUISize)+20)
local LockSettings = false

MenuFeatures += 1
local FeatureName = "Destroy menu"
local FeatureKey = "END"
local MenuFeatureTitle = ExampleButton:Clone()
MenuFeatureTitle.Name = FeatureName
MenuFeatureTitle.Parent = Frame
MenuFeatureTitle.Text = FeatureName .. " - " .. FeatureKey
MenuFeatureTitle.Position = UDim2.new(0, 0, 0, ((MenuFeatures-1)*FeatureUISize)+20)

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
                    Highlight.FillTransparency = 0.5
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
                    Highlight.FillTransparency = 0.5
                    Highlight.FillColor = KnifeESPColor
                end
                elseif Soldiers.Name == "Model" then
                if not Soldiers:FindFirstChild("EspHighlight") then
                local Highlight = Instance.new("Highlight")
                Highlight.Parent = Soldiers
                Highlight.Name = "EspHighlight"
                Highlight.OutlineTransparency = .9
                Highlight.FillTransparency = 0.5
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
                if Knife.combat_knife.Knife1:FindFirstChild("FireParticlesAttachment") then
                    Knife.combat_knife.Knife1.FireParticlesAttachment:Destroy()
                end
                local FireParticlesAttachment = Knife.combat_knife.Knife1.equipment:Clone()
                FireParticlesAttachment.Parent = Knife.combat_knife.Knife1
                FireParticlesAttachment.Name = "FireParticlesAttachment"
                FireParticlesAttachment.Position = Vector3.new(0, 0.45, 0)
                
                local FireLight =  Instance.new("PointLight")
                FireLight.Parent = FireParticlesAttachment
                FireLight.Color = Color3.fromRGB(255, 171, 97)
                FireLight.Brightness = .9
                FireLight.Range = 3.6
                local FireLight2 =  Instance.new("PointLight")
                FireLight2.Parent = FireParticlesAttachment
                FireLight2.Color = Color3.fromRGB(255, 171, 97)
                FireLight2.Brightness = .07
                FireLight2.Range = 18
                
                local Particles = Instance.new("ParticleEmitter")
                Particles.Parent = Knife.combat_knife.Knife1.FireParticlesAttachment
                Particles.Orientation = Enum.ParticleOrientation.VelocityParallel
                Particles.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
                Particles.LightInfluence = 1
                Particles.LightEmission = 1
                Particles.Size = NumberSequence.new(.6)
                Particles.Texture = "rbxassetid://12371091637"
                Particles.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.2, 0.1),
                    NumberSequenceKeypoint.new(1, 1)
                })
                Particles.Lifetime = NumberRange.new(1.5)
                Particles.Rate = 1.8
                Particles.Rotation = NumberRange.new(-90,-90)
                Particles.Speed = NumberRange.new(0.05,0.05)
                Particles.LockedToPart = true
                Particles.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8
                Particles.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
                --Particles.FlipbookFramerate = 200
                --Particles.FlipbookStartRandom = true
            end
        end
    end
end


function SetWeaponCamo(CamoType)
    for _,CheckGun in pairs(workspace:GetChildren()) do
        if CheckGun.Name == "Model" then
            if CheckGun:FindFirstChild("ReflectionHighlight") then
                CheckGun.ReflectionHighlight:Destroy()
            end
            if CamoType == 1 then
                local ReflectionHighlight = Instance.new("Highlight")
                ReflectionHighlight.Parent = CheckGun
                ReflectionHighlight.Enabled = false
                ReflectionHighlight.Name = "ReflectionHighlight"
            end
            if CamoType == 2 then
                if game.MaterialService:FindFirstChild("CamoMaterial2") then
                    game.MaterialService.CamoMaterial2:Destroy()
                end
                local CamoMaterial = game.MaterialService:FindFirstChild("trainBasalt"):Clone()
                CamoMaterial.Parent = game.MaterialService
                CamoMaterial.StudsPerTile = 2
                CamoMaterial.Name = "CamoMaterial2"
            end
            for _,Attachments in pairs(CheckGun:GetChildren()) do
                for _,AttachmentsParts in pairs(Attachments:GetChildren()) do
                    if AttachmentsParts:HasTag("Camo3") then
                        AttachmentsParts:RemoveTag("Camo3")
                    end
                    if AttachmentsParts:HasTag("Camo4") then
                        AttachmentsParts:RemoveTag("Camo4")
                    end
                    if AttachmentsParts:FindFirstChild("SurfaceAppearance") then
                        AttachmentsParts.SurfaceAppearance:Destroy()
                    end
                    if CamoType == 1 then
                        if AttachmentsParts.ClassName == "MeshPart" then
                            if AttachmentsParts.Transparency < 0.1 or AttachmentsParts.Transparency > 1 then
                                AttachmentsParts.Color = Color3.fromRGB(197, 0, 0)
                                AttachmentsParts.Material = Enum.Material.Glass
                                AttachmentsParts.MaterialVariant = ""
                                AttachmentsParts.Transparency = 5
                            end
                        end
                    elseif CamoType == 2 then
                        if AttachmentsParts.ClassName == "MeshPart" then
                            if AttachmentsParts.Transparency < 0.1 or AttachmentsParts.Transparency > 1 then
                                AttachmentsParts.Color = Color3.fromRGB(70, 20, 171)
                                AttachmentsParts.Material = Enum.Material.Basalt
                                AttachmentsParts.MaterialVariant = "CamoMaterial2"
                                AttachmentsParts.Transparency = 0
                            end
                        end
                    elseif CamoType == 3 then
                        if AttachmentsParts.ClassName == "MeshPart" then
                            if AttachmentsParts.Transparency < 0.1 or AttachmentsParts.Transparency > 1 then
                                AttachmentsParts:AddTag("Camo3")
                                AttachmentsParts.Color = Color3.fromHSV(RGBHue, 0.88, 0.67)
                                AttachmentsParts.Material = Enum.Material.Basalt
                                AttachmentsParts.MaterialVariant = "CamoMaterial2"
                                AttachmentsParts.Transparency = 0
                            end
                        end
                    elseif CamoType == 4 then
                        if AttachmentsParts.ClassName == "MeshPart" then
                            if AttachmentsParts.Transparency < 0.1 or AttachmentsParts.Transparency > 1 then
                                AttachmentsParts:AddTag("Camo4")
                                AttachmentsParts.Color = Color3.fromHSV(RGBHue, 1, 1)
                                AttachmentsParts.Material = Enum.Material.Metal
                                AttachmentsParts.MaterialVariant = "galvanizedMetal"
                                AttachmentsParts.Transparency = 0
                            end
                        end
                    end
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
                    Sight.reticle.ImageLabel.Image = "rbxassetid://84530698691386"
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


function SetHitbox()
    for _,HitboxParts in pairs(workspace:GetChildren()) do
        if HitboxParts ~= nil  then
            if HitboxParts.Name == "Part" then
                if not HitboxParts:FindFirstChild("OriginalHitboxSize") then
                    local SizeValue = Instance.new("Vector3Value")
                    SizeValue.Parent = HitboxParts
                    SizeValue.Value = HitboxParts.Size
                    SizeValue.Name = "OriginalHitboxSize"
                    HitboxParts.Size = Vector3.new(0.936, 1.414, 1.145) * 8
                    HitboxParts.Transparency = 1
                end
            end
        end
    end
end
function ResetHitbox()
    for _,HitboxParts in pairs(workspace:GetChildren()) do
        if HitboxParts ~= nil  then
            if HitboxParts.Name == "Part" then
                if HitboxParts:FindFirstChild("OriginalHitboxSize") then
                    HitboxParts.Size = HitboxParts.OriginalHitboxSize.Value
                    HitboxParts.Transparency = 1
                    HitboxParts.OriginalHitboxSize:Destroy()
                end
            end
        end
    end
end


function EnableOneHanded()
    local Character = nil
    for _,Soldiers in pairs(workspace:GetChildren()) do
        if Soldiers ~= nil  then
            if Soldiers.Name == "soldier_model" then
                if Soldiers:FindFirstChild("fpv_rig") then
                    Character = Soldiers
                    local fpv_rig = Soldiers.fpv_rig
                    fpv_rig.FPVForearmL_LocCorrected.Transparency = 1
                    fpv_rig.FPVGloveL_LocCorrected.Transparency = 1
                    fpv_rig.FPVUpperArmL_LocCorrected.Transparency = 1
                end
            end
        end
    end
end

function DisableOneHanded()
    local Character = nil
    for _,Soldiers in pairs(workspace:GetChildren()) do
        if Soldiers ~= nil  then
            if Soldiers.Name == "soldier_model" then
                if Soldiers:FindFirstChild("fpv_rig") then
                    Character = Soldiers
                    local fpv_rig = Soldiers.fpv_rig
                    fpv_rig.FPVForearmL_LocCorrected.Transparency = 0
                    fpv_rig.FPVGloveL_LocCorrected.Transparency = 0
                    fpv_rig.FPVUpperArmL_LocCorrected.Transparency = 0
                end
            end
        end
    end
end





UserInputService.InputBegan:Connect(function(input)
    if Destroyed == false then
        if input.KeyCode == Enum.KeyCode.Slash then
            LockSettings = true
            Frame["Lock settings"].BackgroundColor3 = FeatureEnabledColor
        end
        if input.KeyCode == Enum.KeyCode.Return then
            LockSettings = false
            Frame["Lock settings"].BackgroundColor3 = FeatureColor
        end
        if LockSettings == false then
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
                        elseif CheckFeatures.FeatureValue.Value == "Increase hitbox" then
                            if IncreaseHitboxToggle == false then
                                IncreaseHitboxToggle = true
                                SetHitbox()
                                CheckFeatures.BackgroundColor3 = FeatureEnabledColor
                            else
                                IncreaseHitboxToggle = false
                                ResetHitbox()
                                CheckFeatures.BackgroundColor3 = FeatureColor
                            end
                        elseif CheckFeatures.FeatureValue.Value == "Knife Fire" then
                            KnifeFire()
                        elseif CheckFeatures.FeatureValue.Value == "Glass camo" then
                            SetWeaponCamo(1)
                        elseif CheckFeatures.FeatureValue.Value == "Camo2" then
                            SetWeaponCamo(2)
                        elseif CheckFeatures.FeatureValue.Value == "Camo3" then
                            SetWeaponCamo(3)
                        elseif CheckFeatures.FeatureValue.Value == "Camo4" then
                            SetWeaponCamo(4)
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
                        elseif CheckFeatures.FeatureValue.Value == "One handed mode" then
                            if OneHanded == false then
                                OneHanded = true
                                CheckFeatures.BackgroundColor3 = FeatureEnabledColor
                                EnableOneHanded()
                            else
                                OneHanded = false
                                CheckFeatures.BackgroundColor3 = FeatureColor
                                DisableOneHanded()
                            end
                        end
                        break
                    end
                end
            end
        end
    end
end)

while true do
    wait(0)
    RGBHue += 0.005
    if RGBHue > 1 then
        RGBHue -= 1
    end
    if ESP == true then
        if os.clock() -.25 > LastESPUpdate then
            print("UpdateESP")
            AddESP()
            LastESPUpdate = os.clock()
        end
    else
        if os.clock() -1.5 > LastESPUpdate then
            RemoveESP()
            LastESPUpdate = os.clock()
        end
    end
    if IncreaseHitboxToggle == true then
        if os.clock() -1 > LastHitboxFix then
            print("FixHitbox")
            SetHitbox()
            LastHitboxFix = os.clock()
        end
    else
        if os.clock() -3 > LastHitboxFix then
            ResetHitbox()
            LastHitboxFix = os.clock()
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
    if UserInputService:IsKeyDown(Enum.KeyCode.T) and LockSettings == false then
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
                Character.HumanoidRootPart.Velocity = ((VictimCharacter.HumanoidRootPart.Position+Vector3.new(0,0,0)-(VictimCharacter.HumanoidRootPart.CFrame.LookVector*2.5))-Character.HumanoidRootPart.Position) * 15
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
    if game.MaterialService:FindFirstChild("CamoMaterial2") then
        game.MaterialService.CamoMaterial2.StudsPerTile = 2+(math.sin(os.clock()*.3)/1.8)
    end
    local CollectionService = game:GetService("CollectionService")
    for _, CamoParts in pairs(CollectionService:GetTagged("Camo3")) do
        if CamoParts ~= nil then
            CamoParts.Color = Color3.fromHSV(RGBHue, 0.88, 0.67)
        end
    end
    for _, CamoParts in pairs(CollectionService:GetTagged("Camo4")) do
        if CamoParts ~= nil then
            CamoParts.Color = Color3.fromHSV(RGBHue, 1, 1)
        end
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.End) then
        print("destroying "..SciptTitle)
        UI:Destroy()
        Destroyed = true
        RemoveESP()
        RestoreBarriers()
        DisableNoclip()
        RestoreReticle()
        ResetHitbox()
        break
    end
end
