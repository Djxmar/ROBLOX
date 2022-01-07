local library = loadstring(game:GetObjects("rbxassetid://8441465992")[1].Source)() -- Library
loadstring(game:HttpGetAsync("https://pastebin.com/raw/Ts8TSAZN", 0, true))() -- Notification Script

if game.PlaceId == 4111023553 then notify("Choose your slot first and re-execute sense.") return end
if game.PlaceId == 5735553160 or game.PlaceId == 6032399813 then game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild('LoadingGui').Parent = nil end

local Plr = game.Players.LocalPlayer
local Mouse = Plr:GetMouse()
local camera = workspace.CurrentCamera;
local runservice = game:GetService'RunService';
local uis = game:GetService'UserInputService';

local Wait = library.subs.Wait

local SenseLib = library:CreateWindow({
Name = "Sense",
Themeable = false
})

local GeneralTabb = SenseLib:CreateTab({
Name = "General"
})

local PlayerSectionn = GeneralTabb:CreateSection({
Name = "Player"
})

_G.Bypass = false
PlayerSectionn:AddToggle({
Name = "Bypass",
Callback = function(v)
_G.Bypass = v
end
})

PlayerSectionn:AddButton({
Name = "Spawn Player",
Callback = function(v)
    if _G.Bypass then

if game.PlaceId == 5735553160 then
local plr = game.Players.LocalPlayer
game:GetService("ReplicatedStorage"):WaitForChild("Requests"):WaitForChild("StartMenu"):WaitForChild("Start"):FireServer()
local char = plr.Character or plr.CharacterAdded:wait()
local hrp = char:WaitForChild("CharacterHandler")
        
local safepart = Instance.new("Part", game.Workspace)
safepart.Name = "safetp"
safepart.Anchored = true
safepart.CanCollide = false
safepart.Transparency = 1
safepart.CFrame = CFrame.new(3064.80078, -1423.72949, 1579.94531, 0.0400669314, -3.61310164e-08, -0.999197006, 8.0379472e-09, 1, -3.58377363e-08, 0.999197006, -6.59558452e-09, 0.0400669314)
hrp:Destroy()
char:WaitForChild("HumanoidRootPart").CFrame = safepart.CFrame
wait(4)
char.Parent = game.Workspace:WaitForChild("Camera")
char:WaitForChild("Head"):Destroy()
elseif game.PlaceId == 6032399813 then
local plr = game.Players.LocalPlayer
game:GetService("ReplicatedStorage"):WaitForChild("Requests"):WaitForChild("StartMenu"):WaitForChild("Start"):FireServer()
local char = plr.Character or plr.CharacterAdded:wait()
local hrp = char:WaitForChild("CharacterHandler")    
    
local safepart = Instance.new("Part", game.Workspace)
safepart.Name = "safetp"
safepart.Anchored = true
safepart.CanCollide = false
safepart.Transparency = 1
safepart.CFrame = CFrame.new(-2731.08789, 979.972595, 708.588257, -0.0376689322, 5.11867846e-08, -0.999290287, 7.5666776e-08, 1, 4.83708291e-08, 0.999290287, -7.37909929e-08, -0.0376689322)
hrp:Destroy()
char:WaitForChild("HumanoidRootPart").CFrame = safepart.CFrame
wait(4)
char.Parent = game.Workspace:WaitForChild("Camera")
char:WaitForChild("Head"):Destroy()
end

            else
        game:GetService("ReplicatedStorage"):WaitForChild("Requests"):WaitForChild("StartMenu"):WaitForChild("Start"):FireServer()
    end
end
})

PlayerSectionn:AddButton({
Name = "Hide Leaderboard Name",
Callback = function()
if game.Players.LocalPlayer:FindFirstChild("leaderstats") and game.Players.LocalPlayer.Character == nil then
        game.Players.LocalPlayer:WaitForChild("leaderstats").Parent = nil
        notify("Successfully hid leaderboard name!")
    else
        notify("Leaderboard name is already hidden!")
    end
end
})

---------------------------------------
local character = Plr.Character or Plr.CharacterAdded:wait()
local humanoidwait = character:WaitForChild('Humanoid')

library.unload()

local library = loadstring(game:GetObjects("rbxassetid://8441465992")[1].Source)() -- Library

local Wait = library.subs.Wait

local SenseLib = library:CreateWindow({
Name = "Sense",
Themeable = {
Info = "Script made by Riz#7848"
}
})

local GeneralTab = SenseLib:CreateTab({
Name = "General"
})

local ESPTab = SenseLib:CreateTab({
Name = "ESP"
})

local FarmsTab = SenseLib:CreateTab({
Name = "Farms"
})

local PlayerSection = GeneralTab:CreateSection({
Name = "Player"
})

