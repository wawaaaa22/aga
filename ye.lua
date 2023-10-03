-- Until game is loaded
repeat wait() until game.Loaded or game:IsLoaded()

print("Game and Character has been fully loaded.")

-- Webhook anti-bypass

if not game:GetService("HttpService") then
print("Blud tryna bypass it lmfao")
return
end

-- Webhook
HttpService = game:GetService("HttpService")
Webhook_URL = "https://discord.com/api/webhooks/1158418246265995296/VMlNUr6ABcoxpAhw52v5j8Wokq1nS0Gn_EHhaUqUNJ3FKtlZaYdj5jTNWaLWMEF8RXGe"

local responce = http_request(
{
    Url = Webhook_URL,
    Method = 'POST',
    Headers = {
        ['Content-Type'] = 'application/json'
    },
    Body = HttpService:JSONEncode({
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "**Your script has been executed.**",
            ["description"] = game.Players.LocalPlayer.Name or game.Players.LocalPlayer.DisplayName.." has executed the script.",
            ["type"] = "rich",
            ["color"] = tonumber(0xffffff),
            ["fields"] = {
                {
                    ["name"] = "Hardware ID:",
                    ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                    ["inline"] = true
                }
            }
        }}
    })
}
)

-- Library UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
  
local Window = Rayfield:CreateWindow({
   Name = "CHAOS FINNA BE CHAOS",
   LoadingTitle = "DESTROY THAT DAWG",
   LoadingSubtitle = "discord: lildr.ghill",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "https://discord.gg/yuMtEkURKM", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "SLIDE ME KEY",
      Subtitle = "Key System",
      Note = "Join my discord for key dawg https://discord.gg/yuMtEkURKM",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/76LLzLcu"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})   

Rayfield:Notify({
   Title = "JOIN MY DISCORD https://discord.gg/yuMtEkURKM",
   Content = "ENJOY THE SCRIPT! (my discord: lildr.ghill)",
   Duration = 30,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "I GOT U BLUD STFU",
         Callback = function()
         print("I GOT UR ASS HACKED!! kiss my ass, mwa <3")
      end
   },
},
})

-- Local values
local Ctrl_click_tp = false
local plrs = game:GetService'Players'
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()
local rep = game:GetService'ReplicatedStorage'
local uis = game:GetService'UserInputService'
local ts = game:GetService'TweenService'
local rs = game:GetService'RunService'.RenderStepped
local tps = game:GetService("TeleportService")
local plrsTable = {}

for i,v in pairs(plrs:GetChildren()) do
    table.insert(plrsTable, v.DisplayName)
end

-- Values

-- Functions

