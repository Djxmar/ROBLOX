local library = loadstring(game:GetObjects("rbxassetid://8441465992")[1].Source)() -- Library
loadstring(game:HttpGetAsync("https://pastebin.com/raw/Ts8TSAZN", 0, true))() -- Notification Script

if game.Players.LocalPlayer:IsFriendsWith(3254550839) then else game.Players.LocalPlayer:Kick("You're not whitelisted.") end
if game.PlaceId == 4111023553 then notify("Choose your slot first and re-execute sense.") return end

local Plr = game.Players.LocalPlayer
local Mouse = Plr:GetMouse()
local camera = workspace.CurrentCamera;
local runservice = game:GetService'RunService';
local uis = game:GetService'UserInputService';
                           
local Wait = library.subs.Wait

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

    
local PlayerSection = GeneralTab:CreateSection({
Name = "Player"
})

    
PlayerSection:AddButton({
Name = "Respawn",
Callback = function()
game.Players.LocalPlayer.Character:BreakJoints()
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
    Name = "Soulbound All Inventory Items",
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

PlayerSection:AddButton({
    Name = "Infinite Natural Armor",
    Callback = function()
        if game.Players.LocalPlayer.Character:FindFirstChild("NaturalArmor") then
            game.Players.LocalPlayer.Character.NaturalArmor:Destroy()
        else
            notify("Infinite Natural Armor has already been executed!")
        end
    end
})

PlayerSection:AddButton({
    Name = "Infinite Stomach Buff",
    Callback = function()
        if game.Players.LocalPlayer.Character:FindFirstChild("StomachBuff") then
            game.Players.LocalPlayer.Character.StomachBuff:Destroy()
        else
            notify("Infinite Stomach Buff has already been executed!")
        end
    end
})

_G.Uncarrieable = false
PlayerSection:AddToggle({
    Name = "Uncarrieable",
    Flag = "Uncarrieable",
    Callback = function(b)
        _G.Uncarrieable = b
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").ChildAdded:connect(function(v)
            if _G.Uncarrieable and v.Name == "Motor6D" then
                game:GetService("RunService").RenderStepped:wait()
                v.Parent = nil
            end
        end)
    end
})

_G.NoKnockStun = false
PlayerSection:AddToggle({
    Name = "No Knocked Stun",
    Flag = "NoKnockStun",
    Callback = function(b)
        _G.NoKnockStun = b
        game.Players.LocalPlayer.Character.DescendantAdded:connect(function(v)
            if _G.NoKnockStun and v.Name == "Weld" and v.Parent.Name == "Bone" then
                game:GetService("RunService").RenderStepped:wait()
                v.Parent = nil
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


local WorldTab = GeneralTab:CreateSection({
Name = "World",
Side = "Right"
})

_G.NoKillBricks = false
WorldTab:AddToggle({
Name = "No Kill Bricks",
Flag = "NoKillBricks",
Callback = function(v)
    _G.NoKillBricks = v

    if _G.NoKillBricks then
        
        for i,v in pairs(game.Workspace:GetChildren()) do
            if _G.NoKillBricks and v.Name == "KillPlane" or v.Name == "ChasmBrick" then
                v.Parent = game.Lighting
            end
        end

        else
            for i,v in pairs(game.Lighting:GetChildren()) do
                if v.Name == "KillPlane" or v.Name == "ChasmBrick" then
                    v.Parent = game.Workspace
                end
            end
    end
end
})

_G.DepthsWhirlpools = false
WorldTab:AddToggle({
    Name = "No Depths Whirlpools",
    Flag = "NoDepthsWhirlpools",
    Callback = function(v)
        _G.DepthsWhirlpools = v
        if _G.DepthsWhirlpools then
        for _,a in pairs(game.Workspace:GetChildren()) do
            if _G.DepthsWhirlpools and a.Name == "DepthsWhirlpool" and a:FindFirstChild("Part") then
                a.Part.Parent = game:GetService("Lighting")
            end
        end
    else
        for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
            if v.Name == "Part" then
                v.Parent = game.Workspace
            end
        end
        end
end
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


_G.BoxThickness = 1.5
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local LocalPlayer = Players.LocalPlayer
local MoveMouse = mousemoverel

local CIELUVInterpolator = loadstring(game:HttpGet("https://raw.githubusercontent.com/Djxmar/ROBLOX/main/lerp", true))()
local HealthbarLerp = CIELUVInterpolator:Lerp(Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0))

_G.ESP = {
    Boxes = false;
    HealthBar = false;
    Name = false;
    IngameName = false;
    ExtraInfo = false;
}

local Visuals = {Players = {}} do
    local DrawingProperties = {
        Line = {
            Thickness = 1.5,
            Color = Color3.fromRGB(255, 255, 255),
            Visible = false
        },
        Text = {
            Size = 16,
            Center = true,
            Outline = true,
            Color = Color3.fromRGB(255, 255, 255),
            Visible = false
        },
        Square = {
            Thickness = _G.BoxThickness,
            Filled = false,
            Color = Color3.fromRGB(255, 255, 255),
            Visible = false
        },
        Image = {
            Rounding = 0,
            Visible = false
        }
    }

    function Visuals:Round(Number, Bracket)
        Bracket = (Bracket or 1)

        if typeof(Number) == "Vector2" then
            return Vector2.new(Visuals:Round(Number.X), Visuals:Round(Number.Y))
        else
            return (Number - Number % (Bracket or 1))
        end
    end

    function Visuals:GetScreenPosition(Position)
        local Position, Visible = Workspace.CurrentCamera:WorldToViewportPoint(Position)
        local FullPosition = Position
        Position = Vector2.new(Position.X, Position.Y)

        return Position, Visible, FullPosition
    end

    function Visuals:CreateDrawing(Type, Custom)
        local Drawing = Drawing.new(Type)

        for Property, Value in pairs(DrawingProperties[Type]) do
            Drawing[Property] = Value
        end

        if Custom then
            for Property, Value in pairs(Custom) do
                Drawing[Property] = Value
            end
        end

        return Drawing
    end

    function Visuals.AddPlayer(Player)
        if not Visuals.Players[Player] then
            Visuals.Players[Player] = {
                Box = {
                    Outline = Visuals:CreateDrawing("Square", {Color = Color3.fromRGB(0, 0, 0)}),
                    Main = Visuals:CreateDrawing("Square")
                    --// Main = Visuals:CreateDrawing("Image", {Data = game:HttpGet("https://coasts.cool/uploads/48ny7FCjZ9iCmbAwlirI.png")})

                },
                Healthbar = {
                    Outline = Visuals:CreateDrawing("Square", {Filled = true, Color = Color3.fromRGB(0, 0, 0)}),
                    Main = Visuals:CreateDrawing("Square", {Filled = true, Color = Color3.fromRGB(0, 255, 0)})
                },
                Info = {
                    Main = Visuals:CreateDrawing("Text"),
                    Extra = Visuals:CreateDrawing("Text"),
                    TalentsMantras = Visuals:CreateDrawing("Text")
                }
            }
        end
    end

    function Visuals.RemovePlayer(Player)
        if Visuals.Players[Player] then
            for Index, Table in pairs(Visuals.Players[Player]) do
                for Index2, Drawing in pairs(Table) do
                    if Drawing.Remove then
                        Drawing:Remove()
                    end
                end
            end

            Visuals.Players[Player] = nil
        end
    end
end

local PlayerUtilities = {} do
    function PlayerUtilities:IsPlayerAlive(Player)
        local Character = Player.Character
        local Humanoid = (Character and Character:FindFirstChildWhichIsA("Humanoid"))

        if Character and Humanoid then
            if Humanoid.Health > 0 then
                return true
            end
        end

        return false
    end

    function PlayerUtilities:GetHealth(Player)
        local Character = Player.Character
        local Humanoid = (Character and Character:FindFirstChildWhichIsA("Humanoid"))

        if Character and Humanoid then
            return {
                CurrentHealth = Humanoid.Health,
                MaxHealth = Humanoid.MaxHealth
            }
        end
    end

    function PlayerUtilities:GetBodyParts(Player)
        local Character = Player.Character
        local Head = (Character and Character:FindFirstChild("Head"))
        local Root = (Character and Character:FindFirstChild("HumanoidRootPart"))
        local Torso = Character and (Character:FindFirstChild("LowerTorso") or Character:FindFirstChild("Torso"))
        local LeftArm = Character and (Character:FindFirstChild("LeftLowerArm") or Character:FindFirstChild("Left Arm"))
        local RightArm = Character and (Character:FindFirstChild("RightLowerArm") or Character:FindFirstChild("Right Arm"))
        local LeftLeg = Character and (Character:FindFirstChild("LeftLowerLeg") or Character:FindFirstChild("Left Leg"))
        local RightLeg = Character and (Character:FindFirstChild("RightLowerLeg") or Character:FindFirstChild("Right Leg"))

        if Character and (Head and Root and Torso and LeftArm and RightArm and LeftLeg and RightLeg) then
            return {
                Character = Character,
                Head = Head,
                Root = Root,
                Torso = Torso,
                LeftArm = LeftArm,
                RightArm = RightArm,
                LeftLeg = LeftLeg,
                RightLeg = RightLeg
            }
        end
    end

    function PlayerUtilities:GetTeamColor(Player)
        return Player.TeamColor.Color
    end

    function PlayerUtilities:IsOnClientTeam(Player)
        if LocalPlayer.Team == Player.Team then
            return true
        end

        return false
    end

    function PlayerUtilities:GetDistanceFromClient(Position)
        return LocalPlayer:DistanceFromCharacter(Position)
    end


end


for Index, Player in pairs(Players:GetPlayers()) do
    if Player == LocalPlayer then continue end
    Visuals.AddPlayer(Player)
end

game.Players.PlayerAdded:Connect(function(player)
    local talentcount = Instance.new("IntValue", player)
    talentcount.Name = "TalentCount"
    local mantracount = Instance.new("IntValue", player)
    mantracount.Name = "MantraCount"
    
    local count = 0
    local count2 = 0
    
    game:GetService("RunService").RenderStepped:wait()
    player.CharacterAdded:Connect(function(char)
        local humrp = char:WaitForChild("HumanoidRootPart")
        wait(4)
        local backpack = player:WaitForChild("Backpack")
        for i,v in pairs(player:WaitForChild("Backpack"):GetChildren()) do
        if v:IsA("Folder") and v.Name:match("Talent") then
            count = count + 1
        end
        
        if v:IsA("Tool") and v.Name:match("Mantra") then
            count2 = count2 + 1
        end 
    end
    talentcount.Value = count
    mantracount.Value = count2
    warn(talentcount.Value,mantracount.Value)
        
    end)
end)

Players = game:GetService("Players")
for i, player in pairs(Players:GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
    local talentcount = Instance.new("IntValue", player)
    talentcount.Name = "TalentCount"
    local mantracount = Instance.new("IntValue", player)
    mantracount.Name = "MantraCount"
    
    local count = 0
    local count2 = 0
    
    for i,v in pairs(player:WaitForChild("Backpack"):GetChildren()) do
        if v:IsA("Folder") and v.Name:match("Talent") then
            count = count + 1
        end
        
        if v:IsA("Tool") and v.Name:match("Mantra") then
            count2 = count2 + 1
        end 
    end
    talentcount.Value = count
    mantracount.Value = count2
    print(talentcount.Value,mantracount.Value)
end
end

_G.BoxEspColor = Color3.fromRGB(255, 255, 255)
_G.NameColorsESP = Color3.fromRGB(255, 255, 255)
_G.StatsInfoColor = Color3.fromRGB(255,255,255)

Players.PlayerAdded:Connect(Visuals.AddPlayer)
Players.PlayerRemoving:Connect(Visuals.RemovePlayer)
RunService.RenderStepped:Connect(function()
    for Index, Player in pairs(Players:GetPlayers()) do
        if Player == LocalPlayer then continue end
        local Objects = Visuals.Players[Player]
        if not Objects then continue end

        local OnScreen, PassedTeamCheck = false, true
        local IsPlayerAlive = PlayerUtilities:IsPlayerAlive(Player)
        local Health = PlayerUtilities:GetHealth(Player)
        local BodyParts = PlayerUtilities:GetBodyParts(Player)
        local PlayerColor = _G.BoxEspColor
        local IsOnClientTeam = PlayerUtilities:IsOnClientTeam(Player)

        if IsPlayerAlive and Health and BodyParts and PlayerColor and PassedTeamCheck then
            local HealthPercent = (Health.CurrentHealth / Health.MaxHealth)
            local Distance = PlayerUtilities:GetDistanceFromClient(BodyParts.Root.Position)
            ScreenPosition, OnScreen = Visuals:GetScreenPosition(BodyParts.Root.Position)

            local Orientation, Size = BodyParts.Character:GetBoundingBox()
            local Height = (Workspace.CurrentCamera.CFrame - Workspace.CurrentCamera.CFrame.Position) * Vector3.new(0, (math.clamp(Size.Y, 1, 10) + 0.5) / 2, 0)
            Height = math.abs(Workspace.CurrentCamera:WorldToScreenPoint(Orientation.Position + Height).Y - Workspace.CurrentCamera:WorldToScreenPoint(Orientation.Position - Height).Y)
            Size = Visuals:Round(Vector2.new((Height / 2), Height))

            local NameString = string.format("%s", Player.Name)

            Objects.Box.Main.Color = PlayerColor
            Objects.Box.Main.Size = Size
            Objects.Box.Main.Position = Visuals:Round(Vector2.new(ScreenPosition.X, ScreenPosition.Y) - (Size / 2))

            Objects.Box.Outline.Thickness = (Objects.Box.Main.Thickness * 2)
            Objects.Box.Outline.Size = Objects.Box.Main.Size
            Objects.Box.Outline.Position = Objects.Box.Main.Position

            Objects.Healthbar.Main.Color = HealthbarLerp(HealthPercent)
            Objects.Healthbar.Main.Size = Vector2.new(2, (-Objects.Box.Main.Size.Y * HealthPercent))
            Objects.Healthbar.Main.Position = Vector2.new((Objects.Box.Main.Position.X - (Objects.Box.Outline.Thickness + 1)), (Objects.Box.Main.Position.Y + Objects.Box.Main.Size.Y))

            Objects.Healthbar.Outline.Size = Vector2.new(4, (Objects.Box.Main.Size.Y + 2))
            Objects.Healthbar.Outline.Position = Vector2.new((Objects.Box.Main.Position.X - (Objects.Box.Outline.Thickness + 2)), (Objects.Box.Main.Position.Y - 1))
            
            Objects.Info.Main.Font = Drawing.Fonts.UI
            Objects.Info.Main.Text = NameString
            Objects.Info.Main.Color = _G.NameColorsESP
            Objects.Info.Main.Position = Vector2.new(((Objects.Box.Main.Size.X / 2) + Objects.Box.Main.Position.X), ((ScreenPosition.Y - Objects.Box.Main.Size.Y / 2) - 18))

            

            Objects.Info.Extra.Font = Drawing.Fonts.UI
            Objects.Info.Extra.Text = string.format("(%dft) (%d/%d)", Distance, Health.CurrentHealth, Health.MaxHealth).."\n[Talents: "..tostring(Player:WaitForChild("TalentCount").Value).."] [Mantras: "..tostring(Player:WaitForChild("MantraCount").Value).."]"
            Objects.Info.Extra.Position = Vector2.new(((Objects.Box.Main.Size.X / 2) + Objects.Box.Main.Position.X), (Objects.Box.Main.Size.Y + Objects.Box.Main.Position.Y))
            Objects.Info.Extra.Color = _G.StatsInfoColor
        end

        Objects.Box.Main.Visible = (OnScreen and _G.ESP.Boxes) or false
        Objects.Box.Outline.Visible = Objects.Box.Main.Visible

        Objects.Healthbar.Main.Visible = (OnScreen and _G.ESP.HealthBar) or false
        Objects.Healthbar.Outline.Visible = Objects.Healthbar.Main.Visible

        Objects.Info.Main.Visible = (OnScreen and _G.ESP.Name) or false
        Objects.Info.Extra.Visible = (OnScreen and _G.ESP.ExtraInfo) or false
    end
end)

local Fonts = {} do
    for Font, Number in pairs(Drawing.Fonts) do
        table.insert(Fonts, Font)
    end
end


PlayersESPSection:AddToggle({
    Name = "Enabled",
    Flag = "PlayersESP",
    Keybind = 1,
    Callback = function(b)
        PlayersESPSection.Value = false
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
    Name = "Names",
    Flag = "Names",
    Callback = function(b)
       _G.ESP.Name = b
    end
})

PlayersESPSection:AddToggle({
    Name = "Stats Info",
    Flag = "StatsInfo",
    Callback = function(b)
       _G.ESP.ExtraInfo = b
    end
})

PlayersESPSection:AddToggle({
    Name = "Health Bars",
    Flag = "PlrHealthBars",
    Callback = function(b)
       _G.ESP.HealthBar = b
    end
})

PlayersESPSection:AddColorpicker({
    Name = "Box Color",
    Flag = "BoxColor",
    Callback = function(v)
        _G.BoxEspColor = v
    end
})

PlayersESPSection:AddColorpicker({
    Name = "Name Color",
    Flag = "NameColor",
    Callback = function(v)
        _G.NameColorsESP = v
    end
})

PlayersESPSection:AddColorpicker({
    Name = "Stats Info Color",
    Flag = "StatsInfoColor",
    Callback = function(v)
        _G.StatsInfoColor = v 
    end
})

--

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:wait()

game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TalentGui").DescendantAdded:Connect(function(v)
    wait()
    if v:IsA("TextLabel") and v.Name == "Title" and v.Text == "Mystery Mantra" then
        v.Parent:FindFirstChild("Desc").Text = v.Parent:FindFirstChild("Desc").Text.."\n\n<font color='#FFA500'><stroke color='#000000' joins='miter' thickness='1.6' transparency='0.2'>".. v.Parent.Parent.Name .."</stroke></font>"
        wait(.5)
        v.Parent.Desc.RichText = true
    end
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function(v)
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TalentGui").DescendantAdded:Connect(function(v)
    wait()
    if v:IsA("TextLabel") and v.Name == "Title" and v.Text == "Mystery Mantra" then
        v.Parent:FindFirstChild("Desc").Text = v.Parent:FindFirstChild("Desc").Text.."\n\n<font color='#FFA500'><stroke color='#000000' joins='miter' thickness='1.6' transparency='0.2'>".. v.Parent.Parent.Name .."</stroke></font>"
        wait(.5)
        v.Parent.Desc.RichText = true
    end
end)
end)		
		
--		
if game.Players.LocalPlayer:IsFriendsWith(3445427861) then
	local EternalTab = SenseLib:CreateTab({
	Name = "Eternal"
	})
	local EternalSection = EternalTab:CreateSection({
		Name = "Settings"
	})
	_G.EternalNewItems = false
	PlayerSection:AddToggle({
		Name = "Soulbound New Items & On Drop",
		Flag = "EternalNewItems",
		Callback = function(b)
			_G.EternalNewItems = b
			Plr.Backpack.DescendantAdded:Connect(function(v)
				if _G.EternalNewItems and v:IsA("Folder") and v.Name == "Droppable" then
					v.Parent.Parent = Plr.Character
					v:Destroy()
					notify(notify("Successfully Soulbound: ".. v.Name,3))
					v.Parent.Parent = Plr.Backpack
				end
			end)
		end
	})
	
	-- Eternal Section
	_G.EternalAutoLog = false
	_G.PlayMemeMusic = false
	_G.AnchorOnEternal = false
	_G.DisableDeathSound = false
	_G.TeleportToLobby = false
	
	local function playsound()
	
		local Strings = {'rbxassetid://279207008', 'rbxassetid://3979042576', 'rbxassetid://130768080', 'rbxassetid://599238463', 'rbxassetid://4875051709', 'rbxassetid://3629259234', 'rbxassetid://2619237842', 'rbxassetid://131122314', 'rbxassetid://386974055', 'rbxassetid://417372826', 'rbxassetid://604671208', 'rbxassetid://4662452515'}
		
		local st = Strings[math.random(1, #Strings)]
		local sound = Instance.new("Sound", game.Workspace)
		sound.SoundId = st
		sound:Play()
		warn(st)
	end
	
	EternalSection:AddKeybind({
		Name = "Eternal Keybind",
		Flag = "EternalKeybind",
		Mode = "Toggle",
		Pressed = function(v)
			
			if _G.AnchorOnEternal then
				game.Players.LocalPlayer.Character["Head"].Anchored = true
				game.Players.LocalPlayer.Character["Torso"].Anchored = true
				game.Players.LocalPlayer.Character["HumanoidRootPart"].Anchored = true
				game.Players.LocalPlayer.Character["Left Arm"].Anchored = true
				game.Players.LocalPlayer.Character["Right Arm"].Anchored = true
				game.Players.LocalPlayer.Character["Left Leg"].Anchored = true
				game.Players.LocalPlayer.Character["Right Leg"].Anchored = true
			end
	
			game.Players.LocalPlayer.Character.EffectsServer.Parent = nil
	
			if _G.PlayMemeMusic then
				playsound()
			end
	
			wait()
	
			game.Players.LocalPlayer.Character:BreakJoints()
			if _G.DisableDeathSound then
				game.Players.LocalPlayer.Character["Head"].Parent = nil
				game.Players.LocalPlayer.Character["Torso"].Parent = nil
				game.Players.LocalPlayer.Character["HumanoidRootPart"].Parent = nil
				game.Players.LocalPlayer.Character["Humanoid"].Parent = nil
				game.Players.LocalPlayer.Character["Left Arm"].Parent = nil
				game.Players.LocalPlayer.Character["Right Arm"].Parent = nil
				game.Players.LocalPlayer.Character["Left Leg"].Parent = nil
				game.Players.LocalPlayer.Character["Right Leg"].Parent = nil
			end
			wait(1)
			if _G.EternalAutoLog then
				game.Players.LocalPlayer:Kick("Ez shit bruh")
				if _G.TeleportToLobby then
					local ts = game:GetService("TeleportService")
					local p = game:GetService("Players").LocalPlayer
	
					ts:Teleport(4111023553, p)
				end
			end
	
		end
	})
	
	EternalSection:AddToggle({
		Name = "Auto Log",
		Flag = "AutoEternalLog",
		Callback = function(v)
			_G.EternalAutoLog = v
		end
	})
	
	EternalSection:AddToggle({
		Name = "Anchor",
		Flag = "AnchorOnEternal",
		Callback = function(v)
			_G.AnchorOnEternal = v
		end
	})
	
	EternalSection:AddToggle({
		Name = "No Death Sound",
		Flag = "NoDeathSound",
		Callback = function(v)
			_G.DisableDeathSound = v
		end
	})
	
	EternalSection:AddToggle({
		Name = "TP To lobby",
		Flag = "TPToLobby",
		Callback = function(v)
			_G.TeleportToLobby = v
		end
	})
	
	EternalSection:AddToggle({
		Name = "Play Meme Music",
		Flag = "PlayMemeMusic",
		Callback = function(v)
			_G.PlayMemeMusic = v
		end
	})
end