PlayerSection:AddButton({
Name = "Respawn",
Callback = function()
local danger = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("StatsGui"):WaitForChild("Danger")
if danger.Visible == false then
game.Players.LocalPlayer.Character:BreakJoints()
else
notify("You are in danger.")
end
end
})
PlayerSection:AddButton({
Name = "No Fall Damage",
Callback = function()
    if game.ReplicatedStorage:WaitForChild("Requests"):WaitForChild("FallDamage") then
        game.ReplicatedStorage.Requests.FallDamage.Parent = game.Lighting
        game.Lighting.FallDamage.Parent = nil
else
    notify("No Fall Damage has already been executed.")
    end
end
})
PlayerSection:AddButton({
Name = "Hide Leaderboard Name",
Callback = function()
    if game.Players.LocalPlayer:WaitForChild("leaderstats") and game.Players.LocalPlayer.Character == nil then
            game.Players.LocalPlayer.leaderstats.Parent = nil
        else
            notify("This feature only works while you are in the starter menu.")
    end
end
})

PlayerSection:AddButton({
    Name = "Eternal Inventory Items",
    Callback = function()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Droppable") then
                v.Parent = game.Players.LocalPlayer.Character
                v:FindFirstChild("Droppable"):Destroy()
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
    end
})

_G.EternalNewItems = false
PlayerSection:AddToggle({
    Name = "Eternal New Items & On Drop",
    Flag = "EternalNewItems",
    Callback = function(b)
        _G.EternalNewItems = b
        Plr.Backpack.DescendantAdded:Connect(function(v)
            if _G.EternalNewItems and v:IsA("Folder") and v.Name == "Droppable" then
                v.Parent.Parent = Plr.Character
                v:Destroy()
                notify(notify("Successfully eternaled: ".. v.Name,3))
                v.Parent.Parent = Plr.Backpack
            end
        end)
    end
})

_G.LootDropPickUp = false
PlayerSection:AddToggle({
Name = "Auto Loot Pickup",
Flag = "AutoLootPickup",
Keybind = 1,
Callback = function(v)
    _G.LootDropPickUp = v

    for i,v in pairs(game.Workspace:WaitForChild("Thrown"):GetChildren()) do
        if _G.LootDropPickUp and v.Name == "Model" and v:IsA("Model") and v:FindFirstChild("LootDrop") then
            local distance = (Plr.Character.HumanoidRootPart.Position - v.LootDrop.Position).Magnitude
            if _G.LootDropPickUp and distance <= 60 then
            v.LootDrop.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end

    game.Workspace.Thrown.DescendantAdded:connect(function(b)
        if _G.LootDropPickUp and b.Name == 'LootDrop' and b.Parent.Name == "Model" then 
            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - b.Position).Magnitude
    
            if _G.LootDropPickUp and distance <= 60 then
                b.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                wait()
            end    
    
        end
    end)

end
})

PlayerSection:AddKeybind({
Name = "Click Delete",
Flag = "ClickDelete",
Mode = "Toggle",
Pressed = function(v)
    if not Mouse.Target then return end
    Mouse.Target.Parent = nil
end
})

local CombatSection = GeneralTab:CreateSection({
Name = "Combat"
})

_G.CombatHax = false
CombatSection:AddToggle({
Name = "Combat Hax",
Flag = "Combat_Hax",
Keybind = 1,
Callback = function(v)
    _G.CombatHax = v
    game.Players.LocalPlayer.Character.DescendantAdded:connect(function(v)
        wait()
        if _G.CombatHax and v.Name == 'NoSclera'  or v.Name == 'BodyGyro' or v.Name == 'ClientRemove' then
            v.Parent = game.Lighting
        end
    end)
    
    game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        wait()
        if _G.CombatHax and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed <= 16 then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
        end
    end)
    
    game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
        wait()
        if _G.CombatHax and game.Players.LocalPlayer.Character.Humanoid.JumpPower <= 0 then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 35.700
        end
    end)
    
    game.Players.LocalPlayer.Character.HumanoidRootPart:GetPropertyChangedSignal("Anchored"):Connect(function()
        wait()
        if _G.CombatHax and game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        end
    end)
end
})


CombatSection:AddToggle({
Name = "Auto Parry",
Flag = "AutoParry",
Keybind = 1,
Callback = print
})

_G.InstantLog = false
CombatSection:AddToggle({
Name = "Instant Log",
Flag = "InstantLog",
Value = false,
Keybind = 1,
Callback = function(v)
    _G.InstantLog = v
    local danger = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("StatsGui"):WaitForChild("Danger")

if _G.InstantLog and danger.Visible == false then
        game.Players.LocalPlayer:Kick("Ez log bro")
end

danger:GetPropertyChangedSignal("Visible"):Connect(function()
    if danger.Visible == false then
            game:GetService("RunService").RenderStepped:wait()
            game.Players.LocalPlayer:Kick()
        else
        return
    end
end)
end
})

local MovementSection = GeneralTab:CreateSection({
Name = "Movement"
})