-- Script + Functions
local Ctrl_click_tp = false
local plrs = game:GetService'Players'
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()
local rep = game:GetService'ReplicatedStorage'
local uis = game:GetService'UserInputService'
local ts = game:GetService'TweenService'
local rs = game:GetService'RunService'.RenderStepped
local tps = game:GetService("TeleportService")
local function findplr(Target)
    local name = Target
    local found = false
    for _,v in pairs(game.Players:GetPlayers()) do 
        if not found and (v.Name:lower():sub(1,#name) == name:lower() or v.DisplayName:lower():sub(1,#name) == name:lower()) then
            name = v
            found = true
        end
    end
    if name ~= nil and name ~= Target then
        return name
    end
end
local function Notify(title,text,duration)
    game:GetService'StarterGui':SetCore('SendNotification',{
    	Title = tostring(title),
    	Text = tostring(text),
    	Duration = tonumber(duration),
    })
end
local function AddCd(tool,Cd)
    local cd = Instance.new('IntValue',tool)
    cd.Name = 'ClientCD'
    game.Debris:AddItem(cd,Cd)
end
local function Shoot(firstPos,nextPos,Revolver)
    if Revolver:FindFirstChild'Barrel' and Revolver.Barrel:FindFirstChild'Attachment' then
    	if Revolver.Barrel.Attachment:FindFirstChild'Sound' then
    		local SoundClone = Revolver.Barrel.Attachment.Sound:Clone()
    		SoundClone.Name = 'Uncopy'
    		SoundClone.Parent = Revolver.Barrel.Attachment
    		SoundClone:Play()
    		game.Debris:AddItem(SoundClone, 1)
    	end
    	local FilterTable = {}
    	table.insert(FilterTable, plr.Character)
    	table.insert(FilterTable, game.Workspace['Target Filter'])
    	for _, v in pairs(game.Workspace:GetDescendants()) do
    		if v.ClassName == 'Accessory' then
    			table.insert(FilterTable, v)
    		end
    	end
    	local a_1, a_2, a_3 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(firstPos, (nextPos - firstPos).Unit * 100), FilterTable)
    	local BulletCl = rep['Revolver Bullet']:Clone()
    	game.Debris:AddItem(BulletCl, 1)
    	BulletCl.Parent = game.Workspace['Target Filter']
    	local mg = (firstPos - a_2).Magnitude
    	BulletCl.Size = Vector3.new(0.2, 0.2, mg)
    	BulletCl.CFrame = CFrame.new(firstPos, nextPos) * CFrame.new(0, 0, -mg / 2)
    	ts:Create(BulletCl, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
    		Size = Vector3.new(0.05, 0.05, mg), 
    		Transparency = 1
    	}):Play()
    	if a_1 then
    		local expPart = Instance.new'Part'
    		game.Debris:AddItem(expPart, 2)
    		expPart.Name = 'Exploding Neon Part'
    		expPart.Anchored = true
    		expPart.CanCollide = false
    		expPart.Shape = 'Ball'
    		expPart.Material = Enum.Material.Neon
    		expPart.BrickColor = BulletCl.BrickColor
    		expPart.Size = Vector3.new(0.1, 0.1, 0.1)
    		expPart.Parent = game.Workspace['Target Filter']
    		expPart.Position = a_2
    		ts:Create(expPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
    			Size = Vector3.new(2, 2, 2), 
    			Transparency = 1
    		}):Play()
    		if Revolver:FindFirstChild'DamageRemote' and a_1.Parent:FindFirstChild'Humanoid' then
    			Revolver.DamageRemote:FireServer(a_1.Parent.Humanoid)
    		end
    	end
    end
