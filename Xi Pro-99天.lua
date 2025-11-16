local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/123fa98/Xi_Pro/refs/heads/main/Windui"))()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local killAuraxipro = false
local chopAuraxipro = false
local auraXXXIIIIPPPRRROOO = 50
local XXXIIIIPPPRRROOO = 0

local toolsDamageIDs = {
    ["Old Axe"] = "3_7367831688",
    ["Good Axe"] = "112_7367831688",
    ["Strong Axe"] = "116_7367831688",
    ["Chainsaw"] = "647_8992824875",
    ["Spear"] = "196_8999010016"
}

local autoFeedxipro = false
local ShenChouFood = "Carrot"
local hungerThreshold = 75
local alwaysFeedXXIIPPRROOItems = {}
local alimentos = {
    "Apple",
    "Berry",
    "Carrot",
    "Cake",
    "Chili",
    "Cooked Morsel",
    "Cooked Steak"
}

local ie = {
    "Bandage", "Bolt", "Broken Fan", "Broken Microwave", "Cake", "Carrot", "Chair", "Coal", "Coin Stack",
    "Cooked Morsel", "Cooked Steak", "Fuel Canister", "Iron Body", "Leather Armor", "Log", "MadKit", "Metal Chair",
    "MedKit", "Old Car Engine", "Old Flashlight", "Old Radio", "Revolver", "Revolver Ammo", "Rifle", "Rifle Ammo",
    "Morsel", "Sheet Metal", "Steak", "Tyre", "Washing Machine"
}
local me = {"Bunny", "Wolf", "Alpha Wolf", "Bear", "Cultist", "Crossbow Cultist", "Alien"}

local junkItems = {"Tyre", "Bolt", "Broken Fan", "Broken Microwave", "Sheet Metal", "Old Radio", "Washing Machine", "Old Car Engine"}
local ShenChouJunkItems = {}
local fuelItems = {"Log", "Chair", "Coal", "Fuel Canister", "Oil Barrel"}
local ShenChouFuelItems = {}
local foodItems = {"Cake", "Cooked Steak", "Cooked Morsel", "Steak", "Morsel", "Berry", "Carrot"}
local ShenChouFoodItems = {}
local medicalItems = {"Bandage", "MedKit"}
local ShenChouMedicalItems = {}
local equipmentItems = {"Revolver", "Rifle", "Leather Body", "Iron Body", "Revolver Ammo", "Rifle Ammo", "Giant Sack", "Good Sack", "Strong Axe", "Good Axe"}
local ShenChouEquipmentItems = {}

local campfireFuelItems = {"Log", "Coal", "Fuel Canister", "Oil Barrel", "Biofuel"}
local campfireDropPos = Vector3.new(0, 19, 0)

local autocookItems = {"Morsel", "Steak"}
local autoCookxiproItems = {}
local autoCookxipro = false

local function getAnyToolWithDamageID(isChopAura)
    for toolName, damageID in pairs(toolsDamageIDs) do
        if isChopAura and toolName ~= "Old Axe" and toolName ~= "Good Axe" and toolName ~= "Strong Axe" then
            continue
        end
        local tool = LocalPlayer:FindFirstChild("Inventory") and LocalPlayer.Inventory:FindFirstChild(toolName)
        if tool then
            return tool, damageID
        end
    end
    return nil, nil
end

local function equipTool(tool)
    if tool then
        ReplicatedStorage:WaitForChild("RemoteEvents").EquipItemHandle:FireServer("FireAllClients", tool)
    end
end

local function unequipTool(tool)
    if tool then
        ReplicatedStorage:WaitForChild("RemoteEvents").UnequipItemHandle:FireServer("FireAllClients", tool)
    end
end

local function killAuraXXXXXXIIIIIIPPPPPRRRRROOOOO()
    while killAuraxipro do
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local tool, damageID = getAnyToolWithDamageID(false)
            if tool and damageID then
                equipTool(tool)
                for _, mob in ipairs(Workspace.Characters:GetChildren()) do
                    if mob:IsA("Model") then
                        local part = mob:FindFirstChildWhichIsA("BasePart")
                        if part and (part.Position - hrp.Position).Magnitude <= auraXXXIIIIPPPRRROOO then
                            pcall(function()
                                ReplicatedStorage:WaitForChild("RemoteEvents").ToolDamageObject:InvokeServer(
                                    mob,
                                    tool,
                                    damageID,
                                    CFrame.new(part.Position)
                                )
                            end)
                        end
                    end
                end
                task.wait(0.1)
            else
                task.wait(1)
            end
        else
            task.wait(0.5)
        end
    end
end

local function chopAuraxipro()
    while chopAuraxipro do
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local tool, baseDamageID = getAnyToolWithDamageID(true)
            if tool and baseDamageID then
                equipTool(tool)
                XXXIIIIPPPRRROOO = XXXIIIIPPPRRROOO + 1
                local trees = {}
                local map = Workspace:FindFirstChild("Map")
                if map then
                    if map:FindFirstChild("Foliage") then
                        for _, obj in ipairs(map.Foliage:GetChildren()) do
                            if obj:IsA("Model") and obj.Name == "Small Tree" then
                                table.insert(trees, obj)
                            end
                        end
                    end
                    if map:FindFirstChild("Landmarks") then
                        for _, obj in ipairs(map.Landmarks:GetChildren()) do
                            if obj:IsA("Model") and obj.Name == "Small Tree" then
                                table.insert(trees, obj)
                            end
                        end
                    end
                end
                for _, tree in ipairs(trees) do
                    local trunk = tree:FindFirstChild("Trunk")
                    if trunk and trunk:IsA("BasePart") and (trunk.Position - hrp.Position).Magnitude <= auraXXXIIIIPPPRRROOO then
                        local alreadyammount = false
                        task.spawn(function()
                            while chopAuraxipro and tree and tree.Parent and not alreadyammount do
                                alreadyammount = true
                                XXXIIIIPPPRRROOO = XXXIIIIPPPRRROOO + 1
                                pcall(function()
                                    ReplicatedStorage:WaitForChild("RemoteEvents").ToolDamageObject:InvokeServer(
                                        tree,
                                        tool,
                                        tostring(XXXIIIIPPPRRROOO) .. "_7367831688",
                                        CFrame.new(-2.962610244751, 4.5547881126404, -75.950843811035, 0.89621275663376, -1.3894891459643e-08, 0.44362446665764, -7.994568895775e-10, 1, 3.293635941759e-08, -0.44362446665764, -2.9872644802253e-08, 0.89621275663376)
                                    )
                                end)
                                task.wait(0.5)
                            end
                        end)
                    end
                end
                task.wait(0.1)
            else
                task.wait(1)
            end
        else
            task.wait(0.5)
        end
    end