_G.flySpeed = 100;
function IsInZone(Object1, Object2, YCheck) -- broken 2 lazy 2 fix
    if (typeof(Object1) ~= 'Instance' and typeof(Object1) ~= 'table') or (typeof(Object2) ~= 'Instance' and typeof(Object2) ~= 'table') then return 'NIGGER'; end
    if YCheck ~= nil and typeof(YCheck) ~= 'boolean' then return end

    YCheck = (YCheck ~= nil and YCheck or false);

    local RYCheck = true;

    local Object = Object1;
    
    local Positive = (Object2.CFrame * CFrame.new(Object2.Size.X / 2, Object2.Size.Y / 2, Object2.Size.Z / 2));
    local Negative = (Object2.CFrame * CFrame.new(-Object2.Size.X / 2, -Object2.Size.Y / 2, -Object2.Size.Z / 2));

    if YCheck then
        RYCheck = (YCheck == true and
            (Object.Position.Y > Positive.Y) and
            (Object.Position.Y < Negative.Y));
    end

    -- print(1, (Object.Position.X < Positive.X), Object.Position.X, Positive.X)
    -- print(2, (Object.Position.X > Negative.X), Object.Position.X, Negative.X)
    -- print(3, (Object.Position.Z > Positive.Z), Object.Position.Z, Positive.Z)
    -- print(4, (Object.Position.Z < Negative.Z), Object.Position.Z, Negative.Z)
    -- print(5, RYCheck);

    return (Object.Position.X < Positive.X) and
        (Object.Position.X > Negative.X) and
        (Object.Position.Z > Positive.Z) and
        (Object.Position.Z < Negative.Z) and
        (RYCheck);
end

function GetIndex(Table, Value)
    for i, v in pairs(Table) do
        if v == Value then
            return i;
        end
    end

    return -1;
end

local PartIgnore = {};

function DisableClip(Part)
    if Part:IsA'BasePart' and Part.CanCollide then
        local Start = tick();
        local OldTransparency = Part.Transparency;
        
        table.insert(PartIgnore, Part);

        while tick() - Start < 300 and player.Character and player.Character:FindFirstChild'HumanoidRootPart' and not input.down.f4 do
            if tick() - Start > 1 and not IsInZone(player.Character.HumanoidRootPart, Part, true) and not IsInZone({Position = camera.CFrame.p}, Part, true) then
                break;
            end

            Part.CanCollide = false;
            if not gay then Part.Transparency = 0.75; end

            wait(1 / 8);
        end

        table.remove(PartIgnore, GetIndex(PartIgnore, Part));

        Part.Transparency = OldTransparency;
        Part.CanCollide = true;
    end
end

local lastDC = 0;

uis.InputChanged:Connect(function(Input)
    if script ~= shared.sfls then return; end

    if Input.UserInputType == Enum.UserInputType.MouseWheel then
        if input.down.leftcontrol then
            local inc = Input.Position.Z > 0 and 25 or -25;

            _G.flySpeed = math.clamp(_G.flySpeed + (inc * (input.down.leftshift and 2 or 1)), 0, maxSpeed);
            lastDC = tick();
        end
    end

    if disp then -- too lazy to make a loop or some bullshit to update this text so i just made it update .
        disp.Text = 'FlySpeed: ' .. _G.flySpeed;
        disp.Position = Vector2.new(150, tick() - lastDC < 5 and 7 or -100);
    end
end);

_G.Fly = false
MovementSection:AddToggle({
    Name = "Fly",
    Flag = "Fly",
    Value = false,
    Keybind = 1,
    Callback = function(v)
        local player = game:GetService'Players'.LocalPlayer;
        local mouse = player:GetMouse();

        _G.Fly = v
        local maxSpeed = 360;
        local disp;

        shared.sfls = script;
        
         if _G.Fly and player.Character and player.Character:FindFirstChild'HumanoidRootPart' and player.Character:FindFirstChildOfClass'Humanoid' then
                local root = player.Character.HumanoidRootPart;
                local hum = player.Character:FindFirstChildOfClass'Humanoid';
                while _G.Fly do
                    if not gay then hum.PlatformStand = true; end
                    local start = mouse.Hit.p;
                    local dir = (start - camera.CFrame.p);
        
                    root.Velocity = dir.unit * (math.random((_G.flySpeed - 1) * 1000, (_G.flySpeed + 2.5) * 1000) / 1000); -- adds random speed so the velocity doesn't always measure to a certain amount (prevents detection)
        
                    local ray = Ray.new(root.Position, dir.unit * 50);
                    local hit, pos = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character, camera, unpack(PartIgnore)});
        
        
                    runservice.RenderStepped:wait();
                end
                
                if not gay then
                    hum.PlatformStand = false;
                    root.Velocity = Vector3.new();
                    hum:SetStateEnabled(0, false);
                end
         end
        end
    })

_G.Noclip = false
MovementSection:AddToggle({
Name = "Noclip",
Flag = "Noclip",
Keybind = 1,
Callback = function(v)
    _G.Noclip = v
    game:GetService('RunService').Stepped:connect(function()
        if game.Players.LocalPlayer.Character and _G.Noclip then
            for _,child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if child:IsA("BasePart") and child.CanCollide == true then
                    child.CanCollide = false;
                end;
            end;
        end;
    end);
end
})

_G.WalkSpeedToggle = false
MovementSection:AddToggle({
Name = "Walk Speed",
Flag = "WalkSpeed",
Keybind = 1,
Callback = function(v)
_G.WalkSpeedToggle = v
    if _G.WalkSpeedToggle then
        while _G.WalkSpeedToggle do
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = _G.WalkSpeed
            game:GetService("RunService").RenderStepped:wait()
        end
    else
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 16
        end
    end
})

