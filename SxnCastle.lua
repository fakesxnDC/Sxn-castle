local P,RS,UIS,LP,Cam=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("Players").LocalPlayer,workspace.CurrentCamera
local Aim,Hit,Esp,SC,Hold,Target,Neon,CanClip,Cooldown=false,false,false,false,false,nil,Color3.fromRGB(180,0,255),true,3.5
local Old=game:GetService("CoreGui"):FindFirstChild("SxnV62") or LP.PlayerGui:FindFirstChild("SxnV62")
if Old then Old:Destroy() end

local sg=Instance.new("ScreenGui",game:GetService("CoreGui") or LP.PlayerGui);sg.Name="SxnV62";sg.ResetOnSpawn=false
local function Create(cls,props,par) local i=Instance.new(cls,par);for k,v in pairs(props)do i[k]=v end;return i end

local F=Create("Frame",{Size=UDim2.new(0,320,0,180),Position=UDim2.new(0.5,-160,0.5,-90),BackgroundColor3=Color3.new(0,0,0)},sg);Create("UICorner",{},F);Create("UIStroke",{Color=Neon},F)
local T1=Create("TextLabel",{Size=UDim2.new(1,0,0,40),Position=UDim2.new(0,0,0,30),Text="Welcome To Castle Of Cheat 📛",TextColor3=Color3.new(1,1,1),Font="GothamBold",BackgroundTransparency=1},F)
local T2=Create("TextLabel",{Size=UDim2.new(1,0,0,30),Position=UDim2.new(0,0,0,70),Text="👑 Creator by Trincheras Shop",TextColor3=Neon,Font="GothamBold",BackgroundTransparency=1},F)
local T3=Create("TextLabel",{Size=UDim2.new(1,0,0,30),Position=UDim2.new(0,0,0,100),Text="💳 fakesxn (username DC)",TextColor3=Color3.new(0.8,0.8,0.8),Font="GothamBold",BackgroundTransparency=1},F)

local M=Create("Frame",{Size=UDim2.new(0,215,0,420),Position=UDim2.new(0.1,0,0.3,0),BackgroundColor3=Color3.fromRGB(10,10,10),Active=true,Draggable=true,Visible=false},sg);Create("UICorner",{},M);Create("UIStroke",{Color=Neon},M)
local Ti=Create("TextLabel",{Size=UDim2.new(1,0,0,50),Text="🌪 SILENT XITER",TextColor3=Neon,Font="GothamBold",TextSize=22,BackgroundTransparency=1},M)
local Min=Create("TextButton",{Size=UDim2.new(0,30,0,30),Position=UDim2.new(1,-35,0,10),Text="-",TextColor3=Neon,BackgroundTransparency=1,TextSize=25},M)
local C=Create("ScrollingFrame",{Size=UDim2.new(1,-16,1,-70),Position=UDim2.new(0,8,0,60),BackgroundTransparency=1,ScrollBarThickness=2},M);Create("UIListLayout",{Padding=UDim.new(0,6)},C)

task.spawn(function() task.wait(3.5);F:TweenSize(UDim2.new(0,0,0,0),"Out","Quad",0.5,true);task.wait(0.5);F:Destroy();M.Visible=true end)
Min.MouseButton1Click:Connect(function() C.Visible=not C.Visible;M:TweenSize(C.Visible and UDim2.new(0,215,0,420) or UDim2.new(0,215,0,55),"Out","Quad",0.3,true) end)

local function AddB(t,cb)
    local b=Create("TextButton",{Size=UDim2.new(1,0,0,40),Text=t,BackgroundColor3=Color3.fromRGB(25,25,25),TextColor3=Color3.new(1,1,1),Font="GothamBold",TextSize=13},C);Create("UICorner",{},b)
    b.MouseButton1Click:Connect(function() local a=cb() b.TextColor3=a and Neon or Color3.new(1,1,1) end)
end

local function DoClip() if CanClip and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then CanClip=false;LP.Character.HumanoidRootPart.CFrame+=LP.Character.HumanoidRootPart.CFrame.LookVector*6.5;task.wait(Cooldown);CanClip=true end end

AddB("Aimbot Head (Elite)",function() Aim=not Aim return Aim end)
AddB("Hitbox Invisible",function() Hit=not Hit return Hit end)
AddB("ESP Neon Names",function() Esp=not Esp return Esp end)
AddB("AutoClicker X20",function() SC=not SC return SC end)
AddB("Wall-Clip (Mobile/PC)",function() DoClip() return true end)
AddB("Boost FPS",function() for _,v in pairs(game:GetDescendants())do if v:IsA("Texture")or v:IsA("Decal")then v.Transparency=1 elseif v:IsA("BasePart")then v.Material=Enum.Material.Plastic end end return true end)

RS.RenderStepped:Connect(function()
    if Aim and Hold then
        if not (Target and Target.Character and Target.Character:FindFirstChild("Humanoid") and Target.Character.Humanoid.Health>0) then
            local cl,di=nil,180
            for _,p in pairs(P:GetPlayers())do if p~=LP and p.Character and p.Character:FindFirstChild("Head") and p.Character.Humanoid.Health>0 then local d=(p.Character.Head.Position-LP.Character.Head.Position).Magnitude;if d<di then cl=p;di=d end end end
            Target=cl
        end
        if Target then Cam.CFrame=CFrame.lookAt(Cam.CFrame.Position,Target.Character.Head.Position+Vector3.new(0,0.22,0)) end
    else Target=nil end
    for _,p in pairs(P:GetPlayers())do if p~=LP and p.Character and p.Character:FindFirstChild("Head") then
        local h,hum=p.Character.Head,p.Character.Humanoid
        if Esp and hum.Health>0 then
            local b=h:FindFirstChild("SxnL") or Create("BillboardGui",{Name="SxnL",AlwaysOnTop=true,Size=UDim2.new(0,100,0,40),ExtentsOffset=Vector3.new(0,3,0)},h)
            local t=b:FindFirstChild("I") or Create("TextLabel",{Name="I",Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,TextColor3=Neon,Font="GothamBold",TextSize=10},b)
            t.Text=p.Name.."\n"..math.floor((h.Position-LP.Character.Head.Position).Magnitude).."m"
        elseif h:FindFirstChild("SxnL") then h.SxnL:Destroy() end
        if Hit and hum.Health>0 then h.Size=Vector3.new(4,4,4);h.Transparency=0.7;h.Material=Enum.Material.ForceField;h.Color=Neon else h.Size=Vector3.new(1,1,1);h.Transparency=0;h.Material=Enum.Material.Plastic end
    end end
end)

task.spawn(function() while task.wait(0.01)do if SC and Hold and LP.Character:FindFirstChildOfClass("Tool")then for i=1,20 do LP.Character:FindFirstChildOfClass("Tool"):Activate() end end end end)
UIS.InputBegan:Connect(function(i,g) if g then return end if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then Hold=true end if i.KeyCode==Enum.KeyCode.V then DoClip() end end)
UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then Hold=false end end)