end

function wiki(nome)
    local c = 0
    for _, i in ipairs(Workspace.Items:GetChildren()) do
        if i.Name == nome then
            c = c + 1
        end
    end
    return c
end

function ghn()
    return math.floor(LocalPlayer.PlayerGui.Interface.StatBars.HungerBar.Bar.Size.X.Scale * 100)
end

function feed(nome)
    for _, item in ipairs(Workspace.Items:GetChildren()) do
        if item.Name == nome then
            ReplicatedStorage.RemoteEvents.RequestConsumeItem:InvokeServer(item)
            break
        end
    end
end

function notifeed(nome)
    WindUI:Notify({
        Title = "自动食物停止",
        Content = "食物没了",
        Duration = 3
    })
end

local function moveItemToPos(item, position)
    if not item or not item:IsDescendantOf(workspace) or not item:IsA("BasePart") and not item:IsA("Model") then return end
    local part = item:IsA("Model") and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart") or item:FindFirstChild("Handle")) or item
    if not part or not part:IsA("BasePart") then return end

    if item:IsA("Model") and not item.PrimaryPart then
        pcall(function() item.PrimaryPart = part end)
    end

    pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents").RequestStartDraggingItem:FireServer(item)
        if item:IsA("Model") then
            item:SetPrimaryPartCFrame(CFrame.new(position))
        else
            part.CFrame = CFrame.new(position)
        end
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents").StopDraggingItem:FireServer(item)
    end)
end

local function getChests()
    local chests = {}
    local chestNames = {}
    local index = 1
    for _, item in ipairs(workspace:WaitForChild("Items"):GetChildren()) do
        if item.Name:match("^Item Chest") and not item:GetAttribute("8721081708Opened") then
            table.insert(chests, item)
            table.insert(chestNames, "Chest " .. index)
            index = index + 1
        end
    end
    return chests, chestNames
end

local currentChests, currentChestNames = getChests()
local ShenChouChest = currentChestNames[1] or nil

local function getMobs()
    local mobs = {}
    local mobNames = {}
    local index = 1
    for _, character in ipairs(workspace:WaitForChild("Characters"):GetChildren()) do
        if character.Name:match("^Lost Child") and character:GetAttribute("Lost") == true then
            table.insert(mobs, character)
            table.insert(mobNames, character.Name)
            index = index + 1
        end
    end
    return mobs, mobNames
end

local currentMobs, currentMobNames = getMobs()
local ShenChouMob = currentMobNames[1] or nil

function tp1()
	(game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame =
CFrame.new(0.43132782, 15.77634621, -1.88620758, -0.270917892, 0.102997094, 0.957076371, 0.639657021, 0.762253821, 0.0990355015, -0.719334781, 0.639031112, -0.272391081)
end

local function tp2()
    local targetPart = workspace:FindFirstChild("Map")
        and workspace.Map:FindFirstChild("Landmarks")
        and workspace.Map.Landmarks:FindFirstChild("Stronghold")
        and workspace.Map.Landmarks.Stronghold:FindFirstChild("Functional")
        and workspace.Map.Landmarks.Stronghold.Functional:FindFirstChild("EntryDoors")
        and workspace.Map.Landmarks.Stronghold.Functional.EntryDoors:FindFirstChild("DoorRight")
        and workspace.Map.Landmarks.Stronghold.Functional.EntryDoors.DoorRight:FindFirstChild("Model")
    if targetPart then
        local children = targetPart:GetChildren()
        local destination = children[5]
        if destination and destination:IsA("BasePart") then
            local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = destination.CFrame + Vector3.new(0, 5, 0)
            end
        end
    end
end

local flyToggle = false
local flySpeed = 1
local FLYING = false
local flyKeyDown, flyKeyUp, mfly1, mfly2
local IYMouse = game:GetService("UserInputService")

local function sFLY()
    repeat task.wait() until Players.LocalPlayer and Players.LocalPlayer.Character and Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    repeat task.wait() until IYMouse
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect(); flyKeyUp:Disconnect() end

    local T = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = flySpeed

    local function FLY()
        FLYING = true
        local BG = Instance.new('BodyGyro')
        local BV = Instance.new('BodyVelocity')
        BG.P = 9e4
        BG.Parent = T
        BV.Parent = T
        BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.CFrame = T.CFrame
        BV.Velocity = Vector3.new(0, 0, 0)
        BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        task.spawn(function()
            while FLYING do
                task.wait()
                if not flyToggle and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                    Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                end
                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                    SPEED = flySpeed
                elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                    SPEED = 0
                end
                if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                    BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                    lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                    BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                else
                    BV.Velocity = Vector3.new(0, 0, 0)
                end
                BG.CFrame = workspace.CurrentCamera.CoordinateFrame
            end
            CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            SPEED = 0
            BG:Destroy()
            BV:Destroy()
            if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
            end
        end)
    end
    flyKeyDown = IYMouse.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local KEY = input.KeyCode.Name
            if KEY == "W" then
                CONTROL.F = flySpeed
            elseif KEY == "S" then
                CONTROL.B = -flySpeed
            elseif KEY == "A" then
                CONTROL.L = -flySpeed
            elseif KEY == "D" then 
                CONTROL.R = flySpeed
            elseif KEY == "E" then
                CONTROL.Q = flySpeed * 2
            elseif KEY == "Q" then
                CONTROL.E = -flySpeed * 2
            end
            pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
        end
    end)
    flyKeyUp = IYMouse.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local KEY = input.KeyCode.Name
            if KEY == "W" then
                CONTROL.F = 0
            elseif KEY == "S" then
                CONTROL.B = 0
            elseif KEY == "A" then
                CONTROL.L = 0
            elseif KEY == "D" then
                CONTROL.R = 0
            elseif KEY == "E" then
                CONTROL.Q = 0
            elseif KEY == "Q" then
                CONTROL.E = 0
            end
        end
    end)
    FLY()
end

local function NOFLY()
    FLYING = false
    if flyKeyDown then flyKeyDown:Disconnect() end
    if flyKeyUp then flyKeyUp:Disconnect() end
    if mfly1 then mfly1:Disconnect() end
    if mfly2 then mfly2:Disconnect() end
    if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
        Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
    end
    pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

local function UnMobileFly()
    pcall(function()
        FLYING = false
        local root = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        if root:FindFirstChild("BodyVelocity") then root:FindFirstChild("BodyVelocity"):Destroy() end
        if root:FindFirstChild("BodyGyro") then root:FindFirstChild("BodyGyro"):Destroy() end
        if Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
            Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false
        end
        if mfly1 then mfly1:Disconnect() end
        if mfly2 then mfly2:Disconnect() end
    end)
