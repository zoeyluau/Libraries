--[[

wow - zoe
fucking shit uiconstraint stuff.

]]

-- [ Variables ] --
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")
local uis = game:GetService("UserInputService")

local player = players.LocalPlayer
local mouse = player:GetMouse()

local ZapLib = {}
UI = {}

local tweenInfo = TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
local view = workspace.CurrentCamera.ViewportSize

-- [ Functions ] --
function ZapLib:SetDefaults(defaults, options)
	options = options or {}
	for i,v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function ZapLib:Tween(obj,goal,callback)
	local t = tweenService:Create(obj,tweenInfo,goal)
	t.Completed:Connect(callback or function()end)
	t:Play()
end

function ZapLib:Create(options)
	options = ZapLib:SetDefaults({
		Name = "ZAP",
		Version = "UI Library V1.0",
		AccentColor = Color3.fromRGB(172, 255, 230)
	}, options or {})
	
	options.AccentColor2 = Color3.fromRGB(options.AccentColor.R*255 - 92,options.AccentColor.G*255 - 92, options.AccentColor.B*255 - 92);
	options.AccentColor3 = Color3.fromRGB(options.AccentColor.R*255 - 100,options.AccentColor.G*255 - 100, options.AccentColor.B*255 - 100);
	options.AccentColor4 = Color3.fromRGB(options.AccentColor.R*255 + 30,options.AccentColor.G*255 + 30, options.AccentColor.B*255 + 30);
	options.LuminantColor = nil
	
	if not (options.AccentColor.R < 100 and options.AccentColor.G < 100 and options.AccentColor.B < 100) then
		options.LuminantColor = Color3.fromRGB(255, 255, 255)
	else options.LuminantColor = Color3.fromRGB(30, 30, 30) end
	
	local UI = {
		CurrentTab = nil
	}
	
	do -- Creation of MainFrame
		-- StarterGui.ZapUIL
		UI["1"] = Instance.new("ScreenGui", runService:IsStudio() and game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") or coreGui);
		UI["1"]["IgnoreGuiInset"] = true;
		UI["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
		UI["1"]["Name"] = [[ZapUIL]];
		
		-- StarterGui.ZapUIL.Main
		UI["2"] = Instance.new("Frame", UI["1"]);
		UI["2"]["ZIndex"] = 0;
		UI["2"]["BorderSizePixel"] = 0;
		UI["2"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		UI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		UI["2"]["Size"] = UDim2.new(0.42, 0, 0.43, 0);
		UI["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		UI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		UI["2"]["Name"] = [[Main]];
		
		UI["ui"] = Instance.new("UISizeConstraint", UI["2"])
		UI["ui"].MinSize = Vector2.new(522,0)
		
		-- StarterGui.ZapUIL.Main.Toolbar
		UI["3"] = Instance.new("Frame", UI["1"]);
		UI["3"]["ZIndex"] = 10;
		UI["3"]["BorderSizePixel"] = 0;
		UI["3"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		UI["3"]["Size"] = UDim2.new(0, 492, 0, 33);
		UI["3"]["Position"] = UDim2.new(0, 390, 0, 220);
		UI["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		UI["3"]["Name"] = [[Toolbar]];
		
		-- StarterGui.ZapUIL.Main.Toolbar.Close
		UI["4"] = Instance.new("ImageLabel", UI["3"]);
		UI["4"]["Active"] = true;
		UI["4"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
		UI["4"]["ZIndex"] = 10;
		UI["4"]["BorderSizePixel"] = 0;
		UI["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		UI["4"]["ImageColor3"] = options.AccentColor;
		UI["4"]["AnchorPoint"] = Vector2.new(1, 0);
		UI["4"]["Image"] = [[rbxassetid://10747384394]];
		UI["4"]["Size"] = UDim2.new(0.75, 0, 0.75, 0);
		UI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		UI["4"]["BackgroundTransparency"] = 1;
		UI["4"]["Selectable"] = true;
		UI["4"]["Name"] = [[Close]];
		UI["4"]["Position"] = UDim2.new(0.985, 0, 0.2, 0);

		-- StarterGui.ZapUIL.Main.Toolbar.UICorner
		UI["5"] = Instance.new("UICorner", UI["3"]);
		UI["5"]["CornerRadius"] = UDim.new(0, 16);

		-- StarterGui.ZapUIL.Main.UICorner
		UI["6"] = Instance.new("UICorner", UI["2"]);
		UI["6"]["CornerRadius"] = UDim.new(0, 16);
	end
	
	do -- Create Nav
		-- StarterGui.ZapUIL.Main.Nav
		UI["7"] = Instance.new("Frame", UI["2"]);
		UI["7"]["ZIndex"] = 11;
		UI["7"]["BorderSizePixel"] = 0;
		UI["7"]["BackgroundColor3"] = options.AccentColor;
		UI["7"]["Size"] = UDim2.new(0, 140, 1, 0);
		UI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		UI["7"]["Name"] = [[Nav]];

		-- StarterGui.ZapUIL.Main.Nav.UICorner
		UI["8"] = Instance.new("UICorner", UI["7"]);
		UI["8"]["CornerRadius"] = UDim.new(0, 16);
		
		-- StarterGui.ZapUIL.Main.Nav.Buttons
		UI["9"] = Instance.new("Frame", UI["7"]);
		UI["9"]["ZIndex"] = 11;
		UI["9"]["BorderSizePixel"] = 0;
		UI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		UI["9"]["Size"] = UDim2.new(1, 0, 0, 282);
		UI["9"]["Position"] = UDim2.new(0, 0, 0.15, 0);
		UI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		UI["9"]["Name"] = [[Buttons]];
		UI["9"]["BackgroundTransparency"] = 1;


		-- StarterGui.ZapUIL.Main.Nav.Buttons.UIListLayout
		UI["a"] = Instance.new("UIListLayout", UI["9"]);
		UI["a"]["Padding"] = UDim.new(0, 1);
		UI["a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		
		do -- UI Information
			-- StarterGui.ZapUIL.Main.Nav.Title
			UI["10"] = Instance.new("TextLabel", UI["7"]);
			UI["10"]["TextWrapped"] = true;
			UI["10"]["ZIndex"] = 11;
			UI["10"]["BorderSizePixel"] = 0;
			UI["10"]["TextScaled"] = true;
			UI["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			UI["10"]["TextSize"] = 35;
			UI["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			UI["10"]["TextColor3"] = options.AccentColor2
			UI["10"]["BackgroundTransparency"] = 1;
			UI["10"]["Size"] = UDim2.new(0, 140, -0.03114, 50);
			UI["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			UI["10"]["Text"] = options["Name"];
			UI["10"]["Name"] = [[Title]];
			
			-- StarterGui.ZapUIL.Main.Nav.DescV
			UI["11"] = Instance.new("TextLabel", UI["7"]);
			UI["11"]["TextWrapped"] = true;
			UI["11"]["ZIndex"] = 11;
			UI["11"]["BorderSizePixel"] = 0;
			UI["11"]["TextScaled"] = true;
			UI["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			UI["11"]["TextSize"] = 35;
			UI["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/Sarpanch.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			UI["11"]["TextColor3"] = options.AccentColor3;
			UI["11"]["BackgroundTransparency"] = 1;
			UI["11"]["Size"] = UDim2.new(0, 140, 0, 10);
			UI["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			UI["11"]["Text"] = options["Version"];
			UI["11"]["Name"] = [[DescV]];
			UI["11"]["Position"] = UDim2.new(0, 0, 0, 33);
		end
	end
	
	do -- Create tab container
		-- StarterGui.ZapUIL.Main.Tab
		UI["12"] = Instance.new("Frame", UI["2"]);
		UI["12"]["BorderSizePixel"] = 0;
		UI["12"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
		UI["12"]["Size"] = UDim2.new(0.725, 0, 1, 0);
		UI["12"]["Position"] = UDim2.new(0.275, 0, 0, 0);
		UI["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		UI["12"]["Name"] = [[Tab]];
		UI["12"]["BackgroundTransparency"] = 1;
	end
	
	do -- Draggable MainFrame
		local root = UI["3"]
		local limbs = UI["2"]

		local dragging
		local dragInput
		local dragStart
		local startPos

		local function update(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			ZapLib:Tween(root, {Position = position})
			ZapLib:Tween(limbs, {Position = position + UDim2.new(0,195+36,0,tonumber(limbs.AbsoluteSize.Y)/2)})
		end

		root.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = root.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		root.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)

		uis.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				if root.Visible then
					update(input)
				end
			end
		end)
	end	

	function UI:CreateTab(tOptions)
		tOptions = ZapLib:SetDefaults({
			Name = "New Tab",
			Icon = "rbxassetid://10734924532"
		}, tOptions or {})
		
		local tab = {
			Hover = false,
			Active = false
		}
		
		do -- Create Tab
			-- StarterGui.ZapUIL.Main.Nav.Buttons.Deselected
			tab["e"] = Instance.new("TextLabel", UI["9"]);
			tab["e"]["TextWrapped"] = true;
			tab["e"]["ZIndex"] = 11;
			tab["e"]["BorderSizePixel"] = 0;
			tab["e"]["TextXAlignment"] = Enum.TextXAlignment.Right;
			tab["e"]["TextTransparency"] = 0.6;
			tab["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			tab["e"]["TextSize"] = 16;
			tab["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			tab["e"]["TextColor3"] = options.LuminantColor;
			tab["e"]["BackgroundTransparency"] = 1;
			tab["e"]["Size"] = UDim2.new(1, -30, 0, 30);
			tab["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			tab["e"]["Text"] = tOptions["Name"];
			tab["e"]["Name"] = tOptions["Name"];


			-- StarterGui.ZapUIL.Main.Nav.Buttons.Deselected.Icon
			tab["f"] = Instance.new("ImageLabel", tab["e"]);
			tab["f"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
			tab["f"]["ZIndex"] = 11;
			tab["f"]["BorderSizePixel"] = 0;
			tab["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			tab["f"]["ImageTransparency"] = 0.6;
			tab["f"]["ImageColor3"] = options.AccentColor2;
			tab["f"]["Image"] = tOptions["Icon"];
			tab["f"]["Size"] = UDim2.new(0, 21, 0, 21);
			tab["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			tab["f"]["BackgroundTransparency"] = 1;
			tab["f"]["Name"] = [[Icon]];
			tab["f"]["Position"] = UDim2.new(1, 6, 0.15, 0);
			
			-- StarterGui.ZapUIL.Main.Nav.Buttons.Deselected.Selection
			tab["d"] = Instance.new("Frame", tab["e"]);
			tab["d"]["ZIndex"] = 11;
			tab["d"]["BorderSizePixel"] = 0;
			tab["d"]["BackgroundColor3"] = options.AccentColor2;
			tab["d"]["Size"] = UDim2.new(0, 5, 0, 30);
			tab["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			tab["d"]["Name"] = [[Selection]];
			tab["d"]["BackgroundTransparency"] = 1;
			
			-- StarterGui.ZapUIL.Main.Tab.Home
			tab["13"] = Instance.new("ScrollingFrame", UI["12"]);
			tab["13"]["ZIndex"] = 0;
			tab["13"]["BorderSizePixel"] = 0;
			tab["13"]["CanvasPosition"] = Vector2.new(0, 0);
			tab["13"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
			tab["13"]["Name"] = tOptions.Name;
			tab["13"]["Selectable"] = false;
			tab["13"]["Size"] = UDim2.new(1, 0, 0.98, 0);
			tab["13"]["Position"] = UDim2.new(0, 0, 0.02, 0);
			tab["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			tab["13"]["ScrollBarThickness"] = 0;
			tab["13"]["BackgroundTransparency"] = 1;
			tab["13"]["Visible"] = false
			
			-- StarterGui.ZapUIL.Main.Tab.Home.UIPadding
			tab["1a"] = Instance.new("UIPadding", tab["13"]);
			tab["1a"]["PaddingTop"] = UDim.new(0, 33);
			tab["1a"]["PaddingRight"] = UDim.new(0, 9);
			tab["1a"]["PaddingLeft"] = UDim.new(0, 6);


			-- StarterGui.ZapUIL.Main.Tab.Home.UIListLayout
			tab["1b"] = Instance.new("UIListLayout", tab["13"]);
			tab["1b"]["Padding"] = UDim.new(0, 8);
			tab["1b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			
			do -- Logic
				function tab:Activate()
					if not tab.Active then
						if UI.CurrentTab ~= nil then
							UI.CurrentTab:Deactivate()
						end
						
						tab.Active = true
						ZapLib:Tween(tab["e"], {TextTransparency = 0})
						ZapLib:Tween(tab["f"], {ImageTransparency = 0})
						ZapLib:Tween(tab["d"], {BackgroundTransparency = 0})
						tab["13"]["Visible"] = true
						UI.CurrentTab = tab
					end
				end
				
				function tab:Deactivate()
					if tab.Active then
						tab.Active = false
						tab.Hover = false
						ZapLib:Tween(tab["e"], {TextTransparency = 0.6})
						ZapLib:Tween(tab["f"], {ImageTransparency = 0.6})
						ZapLib:Tween(tab["d"], {BackgroundTransparency = 1})
						tab["13"]["Visible"] = false
					end
				end
				
				tab["e"].MouseEnter:Connect(function()
					tab.Hover = true

					if not tab.Active then
						ZapLib:Tween(tab["e"], {TextTransparency = 0})
						ZapLib:Tween(tab["f"], {ImageTransparency = 0})
					end
				end)

				tab["e"].MouseLeave:Connect(function()
					tab.Hover = false

					if not tab.Active then
						ZapLib:Tween(tab["e"], {TextTransparency = 0.6})
						ZapLib:Tween(tab["f"], {ImageTransparency = 0.6})
					end
				end)

				uis.InputBegan:Connect(function(io,gpe)
					if gpe then return end

					if io.UserInputType == Enum.UserInputType.MouseButton1 and tab.Hover then
						tab:Activate()
					end
				end)
				
				if UI.CurrentTab == nil then
					tab:Activate()
				end
			end
			
		end
		
		function tab:CreateButton(bOptions)
			bOptions = ZapLib:SetDefaults({
				Name = "New Button",
				callback = function()end
			}, bOptions or {})
			
			local button = {
				Hover = false,
				MouseDown = false
			}
			
			do -- Create button
				-- StarterGui.ZapUIL.Main.Tab.Home.Button
				button["14"] = Instance.new("Frame", tab["13"]);
				button["14"]["BorderSizePixel"] = 0;
				button["14"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				button["14"]["Size"] = UDim2.new(1, 0, 0, 31);
				button["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				button["14"]["Name"] = [[Button]];

				-- StarterGui.ZapUIL.Main.Tab.Home.Button.UICorner
				button["15"] = Instance.new("UICorner", button["14"]);

				-- StarterGui.ZapUIL.Main.Tab.Home.Button.UIStroke
				button["16"] = Instance.new("UIStroke", button["14"]);
				button["16"]["Thickness"] = 2;
				button["16"]["Color"] = Color3.fromRGB(40,40,40);

				-- StarterGui.ZapUIL.Main.Tab.Home.Button.Title
				button["17"] = Instance.new("TextLabel", button["14"]);
				button["17"]["BorderSizePixel"] = 0;
				button["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				button["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				button["17"]["TextSize"] = 16;
				button["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				button["17"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				button["17"]["BackgroundTransparency"] = 1;
				button["17"]["Size"] = UDim2.new(1, -40, 1, 0);
				button["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				button["17"]["Text"] = bOptions.Name;
				button["17"]["Name"] = [[Title]];
				
				-- StarterGui.ZapUIL.Main.Tab.Home.Button.UIPadding
				button["18"] = Instance.new("UIPadding", button["14"]);
				button["18"]["PaddingRight"] = UDim.new(0, 30);
				button["18"]["PaddingLeft"] = UDim.new(0, 10);


				-- StarterGui.ZapUIL.Main.Tab.Home.Button.Icon
				button["19"] = Instance.new("ImageLabel", button["14"]);
				button["19"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
				button["19"]["BorderSizePixel"] = 0;
				button["19"]["BackgroundColor3"] = Color3.fromRGB(83, 123, 110);
				button["19"]["Image"] = [[rbxassetid://10734898355]];
				button["19"]["Size"] = UDim2.new(0, 18, 0, 18);
				button["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				button["19"]["BackgroundTransparency"] = 1;
				button["19"]["Name"] = [[Icon]];
				button["19"]["Position"] = UDim2.new(1, 0, 0, 7);
				
				do -- Methods
					function button:SetText(text)
						button["17"]["Text"] = text
					end
					
					function button:SetCallback(ncallback)
						button.callback = ncallback
					end
				end
				
				do -- Logic
					button["14"].MouseEnter:Connect(function()
						button.Hover = true
						
						ZapLib:Tween(button["16"], {Color = Color3.fromRGB(80,80,80)})
					end)
					
					button["14"].MouseLeave:Connect(function()
						button.Hover = false
						
						if not button.MouseDown then
							ZapLib:Tween(button["16"], {Color = Color3.fromRGB(40,40,40)})
							ZapLib:Tween(button["14"], {BackgroundColor3 = Color3.fromRGB(36,36,36)})
						end
					end)
					
					uis.InputBegan:Connect(function(io,gpe)
						if gpe then return end

						if io.UserInputType == Enum.UserInputType.MouseButton1 and button.Hover then
							ZapLib:Tween(button["14"], {BackgroundColor3 = Color3.fromRGB(50,50,50)})
							ZapLib:Tween(button["16"], {Color = Color3.fromRGB(80,80,80)}) 
							button.MouseDown = true
							bOptions.callback()
						end
					end)
					
					uis.InputEnded:Connect(function(io,gpe)
						if gpe then return end

						if io.UserInputType == Enum.UserInputType.MouseButton1 then
							button.MouseDown = false
							
							if button.Hover then
								ZapLib:Tween(button["14"], {BackgroundColor3 = Color3.fromRGB(36,36,36)})
								ZapLib:Tween(button["16"], {Color = Color3.fromRGB(80,80,80)}) 
							else
								ZapLib:Tween(button["14"], {BackgroundColor3 = Color3.fromRGB(36,36,36)})
								ZapLib:Tween(button["16"], {Color = Color3.fromRGB(40,40,40)})
							end
						end
					end)
				end
			end
		end
		
		function tab:CreateLabel(lOptions)
			lOptions = ZapLib:SetDefaults({
				Text = "Label",
			}, lOptions or {})

			local label = {}

			do -- create Label
				-- StarterGui.ZapUIL.Main.Tab.Home.Label
				label["28"] = Instance.new("Frame", tab["13"]);
				label["28"]["BorderSizePixel"] = 0;
				label["28"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				label["28"]["Size"] = UDim2.new(1, 0, 0, 31);
				label["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				label["28"]["Name"] = [[Label]];

				-- StarterGui.ZapUIL.Main.Tab.Home.Label.UICorner
				label["29"] = Instance.new("UICorner", label["28"]);

				-- StarterGui.ZapUIL.Main.Tab.Home.Label.UIStroke
				label["2a"] = Instance.new("UIStroke", label["28"]);
				label["2a"]["Thickness"] = 2;
				label["2a"]["Color"] = Color3.fromRGB(61, 61, 61);

				-- StarterGui.ZapUIL.Main.Tab.Home.Label.Title
				label["2b"] = Instance.new("TextLabel", label["28"]);
				label["2b"]["BorderSizePixel"] = 0;
				label["2b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				label["2b"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				label["2b"]["TextWrapped"] = true;
				label["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				label["2b"]["TextSize"] = 16;
				label["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				label["2b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				label["2b"]["BackgroundTransparency"] = 1;
				label["2b"]["Size"] = UDim2.new(1.07714, 0, 0, 15);
				label["2b"]["Position"] = UDim2.new(0,0,0,7)
				label["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				label["2b"]["Name"] = [[Title]];
				label["2b"]["Text"] = lOptions.Text

				-- StarterGui.ZapUIL.Main.Tab.Home.Label.UIPadding
				label["2c"] = Instance.new("UIPadding", label["28"]);
				label["2c"]["PaddingRight"] = UDim.new(0, 30);
				label["2c"]["PaddingLeft"] = UDim.new(0, 10);

				do -- Methods
					function label:Update()
						label["2b"]["Size"] = UDim2.new(label["2b"]["Size"]["X"]["Scale"], label["2b"]["Size"]["X"]["Offset"], 0, math.huge)
						label["2b"]["Size"] = UDim2.new(label["2b"]["Size"]["X"]["Scale"], label["2b"]["Size"]["X"]["Offset"], 0, label["2b"]["TextBounds"]["Y"])
						ZapLib:Tween(label["28"], {Size = UDim2.new(label["28"]["Size"]["X"]["Scale"], label["28"]["Size"]["X"]["Offset"], 0, label["2b"]["TextBounds"]["Y"] + 14)})
					end

					function label:SetText(text)
						label["2b"]["Text"] = text
						label:Update()
					end
				end


			end

			label:Update()

			return label
		end
		
		function tab:CreateWarning(lOptions)
			lOptions = ZapLib:SetDefaults({
				Text = "Warning",
			}, lOptions or {})

			local warning = {}

			do -- create Label
				-- StarterGui.ZapUIL.Main.Tab.Home.Warning
				warning["22"] = Instance.new("Frame", tab["13"]);
				warning["22"]["BorderSizePixel"] = 0;
				warning["22"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				warning["22"]["Size"] = UDim2.new(1, 0, 0, 31);
				warning["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				warning["22"]["Name"] = [[Warning]];


				-- StarterGui.ZapUIL.Main.Tab.Home.Warning.UICorner
				warning["23"] = Instance.new("UICorner", warning["22"]);

				-- StarterGui.ZapUIL.Main.Tab.Home.Warning.UIStroke
				warning["24"] = Instance.new("UIStroke", warning["22"]);
				warning["24"]["Thickness"] = 2;
				warning["24"]["Color"] = Color3.fromRGB(123, 68, 0);


				-- StarterGui.ZapUIL.Main.Tab.Home.Warning.Title
				warning["25"] = Instance.new("TextLabel", warning["22"]);
				warning["25"]["BorderSizePixel"] = 0;
				warning["25"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				warning["25"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				warning["25"]["TextWrapped"] = true;
				warning["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				warning["25"]["TextSize"] = 16;
				warning["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				warning["25"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				warning["25"]["BackgroundTransparency"] = 1;
				warning["25"]["Size"] = UDim2.new(1, 0, 0, 15);
				warning["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				warning["25"]["Text"] = lOptions.Text;
				warning["25"]["Name"] = [[Title]];
				warning["25"]["Position"] = UDim2.new(0, 25, 0, 7);


				-- StarterGui.ZapUIL.Main.Tab.Home.Warning.UIPadding
				warning["26"] = Instance.new("UIPadding", warning["22"]);
				warning["26"]["PaddingRight"] = UDim.new(0, 30);
				warning["26"]["PaddingLeft"] = UDim.new(0, 10);


				-- StarterGui.ZapUIL.Main.Tab.Home.Warning.Icon
				warning["27"] = Instance.new("ImageLabel", warning["22"]);
				warning["27"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
				warning["27"]["BorderSizePixel"] = 0;
				warning["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				warning["27"]["ImageColor3"] = Color3.fromRGB(204, 109, 0);
				warning["27"]["Image"] = [[rbxassetid://10723415903]];
				warning["27"]["Size"] = UDim2.new(0, 18, 0, 18);
				warning["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				warning["27"]["BackgroundTransparency"] = 1;
				warning["27"]["Name"] = [[Icon]];
				warning["27"]["Position"] = UDim2.new(0, 0, 0, 7);

				do -- Methods
					function warning:Update()
						warning["25"]["Size"] = UDim2.new(warning["25"]["Size"]["X"]["Scale"], warning["25"]["Size"]["X"]["Offset"], 0, math.huge)
						warning["25"]["Size"] = UDim2.new(warning["25"]["Size"]["X"]["Scale"], warning["25"]["Size"]["X"]["Offset"], 0, warning["25"]["TextBounds"]["Y"])
						ZapLib:Tween(warning["22"], {Size = UDim2.new(warning["22"]["Size"]["X"]["Scale"], warning["22"]["Size"]["X"]["Offset"], 0, warning["25"]["TextBounds"]["Y"] + 14)})
					end

					function warning:SetText(text)
						warning["25"]["Text"] = text
						warning:Update()
					end
				end


			end

			warning:Update()

			return warning
		end
		
		function tab:CreateInfo(lOptions)
			lOptions = ZapLib:SetDefaults({
				Text = "Info",
			}, lOptions or {})

			local info = {}

			do -- create Label
				-- StarterGui.ZapUIL.Main.Tab.Home.Warning
				info["22"] = Instance.new("Frame", tab["13"]);
				info["22"]["BorderSizePixel"] = 0;
				info["22"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				info["22"]["Size"] = UDim2.new(1, 0, 0, 31);
				info["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				info["22"]["Name"] = [[Info]];


				-- StarterGui.ZapUIL.Main.Tab.Home.Warning.UICorner
				info["23"] = Instance.new("UICorner", info["22"]);

				-- StarterGui.ZapUIL.Main.Tab.Home.Warning.UIStroke
				info["24"] = Instance.new("UIStroke", info["22"]);
				info["24"]["Thickness"] = 2;
				info["24"]["Color"] = Color3.fromRGB(77, 71, 123);


				-- StarterGui.ZapUIL.Main.Tab.Home.Warning.Title
				info["25"] = Instance.new("TextLabel", info["22"]);
				info["25"]["BorderSizePixel"] = 0;
				info["25"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				info["25"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				info["25"]["TextWrapped"] = true;
				info["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				info["25"]["TextSize"] = 16;
				info["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				info["25"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				info["25"]["BackgroundTransparency"] = 1;
				info["25"]["Size"] = UDim2.new(1, 0, 0, 15);
				info["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				info["25"]["Text"] = lOptions.Text;
				info["25"]["Name"] = [[Title]];
				info["25"]["Position"] = UDim2.new(0, 25, 0, 7);


				-- StarterGui.ZapUIL.Main.Tab.Home.Warning.UIPadding
				info["26"] = Instance.new("UIPadding", info["22"]);
				info["26"]["PaddingRight"] = UDim.new(0, 30);
				info["26"]["PaddingLeft"] = UDim.new(0, 10);


				-- StarterGui.ZapUIL.Main.Tab.Home.Warning.Icon
				info["27"] = Instance.new("ImageLabel", info["22"]);
				info["27"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
				info["27"]["BorderSizePixel"] = 0;
				info["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				info["27"]["ImageColor3"] = Color3.fromRGB(128, 119, 207);
				info["27"]["Image"] = [[rbxassetid://10723415903]];
				info["27"]["Size"] = UDim2.new(0, 18, 0, 18);
				info["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				info["27"]["BackgroundTransparency"] = 1;
				info["27"]["Name"] = [[Icon]];
				info["27"]["Position"] = UDim2.new(0, 0, 0, 7);

				do -- Methods
					function info:Update()
						info["25"]["Size"] = UDim2.new(info["25"]["Size"]["X"]["Scale"], info["25"]["Size"]["X"]["Offset"], 0, math.huge)
						info["25"]["Size"] = UDim2.new(info["25"]["Size"]["X"]["Scale"], info["25"]["Size"]["X"]["Offset"], 0, info["25"]["TextBounds"]["Y"])
						ZapLib:Tween(info["22"], {Size = UDim2.new(info["22"]["Size"]["X"]["Scale"], info["22"]["Size"]["X"]["Offset"], 0, info["25"]["TextBounds"]["Y"] + 14)})
					end

					function info:SetText(text)
						info["25"]["Text"] = text
						info:Update()
					end
				end


			end

			info:Update()

			return info
		end
		
		function tab:CreateSlider(sOptions)
			sOptions = ZapLib:SetDefaults({
				Name = "New Slider",
				Min = 0,
				Max = 50,
				Default = 25,
				callback = function() end,
			}, sOptions or {})
			
			local slider = {
				Hover = false,
				MouseDown = false,
				Connection = nil,
				Options = sOptions
			}
			
			do -- make slider
				do -- Slider stuff
					-- StarterGui.ZapUIL.Main.Tab.Home.Slider
					slider["3f"] = Instance.new("Frame", tab["13"]);
					slider["3f"]["BorderSizePixel"] = 0;
					slider["3f"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
					slider["3f"]["Size"] = UDim2.new(1, 0, 0.03327, 31);
					slider["3f"]["Position"] = UDim2.new(0, 0, 0.28694, 0);
					slider["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					slider["3f"]["Name"] = [[Slider]];


					-- StarterGui.ZapUIL.Main.Tab.Home.Slider.UICorner
					slider["40"] = Instance.new("UICorner", slider["3f"]);



					-- StarterGui.ZapUIL.Main.Tab.Home.Slider.UIStroke
					slider["41"] = Instance.new("UIStroke", slider["3f"]);
					slider["41"]["Thickness"] = 2;
					slider["41"]["Color"] = Color3.fromRGB(61, 61, 61);


					-- StarterGui.ZapUIL.Main.Tab.Home.Slider.Title
					slider["42"] = Instance.new("TextLabel", slider["3f"]);
					slider["42"]["BorderSizePixel"] = 0;
					slider["42"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					slider["42"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					slider["42"]["TextSize"] = 16;
					slider["42"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					slider["42"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					slider["42"]["BackgroundTransparency"] = 1;
					slider["42"]["Size"] = UDim2.new(1, -40, 0, 30);
					slider["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					slider["42"]["Text"] = [[Slider]];
					slider["42"]["Name"] = [[Title]];


					-- StarterGui.ZapUIL.Main.Tab.Home.Slider.UIPadding
					slider["43"] = Instance.new("UIPadding", slider["3f"]);
					slider["43"]["PaddingRight"] = UDim.new(0, 30);
					slider["43"]["PaddingLeft"] = UDim.new(0, 10);


					-- StarterGui.ZapUIL.Main.Tab.Home.Slider.SliderBg
					slider["44"] = Instance.new("Frame", slider["3f"]);
					slider["44"]["BorderSizePixel"] = 0;
					slider["44"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
					slider["44"]["Size"] = UDim2.new(0, 345, 0, 16);
					slider["44"]["Position"] = UDim2.new(0, 0, 0.5753, 0);
					slider["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					slider["44"]["Name"] = [[SliderBg]];


					-- StarterGui.ZapUIL.Main.Tab.Home.Slider.SliderBg.UICorner
					slider["45"] = Instance.new("UICorner", slider["44"]);



					-- StarterGui.ZapUIL.Main.Tab.Home.Slider.SliderBg.UIStroke
					slider["46"] = Instance.new("UIStroke", slider["44"]);
					slider["46"]["Thickness"] = 2;
					slider["46"]["Color"] = Color3.fromRGB(61, 61, 61);


					-- StarterGui.ZapUIL.Main.Tab.Home.Slider.SliderBg.Drag
					slider["47"] = Instance.new("Frame", slider["44"]);
					slider["47"]["BorderSizePixel"] = 0;
					slider["47"]["BackgroundColor3"] = options.AccentColor;
					slider["47"]["Size"] = UDim2.new(0.68696, 0, 1, 0);
					slider["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					slider["47"]["Name"] = [[Drag]];


					-- StarterGui.ZapUIL.Main.Tab.Home.Slider.SliderBg.Drag.UICorner
					slider["48"] = Instance.new("UICorner", slider["47"]);



					-- StarterGui.ZapUIL.Main.Tab.Home.Slider.SliderBg.Max
					slider["49"] = Instance.new("TextLabel", slider["44"]);
					slider["49"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
					slider["49"]["BorderSizePixel"] = 0;
					slider["49"]["TextXAlignment"] = Enum.TextXAlignment.Right;
					slider["49"]["TextTransparency"] = 0.7;
					slider["49"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					slider["49"]["TextSize"] = 12;
					slider["49"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					slider["49"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					slider["49"]["BackgroundTransparency"] = 1;
					slider["49"]["Size"] = UDim2.new(0, 52, 0, 22);
					slider["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					slider["49"]["Text"] = tostring(sOptions.Max);
					slider["49"]["Name"] = [[Max]];
					slider["49"]["Position"] = UDim2.new(0.82128, 0, -0.5, 5);


					-- StarterGui.ZapUIL.Main.Tab.Home.Slider.Value
					slider["4a"] = Instance.new("TextBox", slider["3f"]);
					slider["4a"]["CursorPosition"] = -1;
					slider["4a"]["Active"] = false;
					slider["4a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					slider["4a"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
					slider["4a"]["BorderSizePixel"] = 0;
					slider["4a"]["TextXAlignment"] = Enum.TextXAlignment.Right;
					slider["4a"]["TextSize"] = 16;
					slider["4a"]["Name"] = [[Value]];
					slider["4a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					slider["4a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					slider["4a"]["Selectable"] = false;
					slider["4a"]["Size"] = UDim2.new(0, 62, 0, 22);
					slider["4a"]["Position"] = UDim2.new(0.87635, 0, 0, 5);
					slider["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					slider["4a"]["Text"] = tostring(sOptions.Default);
					slider["4a"]["BackgroundTransparency"] = 1;
				end
				
				do -- Methods
					function slider:GetValue()
						return tonumber(slider["4a"]["Text"])
					end
					
					function slider:SetValue(v)
						if v == nil then
							local percentage = math.clamp((mouse.X - slider["3f"].AbsolutePosition.X) / (slider["3f"].AbsoluteSize.X), 0, 1)
							local value = math.floor(((sOptions.Max - sOptions.Min) * percentage) + sOptions.Min)
							slider["4a"].Text = tostring(value)
							slider["47"].Size = UDim2.fromScale(percentage, 1)
						else
							v = math.clamp(v, sOptions.Min, sOptions.Max)
							slider["4a"].Text = tostring(v)
							slider["47"].Size = UDim2.fromScale((v - sOptions.Min) / (sOptions.Max - sOptions.Min), 1)
						end
					end
				end

				do -- Logic
					slider:SetValue(sOptions.Default)
					
					slider["3f"].MouseEnter:Connect(function()
						slider.Hover = true

						ZapLib:Tween(slider["46"], {Color = Color3.fromRGB(80,80,80)})
					end)

					slider["3f"].MouseLeave:Connect(function()
						slider.Hover = false

						if not slider.MouseDown then
							ZapLib:Tween(slider["46"], {Color = Color3.fromRGB(40,40,40)})
							ZapLib:Tween(slider["3f"], {BackgroundColor3 = Color3.fromRGB(36,36,36)})
						end
					end)
					
					slider["4a"].FocusLost:Connect(function()
						slider:SetValue(slider["4a"].Text)
					end)

					uis.InputBegan:Connect(function(io,gpe)
						if gpe then return end

						if io.UserInputType == Enum.UserInputType.MouseButton1 and slider.Hover then
							ZapLib:Tween(slider["47"], {BackgroundColor3 = options.AccentColor4})
							ZapLib:Tween(slider["46"], {Color = Color3.fromRGB(80,80,80)}) 
							slider.MouseDown = true
							
							if not slider.Connection then
								slider.Connection = runService.RenderStepped:Connect(function()
									slider:SetValue()
								end)
							end
						end
					end)

					uis.InputEnded:Connect(function(io,gpe)
						if gpe then return end

						if io.UserInputType == Enum.UserInputType.MouseButton1 then
							slider.MouseDown = false

							if slider.Hover then
								ZapLib:Tween(slider["47"], {BackgroundColor3 = options.AccentColor})
								ZapLib:Tween(slider["46"], {Color = Color3.fromRGB(80,80,80)}) 
							else
								ZapLib:Tween(slider["47"], {BackgroundColor3 = options.AccentColor})
								ZapLib:Tween(slider["46"], {Color = Color3.fromRGB(40,40,40)})
							end
							
							if slider.Connection then slider.Connection:Disconnect() end
							slider.Connection = nil
						end
					end)
				end
			end
			
			return slider
		end
		
		function tab:CreateToggle(tOptions)
			tOptions = ZapLib:SetDefaults({
				Name = "New Toggle",
				Default = false,
				callback = function()end
			}, tOptions or {})

			local toggle = {
				Hover = false,
				MouseDown = false,
				State = false,
			}

			do -- Create button
				-- StarterGui.ZapUIL.Main.Tab.Home.ToggleOff
				toggle["36"] = Instance.new("Frame", tab["13"]);
				toggle["36"]["BorderSizePixel"] = 0;
				toggle["36"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				toggle["36"]["Size"] = UDim2.new(1, 0, 0, 31);
				toggle["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				toggle["36"]["Name"] = [[Toggle]];


				-- StarterGui.ZapUIL.Main.Tab.Home.ToggleOff.UICorner
				toggle["37"] = Instance.new("UICorner", toggle["36"]);



				-- StarterGui.ZapUIL.Main.Tab.Home.ToggleOff.UIStroke
				toggle["38"] = Instance.new("UIStroke", toggle["36"]);
				toggle["38"]["Thickness"] = 2;
				toggle["38"]["Color"] = Color3.fromRGB(61, 61, 61);


				-- StarterGui.ZapUIL.Main.Tab.Home.ToggleOff.Title
				toggle["39"] = Instance.new("TextLabel", toggle["36"]);
				toggle["39"]["BorderSizePixel"] = 0;
				toggle["39"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				toggle["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				toggle["39"]["TextSize"] = 16;
				toggle["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				toggle["39"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				toggle["39"]["BackgroundTransparency"] = 1;
				toggle["39"]["Size"] = UDim2.new(1, -40, 1, 0);
				toggle["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				toggle["39"]["Text"] = tOptions.Name;
				toggle["39"]["Name"] = [[Title]];


				-- StarterGui.ZapUIL.Main.Tab.Home.ToggleOff.UIPadding
				toggle["3a"] = Instance.new("UIPadding", toggle["36"]);
				toggle["3a"]["PaddingRight"] = UDim.new(0, 30);
				toggle["3a"]["PaddingLeft"] = UDim.new(0, 10);


				-- StarterGui.ZapUIL.Main.Tab.Home.ToggleOff.Holder
				toggle["3b"] = Instance.new("Frame", toggle["36"]);
				toggle["3b"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
				toggle["3b"]["BorderSizePixel"] = 0;
				toggle["3b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
				toggle["3b"]["Size"] = UDim2.new(0, 22, 0, 22);
				toggle["3b"]["Position"] = UDim2.new(1, 0, 0, 5);
				toggle["3b"]["BorderColor3"] = Color3.fromRGB(10, 10, 10);
				toggle["3b"]["Name"] = [[Holder]];


				-- StarterGui.ZapUIL.Main.Tab.Home.ToggleOff.Holder.UICorner
				toggle["3c"] = Instance.new("UICorner", toggle["3b"]);

				-- StarterGui.ZapUIL.Main.Tab.Home.ToggleOff.Holder.Enabled
				toggle["3d"] = Instance.new("Frame", toggle["3b"]);
				toggle["3d"]["Visible"] = true;
				toggle["3d"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
				toggle["3d"]["BorderSizePixel"] = 0;
				toggle["3d"]["BackgroundColor3"] = Color3.fromRGB(173, 255, 231);
				toggle["3d"]["Size"] = UDim2.new(0.85, 0, 0.8, 0);
				toggle["3d"]["Position"] = UDim2.new(0, 2, 0, 2);
				toggle["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				toggle["3d"]["Name"] = [[Enabled]];
				toggle["3d"]["BackgroundTransparency"] = 1;


				-- StarterGui.ZapUIL.Main.Tab.Home.ToggleOff.Holder.Enabled.UICorner
				toggle["3e"] = Instance.new("UICorner", toggle["3d"]);
				toggle["3e"]["CornerRadius"] = UDim.new(0, 6);

				do -- Methods
					function toggle:Toggle(b)
						if b == nil then
							toggle.State = not toggle.State
						else
							toggle.State = b
						end
						
						if toggle.State then
							ZapLib:Tween(toggle["3d"], {BackgroundTransparency = 0})
						else
							ZapLib:Tween(toggle["3d"], {BackgroundTransparency = 1})
						end
						
						tOptions.callback(toggle.State)
					end

					function toggle:SetCallback(ncallback)
						toggle.callback = ncallback
					end
				end

				do -- Logic
					toggle["3b"].MouseEnter:Connect(function()
						toggle.Hover = true

						ZapLib:Tween(toggle["3b"], {BackgroundColor3 = Color3.fromRGB(30,30,30)})
					end)

					toggle["3b"].MouseLeave:Connect(function()
						toggle.Hover = false

						if not toggle.MouseDown then
							ZapLib:Tween(toggle["3b"], {BackgroundColor3 = Color3.fromRGB(10,10,10)})
						end
					end)

					uis.InputBegan:Connect(function(io,gpe)
						if gpe then return end

						if io.UserInputType == Enum.UserInputType.MouseButton1 and toggle.Hover then
							ZapLib:Tween(toggle["3b"], {BackgroundColor3 = Color3.fromRGB(30,30,30)})
							toggle.MouseDown = true
							toggle:Toggle()
						end
					end)

					uis.InputEnded:Connect(function(io,gpe)
						if gpe then return end

						if io.UserInputType == Enum.UserInputType.MouseButton1 then
							toggle.MouseDown = false

							if toggle.Hover then
								ZapLib:Tween(toggle["3b"], {BackgroundColor3 = Color3.fromRGB(10,10,10)})
							else
								ZapLib:Tween(toggle["3b"], {BackgroundColor3 = Color3.fromRGB(30,30,30)})
							end
						end
					end)
				end
			end
			
			return toggle
		end		
		
		function tab:CreateDropdown(dOptions)
			dOptions = ZapLib:SetDefaults({
				Name = "New Dropdown",
				Items = {},
				DefaultSelection = nil,
				callback = function()end
			}, dOptions or {})
			
			local dropdown = {
				Items = {
					['bitch'] = {
						'111value111'
					}
				},
				Open = false,
				Hover = false,
				MouseDown = false,
				Selection = nil
			}
			
			do -- dropdown stuff
				-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown
				dropdown["4b"] = Instance.new("Frame", tab["13"]);
				dropdown["4b"]["BorderSizePixel"] = 0;
				dropdown["4b"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				dropdown["4b"]["ClipsDescendants"] = true;
				dropdown["4b"]["Size"] = UDim2.new(1, 0, 0, 66);
				dropdown["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				dropdown["4b"]["Name"] = [[Dropdown]];


				-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.UICorner
				dropdown["4c"] = Instance.new("UICorner", dropdown["4b"]);

				-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.UIStroke
				dropdown["4d"] = Instance.new("UIStroke", dropdown["4b"]);
				dropdown["4d"]["Thickness"] = 2;
				dropdown["4d"]["Color"] = Color3.fromRGB(61, 61, 61);


				-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.Title
				dropdown["4e"] = Instance.new("TextLabel", dropdown["4b"]);
				dropdown["4e"]["BorderSizePixel"] = 0;
				dropdown["4e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				dropdown["4e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				dropdown["4e"]["TextSize"] = 16;
				dropdown["4e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				dropdown["4e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				dropdown["4e"]["BackgroundTransparency"] = 1;
				dropdown["4e"]["Size"] = UDim2.new(1, -40, 0, 31);
				dropdown["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				dropdown["4e"]["Text"] = dOptions.Name;
				dropdown["4e"]["Name"] = [[Title]];


				-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.UIPadding
				dropdown["4f"] = Instance.new("UIPadding", dropdown["4b"]);
				dropdown["4f"]["PaddingRight"] = UDim.new(0, 30);
				dropdown["4f"]["PaddingLeft"] = UDim.new(0, 10);


				-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.Icon
				dropdown["50"] = Instance.new("ImageLabel", dropdown["4b"]);
				dropdown["50"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
				dropdown["50"]["BorderSizePixel"] = 0;
				dropdown["50"]["BackgroundColor3"] = Color3.fromRGB(83, 123, 110);
				dropdown["50"]["Image"] = [[rbxassetid://10709790948]];
				dropdown["50"]["Size"] = UDim2.new(0, 18, 0, 18);
				dropdown["50"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				dropdown["50"]["BackgroundTransparency"] = 1;
				dropdown["50"]["Name"] = [[Icon]];
				dropdown["50"]["Position"] = UDim2.new(1, 0, 0, 7);


				-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.Options
				dropdown["51"] = Instance.new("Frame", dropdown["4b"]);
				dropdown["51"]["Visible"] = false;
				dropdown["51"]["BorderSizePixel"] = 0;
				dropdown["51"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				dropdown["51"]["Size"] = UDim2.new(0, 344, 0, 71);
				dropdown["51"]["Position"] = UDim2.new(0, 0, 0, 32);
				dropdown["51"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				dropdown["51"]["Name"] = [[Options]];
				dropdown["51"]["BackgroundTransparency"] = 1;
				dropdown["51"]["AutomaticSize"] = Enum.AutomaticSize.XY;
				
				-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.OptionSelected
				dropdown["5c"] = Instance.new("TextLabel", dropdown["4b"]);
				dropdown["5c"]["BorderSizePixel"] = 0;
				dropdown["5c"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
				dropdown["5c"]["TextSize"] = 16;
				dropdown["5c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				dropdown["5c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				dropdown["5c"]["Size"] = UDim2.new(1.05564, 0, 0, 20);
				dropdown["5c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				dropdown["5c"]["Text"] = "";
				dropdown["5c"]["Name"] = [[OptionSelected]];
				dropdown["5c"]["Position"] = UDim2.new(0, 0, 0.53641, 0);


				-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.OptionSelected.UICorner
				dropdown["5d"] = Instance.new("UICorner", dropdown["5c"]);

				-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.OptionSelected.UIStroke
				dropdown["5e"] = Instance.new("UIStroke", dropdown["5c"]);
				dropdown["5e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				dropdown["5e"]["Thickness"] = 2;
				dropdown["5e"]["Color"] = options.AccentColor;
				
				-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.Options.UIListLayout
				dropdown["55"] = Instance.new("UIListLayout", dropdown["51"]);
				dropdown["55"]["Padding"] = UDim.new(0, 5);
				dropdown["55"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
				
				do -- Methods
					function dropdown:Add(id, value)
						local item = {
							Hover = false,
							MouseDown = false
						}
						
						if dropdown["5c"]["Text"] == "" or dropdown.Selection == nil then
							dropdown.Selection = id
							dropdown["5c"]["Text"] = dropdown.Selection
						end
						
						dropdown.Items[id] = {
							instance = {},
							value = value,
						}
						
						-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.Options.Option
						dropdown.Items[id].instance["52"] = Instance.new("TextLabel", dropdown["51"]);
						dropdown.Items[id].instance["52"]["BorderSizePixel"] = 0;
						dropdown.Items[id].instance["52"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
						dropdown.Items[id].instance["52"]["TextSize"] = 16;
						dropdown.Items[id].instance["52"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						dropdown.Items[id].instance["52"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						dropdown.Items[id].instance["52"]["Size"] = UDim2.new(1, 0, 0, 20);
						dropdown.Items[id].instance["52"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						dropdown.Items[id].instance["52"]["Text"] = id;
						dropdown.Items[id].instance["52"]["Name"] = [[Option]];

						-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.Options.Option.UICorner
						dropdown.Items[id].instance["53"] = Instance.new("UICorner", dropdown.Items[id].instance["52"]);

						-- StarterGui.ZapUIL.Main.Tab.Home.Dropdown.Options.Option.UIStroke
						dropdown.Items[id].instance["54"] = Instance.new("UIStroke", dropdown.Items[id].instance["52"]);
						dropdown.Items[id].instance["54"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
						dropdown.Items[id].instance["54"]["Thickness"] = 2;
						dropdown.Items[id].instance["54"]["Color"] = Color3.fromRGB(61, 61, 61);
						
						do -- Logic
							dropdown.Items[id].instance['52'].MouseEnter:Connect(function()
								item.Hover = true
								dropdown.MouseDown = false
								
								if dropdown.Selection == dropdown.Items[id].instance['52']["Text"] then
									ZapLib:Tween(dropdown.Items[id].instance["54"], {Color = options.AccentColor4})
								else
									ZapLib:Tween(dropdown.Items[id].instance["54"], {Color = Color3.fromRGB(80,80,80)})
								end
							end)

							dropdown.Items[id].instance['52'].MouseLeave:Connect(function()
								item.Hover = false
								dropdown.MouseDown = false

								if not dropdown.MouseDown then
									ZapLib:Tween(dropdown.Items[id].instance["54"], {Color = Color3.fromRGB(61,61,61)})
									if dropdown.Selection == dropdown.Items[id].instance['52']["Text"] then
										ZapLib:Tween(dropdown.Items[id].instance["54"], {Color = options.AccentColor})
									else
										ZapLib:Tween(dropdown.Items[id].instance["52"], {BackgroundColor3 = Color3.fromRGB(21,21,21)})
									end
								end
							end)

							uis.InputBegan:Connect(function(io,gpe)
								if gpe then return end

								if io.UserInputType == Enum.UserInputType.MouseButton1 and item.Hover then
									ZapLib:Tween(dropdown.Items[id].instance['52'], {BackgroundColor3 = Color3.fromRGB(50,50,50)})
									ZapLib:Tween(dropdown.Items[id].instance["54"], {Color = Color3.fromRGB(80,80,80)}) 
									item.MouseDown = true
									dropdown.MouseDown = false
									dOptions.callback(id, value)
									dropdown.Selection = id
									dropdown["5c"]["Text"] = dropdown.Selection
								end
							end)

							uis.InputEnded:Connect(function(io,gpe)
								if gpe then return end
								if dropdown.Items[id] == nil then return end

								if io.UserInputType == Enum.UserInputType.MouseButton1 then
									item.MouseDown = false
									dropdown.MouseDown = false
									if item.Hover then
										ZapLib:Tween(dropdown.Items[id].instance['52'], {BackgroundColor3 = Color3.fromRGB(21,21,21)})
										if dropdown.Selection == dropdown.Items[id].instance['52']["Text"] then 
											ZapLib:Tween(dropdown.Items[id].instance["54"], {Color = options.AccentColor})
										else
											ZapLib:Tween(dropdown.Items[id].instance["54"], {Color = Color3.fromRGB(80,80,80)}) 
										end
									else
										ZapLib:Tween(dropdown.Items[id].instance['52'], {BackgroundColor3 = Color3.fromRGB(21,21,21)})
										if dropdown.Selection == dropdown.Items[id].instance['52']["Text"] then 
											ZapLib:Tween(dropdown.Items[id].instance["54"], {Color = options.AccentColor})
										else
											ZapLib:Tween(dropdown.Items[id].instance["54"], {Color = Color3.fromRGB(61,61,61)})
										end
									end
								end
							end)
						end
					end
					
					function dropdown:Remove(id)
						if dropdown.Items[id] ~= nil and dropdown.Items[id].instance ~= nil then
							for i, v in pairs(dropdown.Items[id].instance) do
								v:Destroy()
							end
							dropdown.Items[id] = nil
						end
					end
					
					function dropdown:Clear()
						for i, v in pairs(dropdown.Items) do
							dropdown:Remove(i)
						end
					end
					
					function dropdown:Toggle()
						if dropdown.Open then
							ZapLib:Tween(dropdown["4b"], {Size = UDim2.new(1,0,0,60)}, function()
								dropdown["51"]["Visible"] = false
								dropdown["5c"]["Visible"] = true
							end)
						else
							local count = 0
							for i, v in pairs(dropdown.Items) do
								if v ~= nil then
									count += 1
								end
							end
							
							dropdown["51"]["Visible"] = true
							dropdown["5c"]["Visible"] = false
							ZapLib:Tween(dropdown["4b"], {Size = UDim2.new(1,0,0,40+(20*count)+1)})
						end
						dropdown.Open = not dropdown.Open
					end
				end
				
				do -- Logic
					dropdown["4b"].MouseEnter:Connect(function()
						dropdown.Hover = true

						ZapLib:Tween(dropdown["4d"], {Color = Color3.fromRGB(80,80,80)})
					end)

					dropdown["4b"].MouseLeave:Connect(function()
						dropdown.Hover = false

						if not dropdown.MouseDown then
							ZapLib:Tween(dropdown["4d"], {Color = Color3.fromRGB(40,40,40)})
							ZapLib:Tween(dropdown["4b"], {BackgroundColor3 = Color3.fromRGB(36,36,36)})
						end
					end)

					uis.InputBegan:Connect(function(io,gpe)
						if gpe then return end

						if io.UserInputType == Enum.UserInputType.MouseButton1 and dropdown.Hover then
							ZapLib:Tween(dropdown["4b"], {BackgroundColor3 = Color3.fromRGB(50,50,50)})
							ZapLib:Tween(dropdown["4d"], {Color = Color3.fromRGB(80,80,80)}) 
							dropdown.MouseDown = true
							dropdown:Toggle()
						end
					end)

					uis.InputEnded:Connect(function(io,gpe)
						if gpe then return end

						if io.UserInputType == Enum.UserInputType.MouseButton1 then
							dropdown.MouseDown = false

							if dropdown.Hover then
								ZapLib:Tween(dropdown["4b"], {BackgroundColor3 = Color3.fromRGB(36,36,36)})
								ZapLib:Tween(dropdown["4d"], {Color = Color3.fromRGB(80,80,80)}) 
							else
								ZapLib:Tween(dropdown["4b"], {BackgroundColor3 = Color3.fromRGB(36,36,36)})
								ZapLib:Tween(dropdown["4d"], {Color = Color3.fromRGB(40,40,40)})
							end
						end
					end)
				end
				
			end
			
			return dropdown
		end
		
		function tab:CreateTextbox(tbOptions)
			tbOptions = ZapLib:SetDefaults({
				Name = "New Textbox",
				DefaultValue = "Hello!",
				Datatype = "",
				callback = function()end
			}, tbOptions or {})
			
			tbOptions.Datatype = typeof(tbOptions.DefaultValue)

			local textbox = {
				Hover = false,
				MouseDown = false,
				Value = tbOptions.DefaultValue,
			}

			do -- Create button
				-- StarterGui.ZapUIL.Main.Tab.Home.Textbox
				textbox["5f"] = Instance.new("Frame", tab["13"]);
				textbox["5f"]["BorderSizePixel"] = 0;
				textbox["5f"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				textbox["5f"]["Size"] = UDim2.new(1, 0, 0.033, 42);
				textbox["5f"]["Position"] = UDim2.new(0, 0, 0.28694, 0);
				textbox["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				textbox["5f"]["Name"] = [[Textbox]];
				
				-- StarterGui.ZapUIL.Main.Tab.Home.Textbox.UICorner
				textbox["60"] = Instance.new("UICorner", textbox["5f"]);

				-- StarterGui.ZapUIL.Main.Tab.Home.Textbox.UIStroke
				textbox["61"] = Instance.new("UIStroke", textbox["5f"]);
				textbox["61"]["Thickness"] = 2;
				textbox["61"]["Color"] = Color3.fromRGB(61, 61, 61);

				-- StarterGui.ZapUIL.Main.Tab.Home.Textbox.Title
				textbox["62"] = Instance.new("TextLabel", textbox["5f"]);
				textbox["62"]["BorderSizePixel"] = 0;
				textbox["62"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				textbox["62"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				textbox["62"]["TextSize"] = 16;
				textbox["62"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				textbox["62"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				textbox["62"]["BackgroundTransparency"] = 1;
				textbox["62"]["Size"] = UDim2.new(1, -40, 0, 30);
				textbox["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				textbox["62"]["Text"] = [[Textbox]];
				textbox["62"]["Name"] = [[Title]];

				-- StarterGui.ZapUIL.Main.Tab.Home.Textbox.UIPadding
				textbox["63"] = Instance.new("UIPadding", textbox["5f"]);
				textbox["63"]["PaddingRight"] = UDim.new(0, 30);
				textbox["63"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.ZapUIL.Main.Tab.Home.Textbox.Value
				textbox["64"] = Instance.new("TextLabel", textbox["5f"]);
				textbox["64"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
				textbox["64"]["BorderSizePixel"] = 0;
				textbox["64"]["TextXAlignment"] = Enum.TextXAlignment.Right;
				textbox["64"]["TextTransparency"] = 0.7;
				textbox["64"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
				textbox["64"]["TextSize"] = 16;
				textbox["64"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				textbox["64"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				textbox["64"]["BackgroundTransparency"] = 1;
				textbox["64"]["Size"] = UDim2.new(0, 62, 0, 22);
				textbox["64"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				textbox["64"]["Text"] = tbOptions.Datatype or typeof(tbOptions.DefaultValue);
				textbox["64"]["Name"] = [[Value]];
				textbox["64"]["Position"] = UDim2.new(0.87635, 0, 0, 5);

				-- StarterGui.ZapUIL.Main.Tab.Home.Textbox.TextboxInput
				textbox["65"] = Instance.new("TextBox", textbox["5f"]);
				textbox["65"]["CursorPosition"] = -1;
				textbox["65"]["Active"] = false;
				textbox["65"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				textbox["65"]["PlaceholderColor3"] = Color3.fromRGB(81, 81, 81);
				textbox["65"]["BorderSizePixel"] = 0;
				textbox["65"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				textbox["65"]["TextSize"] = 16;
				textbox["65"]["Name"] = [[TextboxInput]];
				textbox["65"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
				textbox["65"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				textbox["65"]["Selectable"] = false;
				textbox["65"]["PlaceholderText"] = [[...]];
				textbox["65"]["Size"] = UDim2.new(0, 345, 0, 24);
				textbox["65"]["Position"] = UDim2.new(0, 0, 0.46392, 0);
				textbox["65"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				textbox["65"]["Text"] = tbOptions.DefaultValue;
				textbox["65"]["ClearTextOnFocus"] = false;

				-- StarterGui.ZapUIL.Main.Tab.Home.Textbox.TextboxInput.UICorner
				textbox["66"] = Instance.new("UICorner", textbox["65"]);

				-- StarterGui.ZapUIL.Main.Tab.Home.Textbox.TextboxInput.UIStroke
				textbox["67"] = Instance.new("UIStroke", textbox["65"]);
				textbox["67"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				textbox["67"]["Color"] = Color3.fromRGB(101, 101, 101);

				-- StarterGui.ZapUIL.Main.Tab.Home.Textbox.TextboxInput.UIPadding
				textbox["68"] = Instance.new("UIPadding", textbox["65"]);
				textbox["68"]["PaddingLeft"] = UDim.new(0, 10);

				do -- Methods
					function textbox:SetText(text)
						textbox["65"]["Text"] = text
					end
					
					function textbox:SetValue(v)
						if typeof(v) == typeof(tbOptions.DefaultValue) then
							textbox.Value = v
						end
					end

					function textbox:SetCallback(ncallback)
						tbOptions.callback = ncallback
					end
				end

				do -- Logic
					textbox["65"].FocusLost:Connect(function()
						if typeof(textbox["65"].Text) == typeof(tbOptions.DefaultValue) then
							textbox.Value = textbox["65"].Text
							tbOptions.callback(textbox["65"].Text)
						end
					end)
				end
			end
			
			return textbox
		end
		
		function tab:CreateColorPicker(cOptions)
			cOptions = ZapLib:SetDefaults({
				Name = "Color Picker",
				Color = Color3.fromRGB(options.AccentColor),
				callback = function()end
			})
			
			local picker = {}
			
			do -- Make it
				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker
				picker["69"] = Instance.new("Frame", tab["13"]);
				picker["69"]["BorderSizePixel"] = 0;
				picker["69"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				picker["69"]["Size"] = UDim2.new(1, 0, 0.10255, 0);
				picker["69"]["Position"] = UDim2.new(0, 0, 0.34102, 0);
				picker["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				picker["69"]["Name"] = [[ColorPicker]];


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.UICorner
				picker["6a"] = Instance.new("UICorner", picker["69"]);



				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.UIStroke
				picker["6b"] = Instance.new("UIStroke", picker["69"]);
				picker["6b"]["Thickness"] = 2;
				picker["6b"]["Color"] = Color3.fromRGB(61, 61, 61);


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.Title
				picker["6c"] = Instance.new("TextLabel", picker["69"]);
				picker["6c"]["BorderSizePixel"] = 0;
				picker["6c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				picker["6c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				picker["6c"]["TextSize"] = 16;
				picker["6c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				picker["6c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				picker["6c"]["BackgroundTransparency"] = 1;
				picker["6c"]["Size"] = UDim2.new(1, -40, 0, 30);
				picker["6c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				picker["6c"]["Text"] = [[ColorPicker]];
				picker["6c"]["Name"] = [[Title]];


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.UIPadding
				picker["6d"] = Instance.new("UIPadding", picker["69"]);
				picker["6d"]["PaddingRight"] = UDim.new(0, 30);
				picker["6d"]["PaddingLeft"] = UDim.new(0, 10);


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.Color
				picker["6e"] = Instance.new("Frame", picker["69"]);
				picker["6e"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
				picker["6e"]["BorderSizePixel"] = 0;
				picker["6e"]["BackgroundColor3"] = Color3.fromRGB(161, 161, 161);
				picker["6e"]["Size"] = UDim2.new(0, 35, 0, 35);
				picker["6e"]["Position"] = UDim2.new(0.91654, 0, 0.13892, 5);
				picker["6e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				picker["6e"]["Name"] = [[Color]];


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.Color.UICorner
				picker["6f"] = Instance.new("UICorner", picker["6e"]);



				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.R
				picker["70"] = Instance.new("TextBox", picker["69"]);
				picker["70"]["CursorPosition"] = -1;
				picker["70"]["Active"] = false;
				picker["70"]["TextColor3"] = Color3.fromRGB(161, 0, 0);
				picker["70"]["PlaceholderColor3"] = Color3.fromRGB(161, 0, 0);
				picker["70"]["BorderSizePixel"] = 0;
				picker["70"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				picker["70"]["TextSize"] = 16;
				picker["70"]["Name"] = [[R]];
				picker["70"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
				picker["70"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				picker["70"]["Selectable"] = false;
				picker["70"]["PlaceholderText"] = [[...]];
				picker["70"]["Size"] = UDim2.new(0, 42, 0, 24);
				picker["70"]["Position"] = UDim2.new(0, 0, 0.46392, 0);
				picker["70"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				picker["70"]["Text"] = [[160]];


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.R.UICorner
				picker["71"] = Instance.new("UICorner", picker["70"]);



				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.R.UIStroke
				picker["72"] = Instance.new("UIStroke", picker["70"]);
				picker["72"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				picker["72"]["Color"] = Color3.fromRGB(161, 0, 0);


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.R.UIPadding
				picker["73"] = Instance.new("UIPadding", picker["70"]);
				picker["73"]["PaddingLeft"] = UDim.new(0, 10);


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.G
				picker["74"] = Instance.new("TextBox", picker["69"]);
				picker["74"]["Active"] = false;
				picker["74"]["TextColor3"] = Color3.fromRGB(0, 161, 0);
				picker["74"]["PlaceholderColor3"] = Color3.fromRGB(0, 161, 0);
				picker["74"]["BorderSizePixel"] = 0;
				picker["74"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				picker["74"]["TextSize"] = 16;
				picker["74"]["Name"] = [[G]];
				picker["74"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
				picker["74"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				picker["74"]["Selectable"] = false;
				picker["74"]["PlaceholderText"] = [[...]];
				picker["74"]["Size"] = UDim2.new(0, 42, 0, 24);
				picker["74"]["Position"] = UDim2.new(0.15, 0, 0.46392, 0);
				picker["74"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				picker["74"]["Text"] = [[160]];


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.G.UICorner
				picker["75"] = Instance.new("UICorner", picker["74"]);



				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.G.UIStroke
				picker["76"] = Instance.new("UIStroke", picker["74"]);
				picker["76"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				picker["76"]["Color"] = Color3.fromRGB(0, 161, 0);


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.G.UIPadding
				picker["77"] = Instance.new("UIPadding", picker["74"]);
				picker["77"]["PaddingLeft"] = UDim.new(0, 10);


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.B
				picker["78"] = Instance.new("TextBox", picker["69"]);
				picker["78"]["Active"] = false;
				picker["78"]["TextColor3"] = Color3.fromRGB(0, 0, 161);
				picker["78"]["PlaceholderColor3"] = Color3.fromRGB(0, 0, 161);
				picker["78"]["BorderSizePixel"] = 0;
				picker["78"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				picker["78"]["TextSize"] = 16;
				picker["78"]["Name"] = [[B]];
				picker["78"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
				picker["78"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				picker["78"]["Selectable"] = false;
				picker["78"]["PlaceholderText"] = [[...]];
				picker["78"]["Size"] = UDim2.new(0, 42, 0, 24);
				picker["78"]["Position"] = UDim2.new(0.3, 0, 0.46392, 0);
				picker["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				picker["78"]["Text"] = [[160]];


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.B.UICorner
				picker["79"] = Instance.new("UICorner", picker["78"]);



				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.B.UIStroke
				picker["7a"] = Instance.new("UIStroke", picker["78"]);
				picker["7a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				picker["7a"]["Color"] = Color3.fromRGB(0, 0, 161);


				-- StarterGui.ZapUIL.Main.Tab.Home.ColorPicker.B.UIPadding
				picker["7b"] = Instance.new("UIPadding", picker["78"]);
				picker["7b"]["PaddingLeft"] = UDim.new(0, 10);
				
				do -- Methods
					function picker:SetColor(c3)
						picker["6e"]["BackgroundColor3"] = c3
						
						picker["70"]["Text"] = math.round(c3.R * 255)
						picker["70"]["TextColor3"] = Color3.new(c3.R,0,0)
						picker["70"]["PlaceholderColor3"] = Color3.new(c3.R,0,0)
						picker["72"]["Color"] = Color3.new(c3.R,0,0)
						
						picker["74"]["Text"] = math.round(c3.G * 255)
						picker["74"]["TextColor3"] = Color3.new(0,c3.G,0)
						picker["74"]["PlaceholderColor3"] = Color3.new(0,c3.G,0)
						picker["76"]["Color"] = Color3.new(0,c3.G,0)
						
						picker["78"]["Text"] = math.round(c3.B * 255)
						picker["78"]["TextColor3"] = Color3.new(0,0,c3.B)
						picker["78"]["PlaceholderColor3"] = Color3.new(0,0,c3.B)
						picker["7a"]["Color"] = Color3.new(0,0,c3.B)
					end
				end
				
				do -- Logic
					picker["70"].FocusLost:Connect(function()
						local R = tonumber(picker["70"]["Text"])
						local G = tonumber(picker["74"]["Text"])
						local B = tonumber(picker["78"]["Text"])
						picker:SetColor(Color3.fromRGB(R,G,B))
					end)
					
					picker["74"].FocusLost:Connect(function()
						local R = tonumber(picker["70"]["Text"])
						local G = tonumber(picker["74"]["Text"])
						local B = tonumber(picker["78"]["Text"])
						picker:SetColor(Color3.fromRGB(R,G,B))
					end)
					
					picker["78"].FocusLost:Connect(function()
						local R = tonumber(picker["70"]["Text"])
						local G = tonumber(picker["74"]["Text"])
						local B = tonumber(picker["78"]["Text"])
						picker:SetColor(Color3.fromRGB(R,G,B))
					end)
				end
			end
			
			return picker
		end
		
		function tab:CreateBind(bOptions)
			bOptions = ZapLib:SetDefaults({
				Name = "Keybind",
				DefaultBind = Enum.KeyCode.Z,
				callback = function()end
			})
			
			local bind = {
				CurrentBind = Enum.KeyCode.Z,
				Binding = false,
				Hover = false,
				MouseDown = false
			}
			
			do -- Create
				-- StarterGui.ZapUIL.Main.Tab.Home.Keybind
				bind["7c"] = Instance.new("Frame", tab["13"]);
				bind["7c"]["BorderSizePixel"] = 0;
				bind["7c"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				bind["7c"]["Size"] = UDim2.new(1, 0, 0, 31);
				bind["7c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				bind["7c"]["Name"] = [[Keybind]];


				-- StarterGui.ZapUIL.Main.Tab.Home.Keybind.UICorner
				bind["7d"] = Instance.new("UICorner", bind["7c"]);



				-- StarterGui.ZapUIL.Main.Tab.Home.Keybind.UIStroke
				bind["7e"] = Instance.new("UIStroke", bind["7c"]);
				bind["7e"]["Thickness"] = 2;
				bind["7e"]["Color"] = Color3.fromRGB(61, 61, 61);


				-- StarterGui.ZapUIL.Main.Tab.Home.Keybind.Title
				bind["7f"] = Instance.new("TextLabel", bind["7c"]);
				bind["7f"]["BorderSizePixel"] = 0;
				bind["7f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				bind["7f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				bind["7f"]["TextSize"] = 16;
				bind["7f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				bind["7f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				bind["7f"]["BackgroundTransparency"] = 1;
				bind["7f"]["Size"] = UDim2.new(1, -40, 1, 0);
				bind["7f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				bind["7f"]["Text"] = bOptions.Name;
				bind["7f"]["Name"] = [[Title]];


				-- StarterGui.ZapUIL.Main.Tab.Home.Keybind.Holder
				bind["80"] = Instance.new("Frame", bind["7c"]);
				bind["80"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
				bind["80"]["BorderSizePixel"] = 0;
				bind["80"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
				bind["80"]["Size"] = UDim2.new(0, 81, 0, 22);
				bind["80"]["Position"] = UDim2.new(0.81762, 0, 0, 5);
				bind["80"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				bind["80"]["Name"] = [[Holder]];


				-- StarterGui.ZapUIL.Main.Tab.Home.Keybind.Holder.UICorner
				bind["81"] = Instance.new("UICorner", bind["80"]);



				-- StarterGui.ZapUIL.Main.Tab.Home.Keybind.Holder.Title
				bind["82"] = Instance.new("TextLabel", bind["80"]);
				bind["82"]["BorderSizePixel"] = 0;
				bind["82"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				bind["82"]["TextSize"] = 16;
				bind["82"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				bind["82"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				bind["82"]["BackgroundTransparency"] = 1;
				bind["82"]["Size"] = UDim2.new(1, 0, 1, 0);
				bind["82"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				bind["82"]["Text"] = bOptions.DefaultBind.Name;
				bind["82"]["Name"] = [[Title]];


				-- StarterGui.ZapUIL.Main.Tab.Home.Keybind.UIPadding
				bind["83"] = Instance.new("UIPadding", bind["7c"]);
				bind["83"]["PaddingRight"] = UDim.new(0, 30);
				bind["83"]["PaddingLeft"] = UDim.new(0, 10);
				
				do -- mehtosds
					function bind:SetBind(b)
						bind.CurrentBind = b
						bind["82"].Text = b.Name
						bind.Binding = false
					end
					
					function bind:Reset()
						bind.CurrentBind = bOptions.DefaultBind
						bind["82"].Text = bOptions.DefaultBind.Name
						bind.Binding = false
					end
				end
				
				do -- Logic
					bind["7c"].MouseEnter:Connect(function()
						bind.Hover = true

						ZapLib:Tween(bind["7e"], {Color = Color3.fromRGB(80,80,80)})
					end)

					bind["7c"].MouseLeave:Connect(function()
						bind.Hover = false

						if not bind.MouseDown then
							ZapLib:Tween(bind["7e"], {Color = Color3.fromRGB(40,40,40)})
							ZapLib:Tween(bind["7c"], {BackgroundColor3 = Color3.fromRGB(36,36,36)})
						end
					end)

					uis.InputBegan:Connect(function(io,gpe)
						if gpe then return end
						
						if io.UserInputType == Enum.UserInputType.Keyboard then
							if io.KeyCode == bind.CurrentBind then
								bOptions.callback()
							end
						end
						
						if io.UserInputType == Enum.UserInputType.MouseButton1 and bind.Hover then
							ZapLib:Tween(bind["7c"], {BackgroundColor3 = Color3.fromRGB(50,50,50)})
							ZapLib:Tween(bind["7e"], {Color = Color3.fromRGB(80,80,80)}) 
							bind.MouseDown = true
							
							bind.Binding = true
						end
					end)

					uis.InputEnded:Connect(function(io,gpe)
						if gpe then return end

						if io.UserInputType == Enum.UserInputType.MouseButton1 then
							bind.MouseDown = false
							
							if bind.Binding then
								while bind.Binding do
									task.wait()
									
									bind["82"]["Text"] = "..."
									
									local key = uis:GetKeysPressed()
									if key[1] ~= nil then
										bind.Binding = false
										bind:SetBind(key[1].KeyCode)
										break
									end
								end
							end
							
							if bind.Hover then
								ZapLib:Tween(bind["7c"], {BackgroundColor3 = Color3.fromRGB(36,36,36)})
								ZapLib:Tween(bind["7e"], {Color = Color3.fromRGB(80,80,80)}) 
							else
								ZapLib:Tween(bind["7c"], {BackgroundColor3 = Color3.fromRGB(36,36,36)})
								ZapLib:Tween(bind["7e"], {Color = Color3.fromRGB(40,40,40)})
							end
						end
					end)
				end
			end
			
			return bind
		end
		
		return tab
	end
	
	return UI
end

return ZapLib