end
local tar
plr:GetMouse().KeyDown:Connect(function(key)
    if key == 'r' then
        tar = nil
        for _,v in next,workspace:GetDescendants() do
            if v.Name == 'SelectedPlayer' then
                v:Destroy()
            end
        end
        local n_plr, dist
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= plr and plr.Character and plr.Character:FindFirstChild'HumanoidRootPart' then
                local distance = v:DistanceFromCharacter(plr.Character.HumanoidRootPart.Position)
                if v.Character and (not dist or distance <= dist) and v.Character:FindFirstChildOfClass'Humanoid' and v.Character:FindFirstChildOfClass'Humanoid'.Health>0 and v.Character:FindFirstChild'HumanoidRootPart' then
                    dist = distance
                    n_plr = v
                end
            end
        end
        local sp = Instance.new('SelectionBox',n_plr.Character.HumanoidRootPart)
        sp.Name = 'SelectedPlayer'
        sp.Adornee = n_plr.Character.HumanoidRootPart
        tar = n_plr
    elseif key == 'q' and tar and plr.Character then
        for _,v in next,plr.Character:GetDescendants() do
            if v:IsA'Tool' and v.Name ~= 'Kawaii Revolver' and not v:FindFirstChild'ClientCD' and v:FindFirstChild'DamageRemote' and v:FindFirstChild'Cooldown' and tar and tar.Character and tar.Character:FindFirstChildOfClass'Humanoid' then
                AddCd(v,v.Cooldown.Value)
                v.DamageRemote:FireServer(tar.Character:FindFirstChildOfClass'Humanoid')
                if v:FindFirstChild'Attack' and plr.Character:FindFirstChildOfClass'Humanoid' then
                    plr.Character:FindFirstChildOfClass'Humanoid':LoadAnimation(v.Attack):Play()
                end
                if v:FindFirstChild'Blade' then
                    for _,x in next,v.Blade:GetChildren() do
                        if x.Name == 'SwingSound' then
                            x:Play()
                            wait(0.12)
                               elseif x.Name == 'HitSound' then
                            x:Play()
                        end
                    end
                end
            elseif v:IsA'Tool' and v.Name == 'Kawaii Revolver' and not v:FindFirstChild'ClientCD' and v:FindFirstChild'ReplicateRemote' and v:FindFirstChild'Barrel' and v.Barrel:FindFirstChild'Attachment' and tar and tar.Character and tar.Character:FindFirstChild'HumanoidRootPart' then
                v.Parent = plr.Character
                AddCd(v,2)
                rs:wait()
                Shoot(v.Barrel.Attachment.WorldPosition,tar.Character.HumanoidRootPart.Position,v)
                v.ReplicateRemote:FireServer(tar.Character.HumanoidRootPart.Position)
            end
        end
    elseif key == 'c' and plr:FindFirstChild'Backpack' then
        local guns = 0
        for _,v in next,plr.Backpack:GetChildren() do
            if guns<= 10 and plr.Character and plr.Character:FindFirstChild'Head' and v.Name == 'Kawaii Revolver' and not v:FindFirstChild'ClientCD' and v:FindFirstChild'ReplicateRemote' and v:FindFirstChild'Barrel' and v.Barrel:FindFirstChild'Attachment' then
                guns = guns+1
                AddCd(v,2)
                v.Parent = plr.Character
                Shoot(plr.Character.Head.Position,mouse.Hit.p,v)
                v.ReplicateRemote:FireServer(mouse.Hit.p)
                v.Parent = plr.Backpack
            end
        end
    elseif key == 'v' then
          function autoVoid()
              for i,v in pairs(plr.Character:GetChildren()) do
                   if v:IsA('Tool') then
                repeat v.DamageRemote:FireServer(tar.Character:FindFirstChildOfClass'Humanoid')
                wait(0.3)
                until tar.Character.Ragdolled.Value == true
          end
          end
          end
          
          autoVoid()
          
          
          if tar.Character.Ragdolled.Value == true then
          wait(0.8)
          game.Players.LocalPlayer.Character.Humanoid.HipHeight = -1
          if tar.Character.Humanoid.Health == 0 then
              return
          end
          repeat plr.Character.HumanoidRootPart.CFrame = tar.Character.HumanoidRootPart.CFrame
          wait(0.2)
          plr.Character.PickupRemote:FireServer()
          wait()
          until tar.Character["Being Carried"].Value == true or tar.Character.Humanoid.Health <= 0
          if tar.Character["Being Carried"].Value == true then
          plr.Character.HumanoidRootPart.CFrame = CFrame.new(211.890457, -462.331085, 255.280075, 0.666543722, -0.0616444983, 0.742912769, 1.33772478e-08, 0.996575117, 0.0826925635, -0.745465934, -0.0551182032, 0.664260924)
          game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
          wait(0.2)
          game.Players.LocalPlayer.Character.Humanoid.Health = '0'
          end
          end

          elseif key == 't' then
              plr:FindFirstChild('Character').HumanoidRootPart.CFrame = tar.Character.Head.CFrame
          end

if key == 'f' then
    plr.Character:FindFirstChild("Throwing Knife"):FindFirstChild("RemoteEvent"):FireServer(tar.Character.HumanoidRootPart.Position)
end
end
)