end

local function MobileFly()
    UnMobileFly()
    FLYING = true

    local root = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local camera = workspace.CurrentCamera
    local v3none = Vector3.new()
    local v3zero = Vector3.new(0, 0, 0)
    local v3inf = Vector3.new(9e9, 9e9, 9e9)

    local controlModule = require(Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
    local bv = Instance.new("BodyVelocity")
    bv.Name = "BodyVelocity"
    bv.Parent = root
    bv.MaxForce = v3zero
    bv.Velocity = v3zero

    local bg = Instance.new("BodyGyro")
    bg.Name = "BodyGyro"
    bg.Parent = root
    bg.MaxTorque = v3inf
    bg.P = 1000
    bg.D = 50

    mfly1 = Players.LocalPlayer.CharacterAdded:Connect(function()
        local newRoot = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local newBv = Instance.new("BodyVelocity")
        newBv.Name = "BodyVelocity"
        newBv.Parent = newRoot
        newBv.MaxForce = v3zero
        newBv.Velocity = v3zero

        local newBg = Instance.new("BodyGyro")
        newBg.Name = "BodyGyro"
        newBg.Parent = newRoot
        newBg.MaxTorque = v3inf
        newBg.P = 1000
        newBg.D = 50
    end)

    mfly2 = game:GetService("RunService").RenderStepped:Connect(function()
        root = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        camera = workspace.CurrentCamera
        if Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and root and root:FindFirstChild("BodyVelocity") and root:FindFirstChild("BodyGyro") then
            local humanoid = Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            local VelocityHandler = root:FindFirstChild("BodyVelocity")
            local GyroHandler = root:FindFirstChild("BodyGyro")

            VelocityHandler.MaxForce = v3inf
            GyroHandler.MaxTorque = v3inf
            humanoid.PlatformStand = true
            GyroHandler.CFrame = camera.CoordinateFrame
            VelocityHandler.Velocity = v3none

            local direction = controlModule:GetMoveVector()
            if direction.X > 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * (flySpeed * 50))
            end
            if direction.X < 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * (flySpeed * 50))
            end
            if direction.Z > 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * (flySpeed * 50))
            end
            if direction.Z < 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * (flySpeed * 50))
            end
        end
    end)
end

local Window = 
WindUI:CreateWindow({
    Title =
     "99 Night in Forest | Xi pro",
    Icon =
     "door-open",
    IconThemed =
     true,
    Author = 
    "神仇",
    Folder =
     "神仇",
    Size = 
    UDim2.fromOffset(500, 350),
    Transparent =
     true,
    Theme =
     "Dark",
    SideBarWidth = 
    200,
    ScrollBarEnabled =
     true,
})

Window:EditOpenButton({
    Title =
     "打开Xi pro",
    Icon =
     "monitor",
    CornerRadius = 
    UDim.new(0, 6),
    StrokeThickness =
     2,
    Color =
     ColorSequence.new(Color3.fromRGB(30, 30, 30), Color3.fromRGB(255, 255, 255)),
    Draggable =
     true,
})

local Tabs = {}

Tabs.Combat = Window:Tab({
    Title = "光环功能",
    Icon = "sword",
    Desc = "Stellar"
})
Tabs.Main = Window:Tab({
    Title = "主要功能",
    Icon = "sparkles",
    Desc = "Xi pro"
})
Tabs.Auto = Window:Tab({
    Title = "自动功能",
    Icon = "wrench",
    Desc = "Xi pro"
})

Tabs.Bring = Window:Tab({
    Title = "复制物品",
    Icon = "package",
    Desc = "Xi pro"
})

Tabs.esp = Window:Tab({
    Title = "透视功能",
    Icon = "eye",
    Desc = "Xi pro"
})
Tabs.br = Window:Tab({
    Title = "收集功能",
    Icon = "package",
    Desc = "Stellar"
})
Tabs.Tp = Window:Tab({
    Title = "传送功能",
    Icon = "map",
    Desc = "Xi pro"
})
Tabs.Fly = Window:Tab({
    Title = "玩家修改",
    Icon = "user",
    Desc = "Xi pro"
})



Window:SelectTab(1)

Tabs.Combat:Section({ Title = "光环", Icon = "star" })
local killScriptxipro = false
local killScriptxiproxipro = nil

local function StartKillScript()
    if killScriptxipro then return end
    
    killScriptxipro = true
    local characters = workspace.Characters
    local XXXIIIIPPPRRROOO = 0

    local function DamageTarget(target)
        local Event = ReplicatedStorage.RemoteEvents.ToolDamageObject
        Event:InvokeServer(
            target,
            LocalPlayer.Inventory["Old Axe"],
            tostring(XXXIIIIPPPRRROOO) .. "_7367831688",
            CFrame.new(-2.962610244751, 4.5547881126404, -75.950843811035, 0.89621275663376, -1.3894891459643e-08, 0.44362446665764, -7.994568895775e-10, 1, 3.293635941759e-08, -0.44362446665764, -2.9872644802253e-08, 0.89621275663376)
        )
    end

    killScriptxiproxipro = task.spawn(function()
        while killScriptxipro do
            task.wait()
            XXXIIIIPPPRRROOO += 1
            for i,v in pairs(characters:GetChildren()) do
                local alreadyammount = false
                task.spawn(function()
                    while v and killScriptxipro do
                        if alreadyammount == false then
                            alreadyammount = true
                            XXXIIIIPPPRRROOO += 1
                        end
                        coroutine.wrap(DamageTarget)(v)
                        task.wait(0.01)
                    end
                end)
            end
        end
    end)
end

local function StopKillxipro()
    killScriptxipro = false
    if killScriptxiproxipro then
        task.cancel(killScriptxiproxipro)
        killScriptxiproxipro = nil
    end
end
Tabs.Combat:Toggle({
Title = "开启全部杀戮",
Desc = "装备斧头再执行,不然给你卡爆炸,别和杀戮光环或者砍树光环一起用",
Icon = "check",
    Value = false,
    Callback = function(state) 
        if state then
            StartKillScript()
            WindUI:Notify({
                Title = "一键杀戮",
                Content = "已启用全部杀戮",
                Icon = "alert-triangle",
                Duration = 3,
            })
        else
            StopKillxipro()
            WindUI:Notify({
                Title = "一键杀戮",
                Content = "已关闭全部杀戮",
                Icon = "check-circle",
                Duration = 3,
            })
        end
    end
})
Tabs.Combat:Toggle({
    Title = "杀戮光环",
    Value = false,
    Callback = function(state)
        killAuraxipro = state
        if state then
            task.spawn(killAuraXXXXXXIIIIIIPPPPPRRRRROOOOO)
        else
            local tool, _ = getAnyToolWithDamageID(false)
            unequipTool(tool)
        end
    end
})