_G.JumpPowerToggle = false
MovementSection:AddToggle({
    Name = "Jump Power",
    Flag = "JumpPower",
    Keybind = 1,
    Callback = function(v)
    _G.JumpPowerToggle = v
        if _G.JumpPowerToggle then
            while _G.JumpPowerToggle do
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = _G.JumpPower
                game:GetService("RunService").RenderStepped:wait()
            end
        else
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = 50
            end
        end
    })

_G.InfiniteJump = false
MovementSection:AddToggle({
Name = "Infinite Jump",
Flag = "InfiniteJump",
Keybind = 1,
Callback = function(v)
    local Player = game:GetService'Players'.LocalPlayer;
    local UIS = game:GetService'UserInputService';

    _G.JumpHeight = 50;
    _G.InfiniteJump = v
function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if _G.InfiniteJump and UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
end
})

MovementSection:AddKeybind({
Name = "Click Teleport",
Flag = "ClickTeleport",
Pressed = function(v)
    local distance = (Mouse.Hit.p - Plr.Character.HumanoidRootPart.Position).Magnitude
    if distance < 55 then
    if not Mouse.Hit.p then return end
    Plr.Character:MoveTo(Mouse.Hit.p)
    end
end
})

MovementSection:AddSlider({
Name = "Fly Speed",
Flag = "FlySpeed",
Value = 100,
Min = 0,
Max = 200,
Textbox = true,
Format = function(v)
if Value == 0 then
return "Stuck in the air bro"
else
_G.flySpeed = v
return "Fly Speed: " .. tostring(_G.flySpeed)
end
end
})

_G.WalkSpeed = 32
MovementSection:AddSlider({
Name = "Walk Speed",
Flag = "WalkSpeedSlider",
Value = 60,
Min = 32,
Max = 190,
Textbox = true,
Format = function(v)
if v == 0 then
return "Stuck in the air bro"
else
_G.WalkSpeed = v
return "Walk Speed: " .. tostring(_G.WalkSpeed)
end
end
})

_G.JumpPower = 32
MovementSection:AddSlider({
Name = "Jump Power",
Flag = "JumpPowerSlider",
Value = 100,
Min = 50,
Max = 300,
Textbox = true,
Format = function(v)
if v == 0 then
return "Cant jump now lol"
else
_G.JumpPower = v
return "Jump Power: " .. tostring(_G.JumpPower)
end
end
})

local VisualsSection = GeneralTab:CreateSection({
Name = "Visuals",
Side = "Right"
})

_G.NoFog = false
VisualsSection:AddToggle({
Name = "No Fog",
Flag = "NoFog",
Keybind = 1,
Callback = function(v)
    _G.NoFog = v
    local lighting = game:GetService("Lighting")

if _G.NoFog then
        if lighting:FindFirstChild("Atmosphere") then
            lighting:FindFirstChild("Atmosphere").Parent = game.ReplicatedStorage
            while _G.NoFog do
                wait()
                lighting.FogEnd = 1000000
            end
        elseif not lighting:FindFirstChild("Atmosphere") then
         while _G.NoFog do
             wait()
            lighting.FogEnd = 1000000
        end
    end


        else
            if game.ReplicatedStorage:FindFirstChild("Atmosphere") then
                game.ReplicatedStorage:FindFirstChild("Atmosphere").Parent = lighting
            end
    end
end
})

_G.NoBlur = false
VisualsSection:AddToggle({
Name = "No Blur",
Flag = "NoBlur",
Keybind = 1,
Callback = function(v)
    local lighting = game:GetService("Lighting")
    _G.NoBlur = v
    
    if _G.NoBlur then

    if lighting:FindFirstChild("Bloom") then
        lighting:FindFirstChild("Bloom").Parent = game.ReplicatedStorage
    end
    if lighting:FindFirstChild("FlashBloom") then
        lighting:FindFirstChild("FlashBloom").Parent = game.ReplicatedStorage
    end
    if lighting:FindFirstChild("UnderwaterBlur") then
        lighting:FindFirstChild("UnderwaterBlur").Parent = game.ReplicatedStorage
    end
    if lighting:FindFirstChild("SpitBlur") then
        lighting:FindFirstChild("SpitBlur").Parent = game.ReplicatedStorage
    end
    if lighting:FindFirstChild("GenericBlur") then
        lighting:FindFirstChild("GenericBlur").Parent = game.ReplicatedStorage
    end
    if lighting:FindFirstChild("IntenseDepth") then
        lighting:FindFirstChild("IntenseDepth").Parent = game.ReplicatedStorage
    end
    if lighting:FindFirstChild("DepthOfField") then
        lighting:FindFirstChild("DepthOfField").Parent = game.ReplicatedStorage
    end
    if lighting:FindFirstChild("DistortionBlur") then
        lighting:FindFirstChild("DistortionBlur").Parent = game.ReplicatedStorage
    end

        else
            local replicatedstorage = game:GetService("ReplicatedStorage")
            if replicatedstorage:FindFirstChild("Bloom") then
                replicatedstorage:FindFirstChild("Bloom").Parent = lighting
            end
            if replicatedstorage:FindFirstChild("FlashBloom") then
                replicatedstorage:FindFirstChild("FlashBloom").Parent = lighting
            end
            if replicatedstorage:FindFirstChild("UnderwaterBlur") then
                replicatedstorage:FindFirstChild("UnderwaterBlur").Parent = lighting
            end
            if replicatedstorage:FindFirstChild("GenericBlur") then
                replicatedstorage:FindFirstChild("GenericBlur").Parent = lighting
            end
            if replicatedstorage:FindFirstChild("SpitBlur") then
                replicatedstorage:FindFirstChild("SpitBlur").Parent = lighting
            end
            if replicatedstorage:FindFirstChild("DistortionBlur") then
                replicatedstorage:FindFirstChild("DistortionBlur").Parent = lighting
            end
            if replicatedstorage:FindFirstChild("IntenseDepth") then
                replicatedstorage:FindFirstChild("IntenseDepth").Parent = lighting
            end
            if replicatedstorage:FindFirstChild("DepthOfField") then
                replicatedstorage:FindFirstChild("DepthOfField").Parent = lighting
            end

    end


end
})

