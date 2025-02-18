-- vars
local cam = workspace.Camera
local plrs = game.Players
local plr = plrs.LocalPlayer
local light = game.Lighting
local replic = game:GetService"ReplicatedStorage"
local uis = game:GetService"UserInputService"

-- toggle
-- as is auto spawn
local as_dlb
local as_slb
local as_rlb
local as_dimlb
local as_glb
local whitelistEn
local infJump
local aura
local auraRadius = 50

local bestSwords = {
	"ChartreusePeriastron",
	"IvoryPeriastron",
	"SpectralSword",
	"CrimsonPeriastron",
	"SpecOmegaBiograftEnergySword",
	"DualSpecGammaBiograftEnergySword",
	"RainbowPeriastron",
	"Illumina",
	"DaggerOfShatteredDimensions",
	"SpecZetaBiograftEnergySword",
	"SpecGammaBiograftEnergySword",
	"Magician'sCloak",
	"Ice Dragon Slaying Sword",
	"FireSword",
	"CrescendoTheSoulStealer",
	"FangOfTsuchigumo"
}

local function kill(nigga)
	local pHRP = nigga.Character.HumanoidRootPart
	local lastCF = plr.Character.HumanoidRootPart.CFrame
	plr.Character.HumanoidRootPart.CFrame = pHRP.CFrame * CFrame.new(0, 0, 1.1)
	wait()
	plr.Character.HumanoidRootPart.CFrame = pHRP.CFrame * CFrame.new(0, 0, 1.1)
	wait()
	plr.Character.HumanoidRootPart.CFrame = pHRP.CFrame * CFrame.new(0, 0, 1.1)
	wait(0.7)
	plr.Character.HumanoidRootPart.CFrame = lastCF
	wait()
end

local function equipBest()
	for i, tool in pairs(plr.Backpack:GetChildren()) do
		for i, sword in pairs(bestSwords) do
			if tool.Name == sword then
				tool.Parent = plr.Character
			end
		end
	end
end

-- lib
local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/m1kp0/libraries/refs/heads/main/m1kpe0_orion_lib.lua")))()
local Window = OrionLib:MakeWindow({Name = "m1kp | lucky block battleground", HidePremium = false, IntroEnabled = false, IntroText = "Loading..", SaveConfig = true, ConfigFolder = "OrionTest"})

-- tabs
local CharTab = Window:MakeTab({Name = "character", Icon = "", PremiumOnly = false})
local LuckyBlockTab = Window:MakeTab({Name = "lucky blocks", Icon = "", PremiumOnly = false})
local ScriptTab = Window:MakeTab({Name = "scripts", Icon = "", PremiumOnly = false})
local TimeTab = Window:MakeTab({Name = "clock time", Icon = "", PremiumOnly = false})
local AdvanceTab = Window:MakeTab({Name = "advanced", Icon = "", PremiumOnly = false})

-- character tab
CharTab:AddSlider({
    Name = "walk speed",
    Min = 0,
    Max = 100,
    Color = Color3.fromRGB(102, 0, 102),
    ValueName = "",
    Increment = 1,
    Default = 16,
    Callback = function(e)
        plr.Character.Humanoid.WalkSpeed = e
    end
})

CharTab:AddButton({
	Name = "reset walk speed",
	Callback = function()
      	plr.Character.Humanoid.WalkSpeed = 16
  	end    
})

CharTab:AddSlider({
    Name = "jump power",
    Min = 0,
    Max = 1000,
    Color = Color3.fromRGB(102, 0, 102),
    ValueName = "",
    Increment = 1,
    Default = 50,
    Callback = function(e)
        plr.Character.Humanoid.JumpPower = e
    end
})

CharTab:AddButton({
	Name = "reset jump power",
	Callback = function()
      	plr.Character.Humanoid.JumpPower = 50
  	end    
})

CharTab:AddToggle({
	Name = "infinite jumps",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		if Value then
			infJump = true
			uis.JumpRequest:Connect(function()
				if infJump then
					plr.Character.Humanoid:ChangeState("Jumping")
				end
			end)
		else
			infJump = false
		end
	end
})

CharTab:AddSlider({
    Name = "gravity",
    Min = 0,
    Max = 1000,
    Color = Color3.fromRGB(102, 0, 102),
    ValueName = "",
    Increment = 1,
    Default = 196,
    Callback = function(e)
        workspace.Gravity = e
    end
})

CharTab:AddButton({
	Name = "reset gravity",
	Callback = function()
      	workspace.Gravity = 196
  	end    
})

CharTab:AddSlider({
    Name = "field of view",
    Min = 1,
    Max = 120,
    Color = Color3.fromRGB(102, 0, 102),
    ValueName = "",
    Increment = 1,
    Default = 70,
    Callback = function(e)
        cam.FieldOfView = e
    end
})

CharTab:AddButton({
	Name = "reset field of view",
	Callback = function()
      	cam.FieldOfView = 70
  	end    
})

-- lucky blocks tab
LuckyBlockTab:AddSection({Name = "default lucky block"})

LuckyBlockTab:AddButton({
	Name = "spawn block",
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnLuckyBlock:FireServer(unpack(args))
  	end    
})

LuckyBlockTab:AddToggle({
	Name = "auto spawn block",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(e)
        as_dlb = e
		while as_dlb do
            wait(0.1)
            local args = {[1] = 1}
            replic.SpawnLuckyBlock:FireServer(unpack(args))
        end
	end
})