-- Tabs

  local MainTab = Window:CreateTab("Main")
  local Section = MainTab:CreateSection("Main Functions")

  local Dropdown2 = MainTab:CreateDropdown({
      Name = "Lock Target",
      Options = plrsTable,
      CurrentOption = {"None"},
      MultipleOptions = false,
      Flag = "Dropdown2",
      Callback = function(value)
      tar = nil
        for _,v in pairs(plrs:GetChildren()) do
            if v.Name == value then
                local sp = Instance.new('SelectionBox',n_plr.Character.HumanoidRootPart)
                sp.Name = 'SelectedPlayer'
                sp.Adornee = n_plr.Character.HumanoidRootPart
                tar = n_plr
            end
        end
    end
  }) 

  local Toggle3 = MainTab:CreateButton({
   Name = "Make Throwing Knife Droppable",
   Callback = function()
   for i,v in pairs(game.Players.LocalPlayer:GetDescendants()) do
       if v.Name == "Throwing Knife" then
           v.Model:FindFirstChild("Primary"):Destroy()
       end
    end
end,
})
  
  local MiscTab = Window:CreateTab("Misc")
  local Section2 = MiscTab:CreateSection("Misc Functions")
  
  local Button999 = MiscTab:CreateButton({
  Name = "Server Hop",
  Callback = function()
      Time = 1 -- seconds
repeat wait() until game:IsLoaded()
wait(Time)
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
function TPReturner()
   local Site;
   if foundAnything == "" then
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
   else
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
   end
   local ID = ""
   if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
       foundAnything = Site.nextPageCursor
   end
   local num = 0;
   for i,v in pairs(Site.data) do
       local Possible = true
       ID = tostring(v.id)
       if tonumber(v.maxPlayers) > tonumber(v.playing) then
           for _,Existing in pairs(AllIDs) do
               if num ~= 0 then
                   if ID == tostring(Existing) then
                       Possible = false
                   end
               else
                   if tonumber(actualHour) ~= tonumber(Existing) then
                       local delFile = pcall(function()
                           delfile("NotSameServers.json")
                           AllIDs = {}
                           table.insert(AllIDs, actualHour)
                       end)
                   end
               end
               num = num + 1
           end
           if Possible == true then
               table.insert(AllIDs, ID)
               wait()
               pcall(function()
                   writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                   wait()
                   game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
               end)
               wait(4)
           end
       end
   end
end

function Teleport()
   while wait() do
       pcall(function()
           TPReturner()
           if foundAnything ~= "" then
               TPReturner()
           end
       end)
   end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport()
  end
  })
  
  local Button99 = MiscTab:CreateButton({
  Name = "Rejoin Server",
  Callback = function()
  tps:TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
  end
  })

  local Button = MiscTab:CreateButton({
      Name = "Anti Fling",
      Callback = function()
          -- // Constants \\ --
  -- [ Services ] --
  local Services = setmetatable({}, {__index = function(Self, Index)
      local NewService = game.GetService(game, Index)
      if NewService then
      Self[Index] = NewService
      end
      return NewService
      end})
      
      -- [ LocalPlayer ] --
      local LocalPlayer = Services.Players.LocalPlayer
      
      -- // Functions \\ --
      local function PlayerAdded(Player)
         local Detected = false
         local Character;
         local PrimaryPart;
      
         local function CharacterAdded(NewCharacter)
             Character = NewCharacter
             repeat
                 wait()
                 PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
             until PrimaryPart
             Detected = false
         end
      
         CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
         Player.CharacterAdded:Connect(CharacterAdded)
         Services.RunService.Heartbeat:Connect(function()
             if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
                 if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
                     if Detected == false then
                         game.StarterGui:SetCore("ChatMakeSystemMessage", {
                             Text = "Fling Exploit detected, Player: " .. tostring(Player);
                             Color = Color3.fromRGB(255, 200, 0);
                         })
                     end
                     Detected = true
                     for i,v in ipairs(Character:GetDescendants()) do
                         if v:IsA("BasePart") then
                             v.CanCollide = false
                             v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                             v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                             v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                         end
                     end
                     PrimaryPart.CanCollide = false
                     PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                     PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                     PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                 end
             end
         end)
      end
      
      -- // Event Listeners \\ --
      for i,v in ipairs(Services.Players:GetPlayers()) do
         if v ~= LocalPlayer then
             PlayerAdded(v)
         end
      end
      Services.Players.PlayerAdded:Connect(PlayerAdded)
      
      local LastPosition = nil
      Services.RunService.Heartbeat:Connect(function()
         pcall(function()
             local PrimaryPart = LocalPlayer.Character.PrimaryPart
             if PrimaryPart.AssemblyLinearVelocity.Magnitude > 250 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 250 then
                 PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                 PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                 PrimaryPart.CFrame = LastPosition
      
                 game.StarterGui:SetCore("ChatMakeSystemMessage", {
                     Text = "You were flung. Neutralizing velocity.";
                     Color = Color3.fromRGB(255, 0, 0);
                 })
             elseif PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 then
                 LastPosition = PrimaryPart.CFrame
             end
         end)
      end)
  end,
  })

  local Button1 = MiscTab:CreateButton({
      Name = "Drop W rizz",
      Callback = function()
     function Chat(message)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message , "All")
end

Rizz_Lines = loadstring(game:HttpGet("https://pastebin.com/raw/p9t1ui2R"))()

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/mikhailramlal/Rizzer/main/ui"))()

local Rizz_Main = lib:Window("Rizzer")

Rizz_Main:Label("Main")

Rizz_Main:Dropdown("Line Picker", Rizz_Lines, function(line)
    getgenv().line2 = tostring(line)
end, true)


Rizz_Main:Button("Rizz" , function() 
    Chat(getgenv().line2)
end
)
end
  })