_G.NoBlind = false
VisualsSection:AddToggle({
Name = "No Blind",
Flag = "NoBlind",
Keybind = 1,
Callback = function(v)
    local lighting = game:GetService("Lighting")
    _G.NoBlind = v
    
    if _G.NoBlind then

    if lighting:FindFirstChild("Wakeup") then
        lighting:FindFirstChild("Wakeup").Parent = game.ReplicatedStorage
    end

        else
    if game.ReplicatedStorage:FindFirstChild("Wakeup") then
        game.ReplicatedStorage:FindFirstChild("Wakeup").Parent = lighting
     end

    end
end
})

_G.Fullbright = false
VisualsSection:AddToggle({
Name = "Fullbright",
Flag = "Fullbright",
Keybind = 1,
Callback = function(v)
_G.Fullbright = v
local lighting = game:GetService("Lighting")

while _G.Fullbright do
if _G.Fullbright then    
if lighting:FindFirstChild("AreaBrightness") then
    wait()
    lighting:FindFirstChild("AreaBrightness").Value = _G.Brightness
    game.Lighting.Ambient = Color3.fromRGB(255,255,255)
    lighting.GlobalShadows = false
    else
    wait()
    lighting.Brightness = _G.Brightness
    game.Lighting.Ambient = Color3.fromRGB(255,255,255)
    lighting.GlobalShadows = false
end
end
end

if _G.Fullbright == false then
if lighting:FindFirstChild("AreaBrightness") then
        lighting.GlobalShadows = true
        lighting:FindFirstChild("AreaBrightness").Value = 1.25
    else
        lighting.Brightness = 1.25
        lighting.GlobalShadows = true
end
end

end
})

_G.Brightness = 0
VisualsSection:AddSlider({
    Name = "Brightness",
    Flag = "Brightness",
    Value = 4,
    Min = 0,
    Max = 10,
    Textbox = true,
    Format = function(v)
    if v == 0 then
    return "Brightness: 0"
    else
    _G.Brightness = v
    return "Brightness: " .. tostring(_G.Brightness)
    end
    end
})


local MiscSection = GeneralTab:CreateSection({
Name = "Miscellaneous",
Side = "Right"
})
MiscSection:AddToggle({
Name = "No kill bricks",
Flag = "NoKillBricks",
Callback = print
})
MiscSection:AddToggle({
Name = "Child Printer",
Flag = "ChildPrinter",
Keybind = 1,
Callback = print
})
MiscSection:AddToggle({
Name = "Children Printer",
Flag = "ChildrenPrinter",
Keybind = 1,
Callback = print
})
MiscSection:AddToggle({
Name = "ChildAdded Printer",
Flag = "CharChildAddedPrinter",
Callback = print
})
MiscSection:AddToggle({
Name = "DescendantAdded Printer",
Flag = "CharChildAddedPrinter",
Callback = print
})


local ConfigSection = GeneralTab:CreateSection({
Name = "Configs",
Side = "Right"
})

ConfigSection:AddPersistence({
    Name = "Configs",
    Suffix = "Config",
    Flags = 1 -- true: ALL Flags, 1: Window, 2: Tab, 3: Section, Table: Custom Flags
})

local PlayersESPSection = ESPTab:CreateSection({
Name = "Players",
})

local PlayersESPSection = ESPTab:CreateSection({
    Name = "Objects & Items",
})


--Settings--
_G.ESP = {
    Enabled = false,
    Boxes = false,
    BoxShift = CFrame.new(0,0,0),
	BoxSize = Vector3.new(4,7,0),
    Color = Color3.fromRGB(255,255,255),
    FaceCamera = false,
    Names = false,
    TeamColor = true,
    Thickness = 1,
    AttachShift = 5,
    TeamMates = true,
    Players = true,
    
    Objects = setmetatable({}, {__mode="kv"}),
    Overrides = {}
}

_G.ColorsESP = {
    Boxes = Color3.fromRGB(255,255,255),
    Names = Color3.fromRGB(255,255,255),
    Distance = Color3.fromRGB(255,255,255),
    Talents = Color3.fromRGB(255,255,255),
    Tracers = Color3.fromRGB(255,255,255),
    Objects = setmetatable({}, {__mode="kv"}),
    Overrides = {}
}