LuckyBlockTab:AddSection({Name = "super lucky block"})

LuckyBlockTab:AddButton({
	Name = "spawn block",
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnSuperBlock:FireServer(unpack(args))
  	end    
})

LuckyBlockTab:AddToggle({
	Name = "auto spawn block",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(e)
        as_slb = e
		while as_slb do
            wait(0.1)
            local args = {[1] = 1}
            replic.SpawnSuperBlock:FireServer(unpack(args))
        end
	end
})

LuckyBlockTab:AddSection({Name = "diamond lucky block"})

LuckyBlockTab:AddButton({
	Name = "spawn block",
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnDiamondBlock:FireServer(unpack(args))
  	end    
})

LuckyBlockTab:AddToggle({
	Name = "auto spawn block",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(e)
        as_dimlb = e
		while as_dimlb do
            wait(0.1)
            local args = {[1] = 1}
            replic.SpawnDiamondBlock:FireServer(unpack(args))
        end
	end
})

LuckyBlockTab:AddSection({Name = "rainbow lucky block"})

LuckyBlockTab:AddButton({
	Name = "spawn block",
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnRainbowBlock:FireServer(unpack(args))
  	end    
})

LuckyBlockTab:AddToggle({
	Name = "auto spawn block",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(e)
        as_rlb = e
		while as_rlb do
            wait(0.1)
            local args = {[1] = 1}
            replic.SpawnRainbowBlock:FireServer(unpack(args))
        end
	end
})

LuckyBlockTab:AddSection({Name = "galaxy lucky block"})

LuckyBlockTab:AddButton({
	Name = "spawn block",
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnGalaxyBlock:FireServer(unpack(args))
  	end    
})

LuckyBlockTab:AddToggle({
	Name = "auto spawn block",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(e)
        as_glb = e
		while as_glb do
            wait(0.1)
            local args = {[1] = 1}
            replic.SpawnGalaxyBlock:FireServer(unpack(args))
        end
	end
})

-- scripts tab
ScriptTab:AddButton({
	Name = "infinite yield FE",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
  	end    
})

ScriptTab:AddButton({
	Name = "system broken",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
  	end    
})

ScriptTab:AddButton({
	Name = "dex explorer",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
  	end    
})

ScriptTab:AddButton({
	Name = "path & float (m1kp)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/m1kp0/universal_scripts/refs/heads/main/ONLY-PC_pathing"))()
	end    
})

ScriptTab:AddButton({
	Name = "m1kp`s github (more scripts)",
	Callback = function()
		setclipboard(tostring("https://github.com/m1kp0"))
        OrionLib:MakeNotification({
            Name = "copied link",
            Content = "github",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
	end    
})

TimeTab:AddButton({
	Name = "night",
	Callback = function()
        game.Lighting.ClockTime = 0
  	end    
})

TimeTab:AddButton({
	Name = "day",
	Callback = function()
        game.Lighting.ClockTime = 12
  	end    
})

TimeTab:AddButton({
	Name = "evening",
	Callback = function()
        game.Lighting.ClockTime = 18
  	end    
})

TimeTab:AddButton({
	Name = "morning",
	Callback = function()
        game.Lighting.ClockTime = 6
  	end    
})

AdvanceTab:AddButton({
	Name = "equip all tools",
	Callback = function()
        for i, tool in pairs(plr.Backpack:GetChildren()) do
			tool.Parent = plr.Character
			wait()
		end
  	end    
})

AdvanceTab:AddButton({
	Name = "insane damage: equip all best swords",
	Callback = function()
		equipBest()
  	end    
})

AdvanceTab:AddButton({
	Name = "kill all",
	Callback = function()
		local plr = game.Players.LocalPlayer
		local pos = plr.Character.HumanoidRootPart.Position
		equipBest()
		for i, p in pairs(plrs:GetPlayers()) do
			if p.Character then
				if plr.Character.Humanoid.Health ~= 0 and p.Character.Humanoid.Health ~= 0 then
					if not whitelistEn or not plr:IsFriendsWith(p.UserId) then
  						kill(p)
					end
				end
			end
		end
  	end 
})

AdvanceTab:AddToggle({
	Name = "kill aura",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(e)
 			if e then
			equipBest()
			aura = coroutine.create(function()
				while e do
					pcall(function()
						local char = plr.Character
						if char and char:FindFirstChild("HumanoidRootPart") then
							local hrp = char.HumanoidRootPart
							for _, p in pairs(plrs:GetPlayers()) do
								if p ~= plr and p.Character then
									local pChar = p.Character
									local pHRP = pChar:FindFirstChild("HumanoidRootPart")
									if pHRP then
										if (plr.Character.HumanoidRootPart.Position - pChar.HumanoidRootPart.Position).Magnitude <= auraRadius then
											if pHRP and p.Character.Humanoid.Health ~= 0 then
												local plr = game.Players.LocalPlayer
												if not whitelistEn or not plr:IsFriendsWith(p.UserId) then
													kill(p)
												end
											end
										end
									end
								end
							end
						end
					end)
					wait(0.5)
				end
			end)
			coroutine.resume(aura)
		elseif aura then
			coroutine.close(aura)
			aura = nil
		end
	end
})

AdvanceTab:AddToggle({
	Name = "whitelist friends",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(e)
        whitelistEn = e
	end
})
