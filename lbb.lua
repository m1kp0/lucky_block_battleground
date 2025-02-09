-- vars
local cam = workspace.Camera
local plrs = game.Players
local plr = plrs.LocalPlayer
local replic = game:GetService'ReplicatedStorage'
local uis = game:GetService'UserInputService'

-- toggle
-- as is auto spawn
local as_dlb
local as_slb
local as_rlb
local as_dimlb
local as_glb
local infJump

-- lib
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/m1kp0/libraries/refs/heads/main/m1kpe0_orion_lib.lua')))()
local Window = OrionLib:MakeWindow({Name = 'm1kp | lucky block battleground', HidePremium = false, IntroEnabled = false, IntroText = 'Loading..', SaveConfig = true, ConfigFolder = 'OrionTest'})

-- tabs
local CharTab = Window:MakeTab({Name = 'character', Icon = '', PremiumOnly = false})
local LuckyBlockTab = Window:MakeTab({Name = 'lucky blocks', Icon = '', PremiumOnly = false})
local ScriptTab = Window:MakeTab({Name = 'scripts', Icon = '', PremiumOnly = false})
local TimeTab = Window:MakeTab({Name = 'clock time', Icon = '', PremiumOnly = false})

-- character tab
CharTab:AddSlider({
    Name = 'walk speed',
    Min = 0,
    Max = 100,
    Color = Color3.fromRGB(102, 0, 102),
    ValueName = '',
    Increment = 1,
    Default = 16,
    Callback = function(e)
        plr.Character.Humanoid.WalkSpeed = e
    end
})

CharTab:AddButton({
	Name = 'reset walk speed',
	Callback = function()
      	plr.Character.Humanoid.WalkSpeed = 16
  	end    
})

CharTab:AddSlider({
    Name = 'jump power',
    Min = 0,
    Max = 1000,
    Color = Color3.fromRGB(102, 0, 102),
    ValueName = '',
    Increment = 1,
    Default = 50,
    Callback = function(e)
        plr.Character.Humanoid.JumpPower = e
    end
})

CharTab:AddButton({
	Name = 'reset jump power',
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
    Name = 'gravity',
    Min = 0,
    Max = 1000,
    Color = Color3.fromRGB(102, 0, 102),
    ValueName = '',
    Increment = 1,
    Default = 196,
    Callback = function(e)
        workspace.Gravity = e
    end
})

CharTab:AddButton({
	Name = 'reset gravity',
	Callback = function()
      	workspace.Gravity = 196
  	end    
})

CharTab:AddSlider({
    Name = 'field of view',
    Min = 1,
    Max = 120,
    Color = Color3.fromRGB(102, 0, 102),
    ValueName = '',
    Increment = 1,
    Default = 70,
    Callback = function(e)
        cam.FieldOfView = e
    end
})

CharTab:AddButton({
	Name = 'reset field of view',
	Callback = function()
      	cam.FieldOfView = 70
  	end    
})

-- lucky blocks tab
LuckyBlockTab:AddSection({Name = 'default lucky block'})

LuckyBlockTab:AddButton({
	Name = 'spawn block',
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnLuckyBlock:FireServer(unpack(args))
  	end    
})

LuckyBlockTab:AddToggle({
	Name = 'auto spawn block',
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

LuckyBlockTab:AddSection({Name = 'super lucky block'})

LuckyBlockTab:AddButton({
	Name = 'spawn block',
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnSuperBlock:FireServer(unpack(args))
  	end    
})

LuckyBlockTab:AddToggle({
	Name = 'auto spawn block',
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

LuckyBlockTab:AddSection({Name = 'diamond lucky block'})

LuckyBlockTab:AddButton({
	Name = 'spawn block',
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnDiamondBlock:FireServer(unpack(args))
  	end    
})

LuckyBlockTab:AddToggle({
	Name = 'auto spawn block',
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

LuckyBlockTab:AddSection({Name = 'rainbow lucky block'})

LuckyBlockTab:AddButton({
	Name = 'spawn block',
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnRainbowBlock:FireServer(unpack(args))
  	end    
})

LuckyBlockTab:AddToggle({
	Name = 'auto spawn block',
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

LuckyBlockTab:AddSection({Name = 'galaxy lucky block'})

LuckyBlockTab:AddButton({
	Name = 'spawn block',
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnGalaxyBlock:FireServer(unpack(args))
  	end    
})

LuckyBlockTab:AddToggle({
	Name = 'auto spawn block',
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
	Name = 'infinite yield FE',
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})

ScriptTab:AddButton({
	Name = 'system broken',
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script'))()
  	end    
})

ScriptTab:AddButton({
	Name = 'dex explorer',
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))()
  	end    
})

ScriptTab:AddButton({
	Name = 'path & float (m1kp)',
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/m1kp0/universal_scripts/refs/heads/main/ONLY-PC_pathing'))()
	end    
})

ScriptTab:AddButton({
	Name = 'm1kp`s github (more scripts)',
	Callback = function()
		setclipboard(tostring('https://github.com/m1kp0'))
        OrionLib:MakeNotification({
            Name = 'copied link',
            Content = 'github',
            Image = 'rbxassetid://4483345998',
            Time = 3
        })
	end    
})

TimeTab:AddButton({
	Name = 'night',
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnRainbowBlock:FireServer(unpack(args))
  	end    
})

TimeTab:AddButton({
	Name = 'day',
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnRainbowBlock:FireServer(unpack(args))
  	end    
})

TimeTab:AddButton({
	Name = 'evening',
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnRainbowBlock:FireServer(unpack(args))
  	end    
})

TimeTab:AddButton({
	Name = 'morning',
	Callback = function()
        local args = {[1] = 1}
        replic.SpawnRainbowBlock:FireServer(unpack(args))
  	end    
})