--Declarations--
local cam = workspace.CurrentCamera
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()

local V3new = Vector3.new
local WorldToViewportPoint = cam.WorldToViewportPoint

--Functions--
local function Draw(obj, props)
	local new = Drawing.new(obj)
	
	props = props or {}
	for i,v in pairs(props) do
		new[i] = v
	end
	return new
end

function _G.ESP:GetTeam(p)
	local ov = self.Overrides.GetTeam
	if ov then
		return ov(p)
	end
	
	return p and p.Team
end

function _G.ESP:IsTeamMate(p)
    local ov = self.Overrides.IsTeamMate
	if ov then
		return ov(p)
    end
    
    return self:GetTeam(p) == self:GetTeam(plr)
end

function _G.ESP:GetColor(obj)
	local ov = self.Overrides.GetColor
	if ov then
		return ov(obj)
    end
    local p = self:GetPlrFromChar(obj)
	return p and self.TeamColor and p.Team and p.Team.TeamColor.Color or self.Color
end

function _G.ESP:GetPlrFromChar(char)
	local ov = self.Overrides.GetPlrFromChar
	if ov then
		return ov(char)
	end
	
	return plrs:GetPlayerFromCharacter(char)
end

function _G.ESP:Toggle(bool)
    self.Enabled = bool
    if not bool then
        for i,v in pairs(self.Objects) do
            if v.Type == "Box" then --fov circle etc
                if v.Temporary then
                    v:Remove()
                else
                    for i,v in pairs(v.Components) do
                        v.Visible = false
                    end
                end
            end
        end
    end
end

function _G.ESP:GetBox(obj)
    return self.Objects[obj]
end

function _G.ESP:AddObjectListener(parent, options)
    local function NewListener(c)
        if type(options.Type) == "string" and c:IsA(options.Type) or options.Type == nil then
            if type(options.Name) == "string" and c.Name == options.Name or options.Name == nil then
                if not options.Validator or options.Validator(c) then
                    local box = _G.ESP:Add(c, {
                        PrimaryPart = type(options.PrimaryPart) == "string" and c:WaitForChild(options.PrimaryPart) or type(options.PrimaryPart) == "function" and options.PrimaryPart(c),
                        Color = type(options.Color) == "function" and options.Color(c) or options.Color,
                        ColorDynamic = options.ColorDynamic,
                        Name = type(options.CustomName) == "function" and options.CustomName(c) or options.CustomName,
                        IsEnabled = options.IsEnabled,
                        RenderInNil = options.RenderInNil
                    })
                    --TODO: add a better way of passing options
                    if options.OnAdded then
                        coroutine.wrap(options.OnAdded)(box)
                    end
                end
            end
        end
    end

    if options.Recursive then
        parent.DescendantAdded:Connect(NewListener)
        for i,v in pairs(parent:GetDescendants()) do
            coroutine.wrap(NewListener)(v)
        end
    else
        parent.ChildAdded:Connect(NewListener)
        for i,v in pairs(parent:GetChildren()) do
            coroutine.wrap(NewListener)(v)
        end
    end
end

local boxBase = {}
boxBase.__index = boxBase

function boxBase:Remove()
    _G.ESP.Objects[self.Object] = nil
    for i,v in pairs(self.Components) do
        v.Visible = false
        v:Remove()
        self.Components[i] = nil
    end
end