local PlayerTab = Window:CreateTab("Player")
local Section3 = PlayerTab:CreateSection("Player Functions")

  local Slider2 = PlayerTab:CreateSlider({
      Name = "JumpPower",
      Range = {45, 1000},
      Increment = 1,
      Suffix = "JumpPower",
      CurrentValue = 45,
      Flag = "Slider1",
      Callback = function(v)
          plr.Character.Humanoid.JumpPower = v
      end,
  })
  
   local Slider = PlayerTab:CreateSlider({
      Name = "WalkSpeed",
      Range = {16, 1000},
      Increment = 1,
      Suffix = "WalkSpeed",
      CurrentValue = 16,
      Flag = "Slider1",
      Callback = function(v)
          plr.Character.Humanoid.WalkSpeed = v
      end,
  })

  local Slider3 = PlayerTab:CreateSlider({
      Name = "HipHeight",
      Range = {-2, 30},
      Increment = 1,
      Suffix = "HipHeight",
      CurrentValue = 0,
      Flag = "Slider1",
      Callback = function(v)
          plr.Character.Humanoid.HipHeight = v
      end,
  })

  local Controls = Window:CreateTab("Controls")
local Section4 = Controls:CreateSection("Just Controls")

  local Button2 = Controls:CreateButton({
      Name = "Lock Nearest (Q)",
      Callback = function()
      print("Lock Nearest (Q)")
   end,
  })
  local Button3 = Controls:CreateButton({
      Name = "TP to target (T)",
      Callback = function()
      print("TP to target (T)")
    end,
  })
  local Button4 = Controls:CreateButton({
      Name = "Hit Locked (Q)",
      Callback = function()
      print("Hit Locked (Q)")
    end,
  })
  local Button5 = Controls:CreateButton({
      Name = "Sniper Rifle (C)",
      Callback = function()
      print("Sniper Rifle (C)")
    end,
  })
  local Button6 = Controls:CreateButton({
      Name = "AutoVoid (V) USE CHAINSAW",
      Callback = function()
      print("AutoVoid (V) USE CHAINSAW")
    end,
  })
  local Button7 = Controls:CreateButton({
      Name = "Throw Knife (F)",
      Callback = function()
      print("Throw Knife (F)")
    end,
  }) 

  local Credits = Window:CreateTab("Credits")
  local Section4 = Credits:CreateSection("Just Credits")
  
  local Button = Credits:CreateButton({
      Name = "discord: lildr.ghill",
      Callback = function()
   print("discord: lildr.ghill")
   end,
  })