Tabs.Combat:Toggle({
    Title = "砍树光环",
    Value = false,
    Callback = function(state)
        chopAuraxipro = state
        if state then
            task.spawn(chopAuraxipro)
        else
            local tool, _ = getAnyToolWithDamageID(true)
            unequipTool(tool)
        end
    end
})

Tabs.Combat:Section({ Title = "设置", Icon = "settings" })

Tabs.Combat:Slider({
    Title = "光环范围",
    Value = { Min = 50, Max = 500, Default = 50 },
    Callback = function(value)
        auraXXXIIIIPPPRRROOO = math.clamp(value, 10, 500)
    end
})

Tabs.Main:Section({ Title = "自动吃食物", Icon = "utensils" })
Tabs.Main:Dropdown({
    Title = "选择食物",
    Desc = "自己选择",
    Values = alimentos,
    Value = ShenChouFood,
    Multi = false,
    Callback = function(value)
        ShenChouFood = value
    end
})

Tabs.Main:Input({
    Title = "进食%",
    Desc = "当饥饿达到多少%时进食",
    Value = tostring(hungerThreshold),
    Placeholder = "Ex: 75",
    Numeric = true,
    Callback = function(value)
        local n = tonumber(value)
        if n then
            hungerThreshold = math.clamp(n, 0, 100)
        end
    end
})

Tabs.Main:Toggle({
    Title = "自动进食",
    Value = false,
    Callback = function(state)
        autoFeedxipro = state
        if state then
            task.spawn(function()
                while autoFeedxipro do
                    task.wait(0.075)
                    if wiki(ShenChouFood) == 0 then
                        autoFeedxipro = false
                        Tabs.Combat:Find("Auto Feed"):SetValue(false)
                        notifeed(ShenChouFood)
                        break
                    end
                    if ghn() <= hungerThreshold then
                        feed(ShenChouFood)
                    end
                end
            end)
        end
    end
})

Tabs.Auto:Section({ Title = "营火", Icon = "flame" })

local autoUpgradeCampfireXIPRO = false

Tabs.Auto:Dropdown({
    Title = "升级营火",
    Desc = "选择要使用的物品",
    Values = campfireFuelItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        for _, itemName in ipairs(campfireFuelItems) do
            alwaysFeedXXIIPPRROOItems[itemName] = table.find(options, itemName) ~= nil
        end
    end
})

Tabs.Auto:Toggle({
    Title = "自动升级营火",
    Value = false,
    Callback = function(checked)
        autoUpgradeCampfireXIPRO = checked
        if checked then
            task.spawn(function()
                while autoUpgradeCampfireXIPRO do
                    for itemName, enabled in pairs(alwaysFeedXXIIPPRROOItems) do
                        if enabled then
                            for _, item in ipairs(workspace:WaitForChild("Items"):GetChildren()) do
                                if item.Name == itemName then
                                    moveItemToPos(item, campfireDropPos)
                                end
                            end
                        end
                    end
                    task.wait(2)
                end
            end)
        end
    end
})

Tabs.Auto:Section({ Title = "烹饪食物", Icon = "flame" })

Tabs.Auto:Dropdown({
    Title = "选择需要烹饪的食物",
    Values = autocookItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        for _, itemName in ipairs(autocookItems) do
            autoCookxiproItems[itemName] = table.find(options, itemName) ~= nil
        end
    end
})

Tabs.Auto:Toggle({
    Title = "自动烹饪食物",
    Value = false,
    Callback = function(state)
        autoCookxipro = state
    end
})

coroutine.wrap(function()
    while true do
        if autoCookxipro then
            for itemName, enabled in pairs(autoCookxiproItems) do
                if enabled then
                    for _, item in ipairs(Workspace:WaitForChild("Items"):GetChildren()) do
                        if item.Name == itemName then
                            moveItemToPos(item, campfireDropPos)
                        end
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)()

Tabs.Tp:Section({ Title = "传送", Icon = "map" })

Tabs.Tp:Button({
    Title = "传送到营火",
    Locked = false,
    Callback = function()
        tp1()
    end
})

Tabs.Tp:Button({
    Title = "传送到要塞",
    Locked = false,
    Callback = function()
        tp2()
    end
})


Tabs.Tp:Section({ Title = "孩子", Icon = "eye" })