function boxBase:Update()
    if not self.PrimaryPart then
        --warn("not supposed to print", self.Object)
        return self:Remove()
    end

    local color
    if _G.ESP.Highlighted == self.Object then
       color = _G.ESP.HighlightColor
    else
        color = self.Color or self.ColorDynamic and self:ColorDynamic() or _G.ESP:GetColor(self.Object) or _G.ESP.Color
    end

    local allow = true
    if _G.ESP.Overrides.UpdateAllow and not _G.ESP.Overrides.UpdateAllow(self) then
        allow = false
    end
    if self.Player and not _G.ESP.TeamMates and _G.ESP:IsTeamMate(self.Player) then
        allow = false
    end
    if self.Player and not _G.ESP.Players then
        allow = false
    end
    if self.IsEnabled and (type(self.IsEnabled) == "string" and not _G.ESP[self.IsEnabled] or type(self.IsEnabled) == "function" and not self:IsEnabled()) then
        allow = false
    end
    if not workspace:IsAncestorOf(self.PrimaryPart) and not self.RenderInNil then
        allow = false
    end

    if not allow then
        for i,v in pairs(self.Components) do
            v.Visible = false
        end
        return
    end

    if _G.ESP.Highlighted == self.Object then
        color = _G.ESP.HighlightColor
    end

    --calculations--
    local cf = self.PrimaryPart.CFrame
    if _G.ESP.FaceCamera then
        cf = CFrame.new(cf.p, cam.CFrame.p)
    end
    local size = self.Size
    local locs = {
        TopLeft = cf * _G.ESP.BoxShift * CFrame.new(size.X/2,size.Y/2,0),
        TopRight = cf * _G.ESP.BoxShift * CFrame.new(-size.X/2,size.Y/2,0),
        BottomLeft = cf * _G.ESP.BoxShift * CFrame.new(size.X/2,-size.Y/2,0),
        BottomRight = cf * _G.ESP.BoxShift * CFrame.new(-size.X/2,-size.Y/2,0),
        TagPos = cf * _G.ESP.BoxShift * CFrame.new(0,size.Y/1,0),
        Torso = cf * _G.ESP.BoxShift
    }

    if _G.ESP.Boxes then
        local TopLeft, Vis1 = WorldToViewportPoint(cam, locs.TopLeft.p)
        local TopRight, Vis2 = WorldToViewportPoint(cam, locs.TopRight.p)
        local BottomLeft, Vis3 = WorldToViewportPoint(cam, locs.BottomLeft.p)
        local BottomRight, Vis4 = WorldToViewportPoint(cam, locs.BottomRight.p)

        if self.Components.Quad then
            if Vis1 or Vis2 or Vis3 or Vis4 then
                self.Components.Quad.Visible = true
                self.Components.Quad.PointA = Vector2.new(TopRight.X, TopRight.Y)
                self.Components.Quad.PointB = Vector2.new(TopLeft.X, TopLeft.Y)
                self.Components.Quad.PointC = Vector2.new(BottomLeft.X, BottomLeft.Y)
                self.Components.Quad.PointD = Vector2.new(BottomRight.X, BottomRight.Y)
                self.Components.Quad.Color = _G.ColorsESP.Boxes
            else
                self.Components.Quad.Visible = false
            end
        end
    else
        self.Components.Quad.Visible = false
    end

    if _G.ESP.Names then
        local TagPos, Vis5 = WorldToViewportPoint(cam, locs.TagPos.p)
        
        if Vis5 then
            self.Components.Name.Visible = true
            self.Components.Name.Position = Vector2.new(TagPos.X, TagPos.Y)
            self.Components.Name.Text = self.Name
            self.Components.Name.Color = _G.ColorsESP.Names
            
            self.Components.Distance.Visible = true
            self.Components.Distance.Position = Vector2.new(TagPos.X, TagPos.Y + 15)
            
            local count = 0

        for i,v in pairs(game.Players:WaitForChild(self.Name):WaitForChild("Backpack"):GetChildren()) do
                if v:IsA("Folder") and v.Name:match("Talent") then
                     count = count + 1
            end
        end
        
            local count2 = 0
        for i,v in pairs(game.Players:WaitForChild(self.Name):WaitForChild("Backpack"):GetChildren()) do
                if v:IsA("Tool") and v.Name:match("Mantra") then
                    count2 = count2 + 1
            end
        end

         self.Components.Talents.Visible = true
        self.Components.Talents.Position = Vector2.new(TagPos.X, TagPos.Y + 30)
        self.Components.Talents.Text = "[Talents: "..tostring(count).."] ".."[Mantras: "..tostring(count2).."]"
        self.Components.Talents.Color = _G.ColorsESP.Talents
        
            self.Components.Distance.Text = "[".. math.floor(game.Players[self.Name].Character.Humanoid.Health).. "/".. game.Players[self.Name].Character.Humanoid.MaxHealth .."]" .. " [" ..math.floor((cam.CFrame.p - cf.p).magnitude) .."m]"
            self.Components.Distance.Color = _G.ColorsESP.Distance
        else
            self.Components.Name.Visible = false
            self.Components.Distance.Visible = false
            self.Components.Talents.Visible = false
        end
    else
        self.Components.Name.Visible = false
        self.Components.Distance.Visible = false
        self.Components.Talents.Visible = false
    end
    
    if _G.ESP.Tracers then
        local TorsoPos, Vis6 = WorldToViewportPoint(cam, locs.Torso.p)

        if Vis6 then
            self.Components.Tracer.Visible = true
            self.Components.Tracer.From = Vector2.new(TorsoPos.X, TorsoPos.Y)
            self.Components.Tracer.To = Vector2.new(cam.ViewportSize.X/2,cam.ViewportSize.Y/_G.ESP.AttachShift)
            self.Components.Tracer.Color = _G.ColorsESP.Tracers
        else
            self.Components.Tracer.Visible = false
        end
    else
        self.Components.Tracer.Visible = false
    end
end

function _G.ESP:Add(obj, options)
    if not obj.Parent and not options.RenderInNil then
        return warn(obj, "has no parent")
    end

    local box = setmetatable({
        Name = options.Name or obj.Name,
        Type = "Box",
        Color = options.Color --[[or self:GetColor(obj)]],
        Size = options.Size or self.BoxSize,
        Object = obj,
        Player = options.Player or plrs:GetPlayerFromCharacter(obj),
        PrimaryPart = options.PrimaryPart or obj.ClassName == "Model" and (obj.PrimaryPart or obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")) or obj:IsA("BasePart") and obj,
        Components = {},
        IsEnabled = options.IsEnabled,
        Temporary = options.Temporary,
        ColorDynamic = options.ColorDynamic,
        RenderInNil = options.RenderInNil
    }, boxBase)

    if self:GetBox(obj) then
        self:GetBox(obj):Remove()
    end

    box.Components["Quad"] = Draw("Quad", {
        Thickness = self.Thickness,
        Color = _G.ColorsESP.Boxes,
        Transparency = 1,
        Filled = false,
        Visible = self.Enabled and self.Boxes
    })
    box.Components["Name"] = Draw("Text", {
		Text = box.Name,
		Color = box.Color,
		Center = true,
		Outline = true,
        Size = 18,
        Visible = self.Enabled and self.Names
	})
	box.Components["Distance"] = Draw("Text", {
		Color = box.Color,
		Center = true,
		Outline = true,
        Size = 18,
        Visible = self.Enabled and self.Names
	})
		box.Components["Talents"] = Draw("Text", {
		Color = box.Color,
		Center = true,
		Outline = true,
        Size = 19,
        Visible = self.Enabled and self.Names
	})
	
	box.Components["Tracer"] = Draw("Line", {
		Thickness = _G.ESP.Thickness,
		Color = box.Color,
        Transparency = 1,
        Visible = self.Enabled and self.Tracers
    })
    self.Objects[obj] = box
    
    obj.AncestryChanged:Connect(function(_, parent)
        if parent == nil and _G.ESP.AutoRemove ~= false then
            box:Remove()
        end
    end)
    obj:GetPropertyChangedSignal("Parent"):Connect(function()
        if obj.Parent == nil and _G.ESP.AutoRemove ~= false then
            box:Remove()
        end
    end)

    local hum = obj:FindFirstChildOfClass("Humanoid")
	if hum then
        hum.Died:Connect(function()
            if _G.ESP.AutoRemove ~= false then
                box:Remove()
            end
		end)
    end

    return box
end

local function CharAdded(char)
    local p = plrs:GetPlayerFromCharacter(char)
    if not char:FindFirstChild("HumanoidRootPart") then
        local ev
        ev = char.ChildAdded:Connect(function(c)
            if c.Name == "HumanoidRootPart" then
                ev:Disconnect()
                _G.ESP:Add(char, {
                    Name = p.Name,
                    Player = p,
                    PrimaryPart = c
                })
            end
        end)
    else
        _G.ESP:Add(char, {
            Name = p.Name,
            Player = p,
            PrimaryPart = char.HumanoidRootPart
        })
    end
end
local function PlayerAdded(p)
    p.CharacterAdded:Connect(CharAdded)
    if p.Character then
        coroutine.wrap(CharAdded)(p.Character)
    end
end
plrs.PlayerAdded:Connect(PlayerAdded)
for i,v in pairs(plrs:GetPlayers()) do
    if v ~= plr then
        PlayerAdded(v)
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    cam = workspace.CurrentCamera
    for i,v in (_G.ESP.Enabled and pairs or ipairs)(_G.ESP.Objects) do
        if v.Update then
            local s,e = pcall(v.Update, v)
            if not s then warn("[EU]", e, v.Object:GetFullName()) end
        end
    end
end)

PlayersESPSection:AddToggle({
    Name = "Enabled",
    Flag = "PlayersESP",
    Keybind = 1,
    Callback = function(b)
       _G.ESP:Toggle(b)
    end
})

PlayersESPSection:AddToggle({
    Name = "Boxes",
    Flag = "Boxes",
    Callback = function(b)
       _G.ESP.Boxes = b
    end
})

PlayersESPSection:AddToggle({
    Name = "Name & Info",
    Flag = "NameAndInfo",
    Callback = function(b)
       _G.ESP.Names = b
    end
})

PlayersESPSection:AddToggle({
    Name = "Face Camera",
    Flag = "FaceCamera",
    Callback = function(b)
       _G.ESP.FaceCamera = b
    end
})

PlayersESPSection:AddSlider({
Name = "Box Size",
Flag = "BoxSize",
Value = 4,
Min = 0,
Max = 20,
Textbox = true,
Format = function(v)
if v == 0 then
return "No boxes?"
else
_G.ESP.BoxSize = Vector3.new(v,v+2,0)
return "Box Size: " .. tostring(v)
end
end
})

PlayersESPSection:AddSlider({
Name = "Box Shift",
Flag = "BoxShift",
Value = 0,
Min = 0,
Max = 6,
Textbox = true,
Format = function(v)
if v == 0 then
_G.ESP.BoxShift = CFrame.new(0,v,0)
return "Box Shift: " .. tostring(v)
else
_G.ESP.BoxShift = CFrame.new(0,v,0)
return "Box Shift: " .. tostring(v)
end
end
})

PlayersESPSection:AddColorpicker({
    Name = "Box Color",
    Flag = "BoxColor",
    Callback = function(v)
        _G.ColorsESP.Boxes = v
    end
})

PlayersESPSection:AddColorpicker({
    Name = "Name Color",
    Flag = "NameColor",
    Callback = function(v)
        _G.ColorsESP.Names = v
    end
})

PlayersESPSection:AddColorpicker({
    Name = "Health & Distance Color",
    Flag = "HealthAndDistanceColor",
    Callback = function(v)
        _G.ColorsESP.Distance = v
    end
})

PlayersESPSection:AddColorpicker({
    Name = "Talents & Mantras Color",
    Flag = "TalentsAndMantrasColor",
    Callback = function(v)
        _G.ColorsESP.Talents = v
    end
})