local MobDropdown = Tabs.Tp:Dropdown({
    Title = "孩子",
    Values = currentMobNames,
    Multi = false,
    AllowNone = true,
    Callback = function(options)
        ShenChouMob = options[#options] or currentMobNames[1] or nil
    end
})

Tabs.Tp:Button({
    Title = "刷新列表",
    Locked = false,
    Callback = function()
        currentMobs, currentMobNames = getMobs()
        if #currentMobNames > 0 then
            ShenChouMob = currentMobNames[1]
            MobDropdown:Refresh(currentMobNames)
        else
            ShenChouMob = nil
            MobDropdown:Refresh({ "没有孩子选择" })
        end
    end
})

Tabs.Tp:Button({
    Title = "传送孩子",
    Locked = false,
    Callback = function()
        if ShenChouMob and currentMobs then
            for i, name in ipairs(currentMobNames) do
                if name == ShenChouMob then
                    local targetMob = currentMobs[i]
                    if targetMob then
                        local part = targetMob.PrimaryPart or targetMob:FindFirstChildWhichIsA("BasePart")
                        if part and game.Players.LocalPlayer.Character then
                            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                hrp.CFrame = part.CFrame + Vector3.new(0, 5, 0)
                            end
                        end
                    end
                    break
                end
            end
        end
    end
})


Tabs.Tp:Section({ Title = "宝箱", Icon = "box" })

local ChestDropdown = Tabs.Tp:Dropdown({
    Title = "选择宝箱",
    Values = currentChestNames,
    Multi = false,
    AllowNone = true,
    Callback = function(options)
        ShenChouChest = options[#options] or currentChestNames[1] or nil
    end
})

Tabs.Tp:Button({
    Title = "刷新列表",
    Locked = false,
    Callback = function()
        currentChests, currentChestNames = getChests()
        if #currentChestNames > 0 then
            ShenChouChest = currentChestNames[1]
            ChestDropdown:Refresh(currentChestNames)
        else
            ShenChouChest = nil
            ChestDropdown:Refresh({ "没有宝箱选择" })
        end
    end
})

Tabs.Tp:Button({
    Title = "传送到宝箱",
    Locked = false,
    Callback = function()
        if ShenChouChest and currentChests then
            local chestIndex = 1
            for i, name in ipairs(currentChestNames) do
                if name == ShenChouChest then
                    chestIndex = i
                    break
                end
            end
            local targetChest = currentChests[chestIndex]
            if targetChest then
                local part = targetChest.PrimaryPart or targetChest:FindFirstChildWhichIsA("BasePart")
                if part and game.Players.LocalPlayer.Character then
                    local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = part.CFrame + Vector3.new(0, 5, 0)
                    end
                end
            end
        end
    end
})

Tabs.br:Section({ Title = "选择物品(全面)", Icon = "box" })
Tabs.br:Button({
    Title = "收集所有物品",
    Callback = function()
        for _, item in ipairs(workspace.Items:GetChildren()) do
            local part = item:FindFirstChildWhichIsA("BasePart") or (item:IsA("BasePart") and item)
            if part then
                part.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            end
        end
    end
})
Tabs.br:Section({ Title = "选择物品(可能不全面)", Icon = "box" })
Tabs.br:Button({
    Title = "收集木头",
    Callback = function()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local count = 0
        for _, item in pairs(workspace.Items:GetChildren()) do
            if item.Name:lower():find("log") and item:IsA("Model") then
                local main = item:FindFirstChildWhichIsA("BasePart")
                if main then
                    main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                    count += 1
                end
            end
        end
        WindUI:Notify({
            Title = "收集完成",
            Content = "已收集 " .. count .. " 个木头",
            Icon = "check-circle",
            Duration = 3,
        })
    end
})

Tabs.br:Button({
    Title = "收集煤炭",
    Callback = function()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local count = 0
        for _, item in pairs(workspace.Items:GetChildren()) do
            if item.Name:lower():find("coal") and item:IsA("Model") then
                local main = item:FindFirstChildWhichIsA("BasePart")
                if main then
                    main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                    count += 1
                end
            end
        end
        WindUI:Notify({
            Title = "收集完成",
            Content = "已收集 " .. count .. " 个煤炭",
            Icon = "check-circle",
            Duration = 3,
        })
    end
})

Tabs.br:Button({
    Title = "收集肉(生/熟)",
    Callback = function()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local count = 0
        for _, item in pairs(workspace.Items:GetChildren()) do
            local name = item.Name:lower()
            if (name:find("meat") or name:find("cooked")) and item:IsA("Model") then
                local main = item:FindFirstChildWhichIsA("BasePart")
                if main then
                    main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                    count += 1
                end
            end
        end
        WindUI:Notify({
            Title = "收集完成",
            Content = "已收集 " .. count .. " 个肉制品",
            Icon = "check-circle",
            Duration = 3,
        })
    end
})

Tabs.br:Button({
    Title = "收集手电筒",
    Callback = function() bringItemsByName("Flashlight") end
})

Tabs.br:Button({
    Title = "收集钉子",
    Callback = function() bringItemsByName("Nails") end
})

Tabs.br:Button({
    Title = "收集风扇",
    Callback = function() bringItemsByName("Fan") end
})

Tabs.br:Button({
    Title = "收集弹药",
    Callback = function()
        local keywords = {"ammo"}
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then return end

        for _, item in ipairs(workspace.Items:GetChildren()) do
            for _, word in ipairs(keywords) do
                if item.Name:lower():find(word) then
                    local part = item:FindFirstChildWhichIsA("BasePart") or (item:IsA("BasePart") and item)
                    if part then
                        part.CFrame = root.CFrame + Vector3.new(math.random(-5,5), 0, math.random(-5,5))
                    end
                end
            end
        end
    end
})

Tabs.br:Button({
    Title = "收集金属板",
    Callback = function() bringItemsByName("Sheet Metal") end
})

Tabs.br:Button({
    Title = "收集燃料罐",
    Callback = function() bringItemsByName("Fuel Canister") end
})

Tabs.br:Button({
    Title = "收集轮胎",
    Callback = function() bringItemsByName("Tyre") end
})

Tabs.br:Button({
    Title = "收集绷带",
    Callback = function() bringItemsByName("Bandage") end
})

Tabs.br:Button({
    Title = "收集左轮手枪",
    Callback = function() bringItemsByName("Revolver") end
})

Tabs.br:Button({
    Title = "收集迷路儿童",
    Callback = function()
        for _, model in ipairs(workspace:GetDescendants()) do
            if model:IsA("Model") and model.Name:lower():find("lost") and model:FindFirstChild("HumanoidRootPart") then
                model:PivotTo(LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0))
            end
        end
    end
})

Tabs.br:Dropdown({
    Title = "选择",
    Desc = "选择需要收集的物品",
    Values = junkItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouJunkItems = options
    end
})

Tabs.br:Button({
    Title = "收集物品",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        local hrp = player.Character.HumanoidRootPart
        local targetPos = hrp.Position + Vector3.new(2, 0, 0)
        for _, itemName in ipairs(ShenChouJunkItems) do
            for _, item in ipairs(workspace:GetDescendants()) do
                if item.Name == itemName and (item:IsA("BasePart") or item:IsA("Model")) and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")) then
                    moveItemToPos(item, targetPos)
                end
            end
        end
    end
})

Tabs.br:Section({ Title = "燃料", Icon = "flame" })

local fuelItems = {"Log", "Chair", "Coal", "Fuel Canister", "Oil Barrel"}
local ShenChouFuelItems = {}

Tabs.br:Dropdown({
    Title = "选择燃料物品",
    Desc = "选择要收集的物品",
    Values = fuelItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouFuelItems = options
    end
})

Tabs.br:Button({
    Title = "Bring Fuel Items",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        local hrp = player.Character.HumanoidRootPart
        local targetPos = hrp.Position + Vector3.new(2, 0, 0)
        local broughtItems = 0
        for _, itemName in ipairs(ShenChouFuelItems) do
            for _, item in ipairs(workspace:GetDescendants()) do
                if item.Name == itemName and (item:IsA("BasePart") or item:IsA("Model")) then
                    moveItemToPos(item, targetPos)
                    broughtItems = broughtItems + 1
                end
            end
        end
    end
})

Tabs.br:Section({ Title = "食物", Icon = "utensils" })

local foodItems = {"Cake", "Cooked Steak", "Cooked Morsel", "Steak", "Morsel", "Berry", "Carrot"}
local ShenChouFoodItems = {}

Tabs.br:Dropdown({
    Title = "选择食物物品",
    Desc = "选择要收集的物品",
    Values = foodItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouFoodItems = options
    end
})

Tabs.br:Button({
    Title = "收集食物物品",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        local hrp = player.Character.HumanoidRootPart
        local targetPos = hrp.Position + Vector3.new(2, 0, 0)
        for _, itemName in ipairs(ShenChouFoodItems) do
            for _, item in ipairs(workspace:GetDescendants()) do
                if item.Name == itemName and (item:IsA("BasePart") or item:IsA("Model")) and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")) then
                    moveItemToPos(item, targetPos)
                end
            end
        end
    end
})

Tabs.br:Section({ Title = "医疗", Icon = "bandage" })

Tabs.br:Dropdown({
    Title = "选择医疗物品",
    Desc = "选择需要收集的物品",
    Values = medicalItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouMedicalItems = options
    end
})

Tabs.br:Button({
    Title = "点击收集",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        local hrp = player.Character.HumanoidRootPart
        local targetPos = hrp.Position + Vector3.new(2, 0, 0)
        for _, itemName in ipairs(ShenChouMedicalItems) do
            for _, item in ipairs(workspace:GetDescendants()) do
                if item.Name == itemName and (item:IsA("BasePart") or item:IsA("Model")) and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")) then
                    moveItemToPos(item, targetPos)
                end
            end
        end
    end
})

Tabs.br:Section({ Title = "Equipment", Icon = "sword" })

local equipmentItems = {"Revolver", "Rifle", "Leather Body", "Iron Body", "Revolver Ammo", "Rifle Ammo", "Giant Sack", "Good Sack", "Strong Axe", "Good Axe"}
local ShenChouEquipmentItems = {}

Tabs.br:Dropdown({
    Title = "选择要装备的物品",
    Desc = "选择需要收集的物品",
    Values = equipmentItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouEquipmentItems = options
    end
})

Tabs.br:Button({
    Title = "点击收集",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        local hrp = player.Character.HumanoidRootPart
        local targetPos = hrp.Position + Vector3.new(2, 0, 0)
        for _, itemName in ipairs(ShenChouEquipmentItems) do
            for _, item in ipairs(workspace:GetDescendants()) do
                if item.Name == itemName and (item:IsA("BasePart") or item:IsA("Model")) and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")) then
                    moveItemToPos(item, targetPos)
                end
            end
        end
    end
})

Tabs.Fly:Section({ Title = "主要", Icon = "eye" })

Tabs.Fly:Slider({
    Title = "飞行速度",
    Value = { Min = 1, Max = 20, Default = 1 },
    Callback = function(value)
        flySpeed = value
        if FLYING then
            task.spawn(function()
                while FLYING do
                    task.wait(0.1)
                    if game:GetService("UserInputService").TouchEnabled then
                        local root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if root and root:FindFirstChild("BodyVelocity") then
                            local bv = root:FindFirstChild("BodyVelocity")
                            bv.Velocity = bv.Velocity.Unit * (flySpeed * 50)
                        end
                    end
                end
            end)
        end
    end
})

Tabs.Fly:Toggle({
    Title = "飞行",
    Value = false,
    Callback = function(state)
        flyToggle = state
        if flyToggle then
            if game:GetService("UserInputService").TouchEnabled then
                MobileFly()
            else
                sFLY()
            end
        else
            NOFLY()
            UnMobileFly()
        end
    end
})

local Players = game:GetService("Players")
local speed = 16

local function setSpeed(val)
    local humanoid = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then humanoid.WalkSpeed = val end
end


Tabs.Fly:Slider({
    Title = "加速速度",
    Value = { Min = 16, Max = 150, Default = 16 },
    Callback = function(value)
        speed = value
    end
})

Tabs.Fly:Toggle({
    Title = "加速",
    Value = false,
    Callback = function(state)
        setSpeed(state and speed or 16)
    end
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local noclipConnection

Tabs.Fly:Toggle({
    Title = "穿墙",
    Value = false,
    Callback = function(state)
        if state then
            noclipConnection = RunService.Stepped:Connect(function()
                local char = Players.LocalPlayer.Character
                if char then
                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
        end
    end
})

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local infJumpConnection

Tabs.Fly:Toggle({
    Title = "无限跳",
    Value = false,
    Callback = function(state)
        if state then
            infJumpConnection = UserInputService.JumpRequest:Connect(function()
                local char = Players.LocalPlayer.Character
                local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            if infJumpConnection then
                infJumpConnection:Disconnect()
                infJumpConnection = nil
            end
        end
    end
})

Tabs.Bring:Button({Title="复制全部",Callback=function()
    for _, item in ipairs(workspace.Items:GetChildren()) do
        local part = item:FindFirstChildWhichIsA("BasePart") or item:IsA("BasePart") and item
        if part then
            part.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(math.random(-44,44), 0, math.random(-44,44))
        end
    end
end})

Tabs.Bring:Button({Title="带回失踪的孩子 1", Callback=function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    for _, item in pairs(workspace.Characters:GetChildren()) do
        if item.Name:lower():find("lost child") and item:IsA("Model") then
            local main = item:FindFirstChildWhichIsA("BasePart")
            if main then
                main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
            end
        end
    end
end})

Tabs.Bring:Button({Title="带回失踪的孩子 2", Callback=function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    for _, item in pairs(workspace.Characters:GetChildren()) do
        if item.Name:lower():find("lost child2") and item:IsA("Model") then
            local main = item:FindFirstChildWhichIsA("BasePart")
            if main then
                main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
            end
        end
    end
end})

Tabs.Bring:Button({Title="带回失踪的孩子 3", Callback=function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    for _, item in pairs(workspace.Characters:GetChildren()) do
        if item.Name:lower():find("lost child3") and item:IsA("Model") then
            local main = item:FindFirstChildWhichIsA("BasePart")
            if main then
                main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
            end
        end
    end
end})

Tabs.Bring:Button({Title="带回失踪的孩子 4", Callback=function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    for _, item in pairs(workspace.Characters:GetChildren()) do
        if item.Name:lower():find("lost child4") and item:IsA("Model") then
            local main = item:FindFirstChildWhichIsA("BasePart")
            if main then
                main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
            end
        end
    end
end})

Tabs.Bring:Button({Title="复制日志", Callback=function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    for _, item in pairs(workspace.Items:GetChildren()) do
        if item.Name:lower():find("log") and item:IsA("Model") then
            local main = item:FindFirstChildWhichIsA("BasePart")
            if main then
                main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
            end
        end
    end
end})

Tabs.Bring:Button({Title="复制燃料罐", Callback=function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    for _, item in pairs(workspace.Items:GetChildren()) do
        if item.Name:lower():find("fuel canister") and item:IsA("Model") then
            local main = item:FindFirstChildWhichIsA("BasePart")
            if main then
                main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
            end
        end
    end
end})

Tabs.Bring:Button({Title="复制油桶", Callback=function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    for _, item in pairs(workspace.Items:GetChildren()) do
        if item.Name:lower():find("oil barrel") and item:IsA("Model") then
            local main = item:FindFirstChildWhichIsA("BasePart")
            if main then
                main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
            end
        end
    end
end})

Tabs.Bring:Button({ Title = "复制所有废料", Callback = function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local scrapNames = {
        ["tyre"] = true, ["sheet metal"] = true, ["broken fan"] = true, ["bolt"] = true, ["old radio"] = true, ["ufo junk"] = true, ["ufo scrap"] = true, ["broken microwave"] = true,
    }
    for _, item in pairs(workspace.Items:GetChildren()) do
        if item:IsA("Model") then
            local itemName = item.Name:lower()
            for scrapName, _ in pairs(scrapNames) do
                if itemName:find(scrapName) then
                    local main = item:FindFirstChildWhichIsA("BasePart")
                    if main then
                        main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                    end
                    break
                end
            end
        end
    end
end})

Tabs.Bring:Button({Title="复制煤炭", Callback=function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    for _, item in pairs(workspace.Items:GetChildren()) do
        if item.Name:lower():find("coal") and item:IsA("Model") then
            local main = item:FindFirstChildWhichIsA("BasePart")
            if main then
                main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
            end
        end
    end
end})

Tabs.Bring:Button({Title="复制生肉和熟肉", Callback=function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    for _, item in pairs(workspace.Items:GetChildren()) do
        local name = item.Name:lower()
        if (name:find("meat") or name:find("cooked")) and item:IsA("Model") then
            local main = item:FindFirstChildWhichIsA("BasePart")
            if main then
                main.CFrame = root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
            end
        end
    end
end})

Tabs.Bring:Button({Title="复制手电筒", Callback=function() bringItemsByName("Flashlight") end})
Tabs.Bring:Button({Title="复制钉子", Callback=function() bringItemsByName("Nails") end})
Tabs.Bring:Button({Title="复制风扇", Callback=function() bringItemsByName("Fan") end})
Tabs.Bring:Button({Title="复制绳子", Callback=function() bringItemsByName("Rope") end})
Tabs.Bring:Button({Title="复制废料", Callback=function() bringItemsByName("Scrap") end})
Tabs.Bring:Button({Title="复制木材", Callback=function() bringItemsByName("Wood") end})
Tabs.Bring:Button({Title="复制布料", Callback=function() bringItemsByName("Cloth") end})
Tabs.Bring:Button({Title="复制岩石", Callback=function() bringItemsByName("Rock") end})
Tabs.Bring:Button({Title="复制石镐", Callback=function() bringItemsByName("Stone Pickaxe") end})
Tabs.Bring:Button({Title="复制小刀", Callback=function() bringItemsByName("Knife") end})
Tabs.Bring:Button({Title="复制长矛", Callback=function() bringItemsByName("Spear") end})
Tabs.Bring:Button({Title="复制皮甲", Callback=function() bringItemsByName("Leather Body") end})
Tabs.Bring:Button({Title="复制铁甲", Callback=function() bringItemsByName("Iron Body") end})
Tabs.Bring:Button({Title="复制左轮手枪", Callback=function() bringItemsByName("Revolver") end})
Tabs.Bring:Button({Title="复制步枪", Callback=function() bringItemsByName("Rifle") end})
Tabs.Bring:Button({Title="复制绷带", Callback=function() bringItemsByName("Bandage") end})
Tabs.Bring:Button({Title="复制医疗包", Callback=function() bringItemsByName("MedKit") end})
Tabs.Bring:Button({Title="复制旧收音机", Callback=function() bringItemsByName("Old Radio") end})
Tabs.Bring:Button({Title="复制钱币堆", Callback=function() bringItemsByName("Coin Stack") end})
Tabs.Bring:Button({Title="复制UFO废料", Callback=function() bringItemsByName("UFO Junk") end})
Tabs.Bring:Button({Title="复制UFO碎片", Callback=function() bringItemsByName("UFO Scrap") end})
Tabs.Bring:Button({Title="复制损坏的微波炉", Callback=function() bringItemsByName("Broken Microwave") end})
Tabs.Bring:Button({Title="复制螺栓", Callback=function() bringItemsByName("Bolt") end})
Tabs.Bring:Button({Title="复制椅子", Callback=function() bringItemsByName("Chair") end})
Tabs.Bring:Button({Title="复制种子盒", Callback=function() bringItemsByName("Seed Box") end})
Tabs.Bring:Button({Title="复制肉？三明治", Callback=function() bringItemsByName("Meat? Sandwich") end})
Tabs.Bring:Button({Title="复制蛋糕", Callback=function() bringItemsByName("Cake") end})
Tabs.Bring:Button({Title="复制胡萝卜", Callback=function() bringItemsByName("Carrot") end})
Tabs.Bring:Button({Title="复制肉块", Callback=function() bringItemsByName("Morsel") end})
Tabs.Bring:Button({Title="复制轮胎", Callback=function() bringItemsByName("Tyre") end})
Tabs.Bring:Button({Title="复制损坏的风扇", Callback=function() bringItemsByName("Broken Fan") end})
Tabs.Bring:Button({Title="复制金属板", Callback=function() bringItemsByName("Sheet Metal") end})
Tabs.Bring:Button({Title="复制强效斧", Callback=function() bringItemsByName("Strong Axe") end})
Tabs.Bring:Button({Title="复制优质斧", Callback=function() bringItemsByName("Good Axe") end})
Tabs.Bring:Button({Title="复制旧斧", Callback=function() bringItemsByName("Old Axe") end})
Tabs.Bring:Button({Title="复制步枪弹药", Callback=function() bringItemsByName("Rifle Ammo") end})
Tabs.Bring:Button({Title="复制左轮弹药", Callback=function() bringItemsByName("Revolver Ammo") end})

local hitboxSettings = {
    Wolf = false,
    Bunny = false,
    Cultist = false,
    All = false,
    Show = false,
    Size = 10
}

local function updateHitboxForModel(model)
    local root = model:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local name = model.Name:lower()

    if hitboxSettings.All then
        root.Size = Vector3.new(hitboxSettings.Size, hitboxSettings.Size, hitboxSettings.Size)
        root.Transparency = hitboxSettings.Show and 0.5 or 1
        root.Color = Color3.fromRGB(255, 255, 255)
        root.Material = Enum.Material.Neon
        root.CanCollide = false
        return
    end

    local shouldResize =
        (hitboxSettings.Wolf and (name:find("wolf") or name:find("alpha"))) or
        (hitboxSettings.Bunny and name:find("bunny")) or
        (hitboxSettings.Cultist and (name:find("cultist") or name:find("cross")))

    if shouldResize then
        root.Size = Vector3.new(hitboxSettings.Size, hitboxSettings.Size, hitboxSettings.Size)
        root.Transparency = hitboxSettings.Show and 0.5 or 1
        root.Color = Color3.fromRGB(255, 255, 255)
        root.Material = Enum.Material.Neon
        root.CanCollide = false
    end
end

task.spawn(function()
    while true do
        for _, model in ipairs(workspace:GetDescendants()) do
            if model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") then
                updateHitboxForModel(model)
            end
        end
        task.wait(2)
    end
end)


function createESPText(part, text, color)
    if part:FindFirstChild("ESPTexto") then return end

    local esp = Instance.new("BillboardGui")
    esp.Name = "ESPTexto"
    esp.Adornee = part
    esp.Size = UDim2.new(0, 100, 0, 20)
    esp.StudsOffset = Vector3.new(0, 2.5, 0)
    esp.AlwaysOnTop = true
    esp.MaxDistance = 300

    local label = Instance.new("TextLabel")
    label.Parent = esp
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(255,255,0)
    label.TextStrokeTransparency = 0.2
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold

    esp.Parent = part
end

local function Aesp(nome, tipo)
    local container
    local color
    if tipo == "item" then
        container = workspace:FindFirstChild("Items")
        color = Color3.fromRGB(0, 255, 0)
    elseif tipo == "mob" then
        container = workspace:FindFirstChild("Characters")
        color = Color3.fromRGB(255, 255, 0)
    else
        return
    end
    if not container then return end

    for _, obj in ipairs(container:GetChildren()) do
        if obj.Name == nome then
            local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
            if part then
                createESPText(part, obj.Name, color)
            end
        end
    end
end

local function Desp(nome, tipo)
    local container
    if tipo == "item" then
        container = workspace:FindFirstChild("Items")
    elseif tipo == "mob" then
        container = workspace:FindFirstChild("Characters")
    else
        return
    end
    if not container then return end

    for _, obj in ipairs(container:GetChildren()) do
        if obj.Name == nome then
            local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
            if part then
                for _, gui in ipairs(part:GetChildren()) do
                    if gui:IsA("BillboardGui") and gui.Name == "ESPTexto" then
                        gui:Destroy()
                    end
                end
            end
        end
    end
end

local ShenChouItems = {}
local ShenChouMobs = {}
local espItemsxipro = false
local espMobsxipro = false
local espConnections = {}

Tabs.esp:Section({ Title = "Esp物品", Icon = "package" })

Tabs.esp:Dropdown({
    Title = "选择Esp物品",
    Values = ie,
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouItems = options
        if espItemsxipro then
            for _, name in ipairs(ie) do
                if table.find(ShenChouItems, name) then
                    Aesp(name, "item")
                else
                    Desp(name, "item")
                end
            end
        else
            for _, name in ipairs(ie) do
                Desp(name, "item")
            end
        end
    end
})

Tabs.esp:Toggle({
    Title = "开启Esp",
    Value = false,
    Callback = function(state)
        espItemsxipro = state
        for _, name in ipairs(ie) do
            if state and table.find(ShenChouItems, name) then
                Aesp(name, "item")
            else
                Desp(name, "item")
            end
        end

        if state then
            if not espConnections["Items"] then
                local container = workspace:FindFirstChild("Items")
                if container then
                    espConnections["Items"] = container.ChildAdded:Connect(function(obj)
                        if table.find(ShenChouItems, obj.Name) then
                            local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                            if part then
                                createESP(part, obj.Name, Color3.fromRGB(0, 255, 0))
                            end
                        end
                    end)
                end
            end
        else
            if espConnections["Items"] then
                espConnections["Items"]:Disconnect()
                espConnections["Items"] = nil
            end
        end
    end
})

Tabs.esp:Section({ Title = "Esp实体", Icon = "user" })

Tabs.esp:Dropdown({
    Title = "选择Esp实体",
    Values = me,
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouMobs = options
        if espMobsxipro then
            for _, name in ipairs(me) do
                if table.find(ShenChouMobs, name) then
                    Aesp(name, "mob")
                else
                    Desp(name, "mob")
                end
            end
        else
            for _, name in ipairs(me) do
                Desp(name, "mob")
            end
        end
    end
})

Tabs.esp:Toggle({
    Title = "开启Esp",
    Value = false,
    Callback = function(state)
        espMobsxipro = state
        for _, name in ipairs(me) do
            if state and table.find(ShenChouMobs, name) then
                Aesp(name, "mob")
            else
                Desp(name, "mob")
            end
        end

        if state then
            if not espConnections["Mobs"] then
                local container = workspace:FindFirstChild("Characters")
                if container then
                    espConnections["Mobs"] = container.ChildAdded:Connect(function(obj)
                        if table.find(ShenChouMobs, obj.Name) then
                            local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                            if part then
                                createESP(part, obj.Name, Color3.fromRGB(255, 255, 0))
                            end
                        end
                    end)
                end
            end
        else
            if espConnections["Mobs"] then
                espConnections["Mobs"]:Disconnect()
                espConnections["Mobs"] = nil
            end
        end
    end
})

Tabs.Main:Section({ Title = "其他", Icon = "settings" })

local instantInteractxipro = false
local instantInteractConnection
local originalHoldDurations = {}

Tabs.Main:Toggle({
    Title = "秒互动",
    Value = false,
    Callback = function(state)
        instantInteractxipro = state

        if state then
            originalHoldDurations = {}
            instantInteractConnection = task.spawn(function()
                while instantInteractxipro do
                    for _, obj in ipairs(workspace:GetDescendants()) do
                        if obj:IsA("ProximityPrompt") then
                            if originalHoldDurations[obj] == nil then
                                originalHoldDurations[obj] = obj.HoldDuration
                            end
                            obj.HoldDuration = 0
                        end
                    end
                    task.wait(0.5)
                end
            end)
        else
            if instantInteractConnection then
                instantInteractxipro = false
            end
            for obj, value in pairs(originalHoldDurations) do
                if obj and obj:IsA("ProximityPrompt") then
                    obj.HoldDuration = value
                end
            end
            originalHoldDurations = {}
        end
    end
})

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local torchxipro = nil

Tabs.Main:Toggle({
    Title = "自动眩晕鹿",
    Value = false,
    Callback = function(state)
        if state then
            torchxipro = RunService.RenderStepped:Connect(function()
                pcall(function()
                    local remote = ReplicatedStorage:FindFirstChild("RemoteEvents")
                        and ReplicatedStorage.RemoteEvents:FindFirstChild("DeerHitByTorch")
                    local deer = workspace:FindFirstChild("Characters")
                        and workspace.Characters:FindFirstChild("Deer")
                    if remote and deer then
                        remote:InvokeServer(deer)
                    end
                end)
                task.wait(0.1)
            end)
        else
            if torchxipro then
                torchxipro:Disconnect()
                torchxipro = nil
            end
        end
    end
})