require "lib.moonloader"

--local vkeys = require "vkeys"
local imgui = require "imgui"
local encoding = 	require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

local scriptsettings = {
	color = '{5D00C0}',
	text_color = '{D3D3D3}'
}

local frames = {
	mainwindow = imgui.ImBool(false)
}

local userdata = {

}

local resX, resY = getScreenResolution()

function main()
	while not isSampAvailable() do wait(200) end
	msg("������� ��� ���������: /lhelp")
	while true do
		wait(0)
		if wasKeyPressed(0x47) then
			frames.mainwindow.v = not frames.mainwindow.v
		end
		imgui.Process = frames.mainwindow.v
	end
end

function imgui.OnDrawFrame()
	if frames.mainwindow.v then
		imgui.SetNextWindowPos(imgui.ImVec2(resX / 2 , resY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(500, 325), imgui.Cond.FirstUseEver)
		imgui.Begin("LeadHelp", frames.mainwindow, imgui.WindowFlags.NoResize)
		imgui.Text("Text here")
		if imgui.Button('Press Me') then
			printStringNow('Button Pressed!', 1800)
		end
		imgui.End()
	end
end

function msg(arg)
	sampAddChatMessage(scriptsettings.color.."[LeadHelper] "..scriptsettings.text_color..arg.."", -1)

end

function themeSettings()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local ImVec2 = imgui.ImVec2
	style.WindowPadding = imgui.ImVec2(8, 8)
	style.WindowRounding = 6
	style.ChildWindowRounding = 5
	style.FramePadding = imgui.ImVec2(5, 3)
	style.FrameRounding = 3.0
	style.ItemSpacing = imgui.ImVec2(5, 4)
	style.ItemInnerSpacing = imgui.ImVec2(4, 4)
	style.IndentSpacing = 21
	style.ScrollbarSize = 10.0
	style.ScrollbarRounding = 13
	style.GrabMinSize = 8
	style.GrabRounding = 1
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
	style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	colors[clr.Text]                   = ImVec4(0.95, 0.96, 0.98, 1.00);
	colors[clr.TextDisabled]           = ImVec4(0.29, 0.29, 0.29, 1.00);
	colors[clr.WindowBg]               = ImVec4(0.14, 0.14, 0.14, 1.00);
	colors[clr.ChildWindowBg]          = ImVec4(0.12, 0.12, 0.12, 1.00);
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94);
	colors[clr.Border]                 = ImVec4(0.14, 0.14, 0.14, 1.00);
	colors[clr.BorderShadow]           = ImVec4(1.00, 1.00, 1.00, 0.10);
	colors[clr.FrameBg]                = ImVec4(0.22, 0.22, 0.22, 1.00);
	colors[clr.FrameBgHovered]         = ImVec4(0.18, 0.18, 0.18, 1.00);
	colors[clr.FrameBgActive]          = ImVec4(0.09, 0.12, 0.14, 1.00);
	colors[clr.TitleBg]                = ImVec4(0.14, 0.14, 0.14, 0.81);
	colors[clr.TitleBgActive]          = ImVec4(0.14, 0.14, 0.14, 1.00);
	colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51);
	colors[clr.MenuBarBg]              = ImVec4(0.20, 0.20, 0.20, 1.00);
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.39);
	colors[clr.ScrollbarGrab]          = ImVec4(0.36, 0.36, 0.36, 1.00);
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.12, 0.12, 0.12, 1.00);
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.36, 0.36, 0.36, 1.00);
	colors[clr.ComboBg]                = ImVec4(0.24, 0.24, 0.24, 1.00);
	colors[clr.CheckMark]              = ImVec4(0.37, 0.00, 0.75, 1.00);
	colors[clr.SliderGrab]             = ImVec4(0.37, 0.00, 0.75, 1.00);
	colors[clr.SliderGrabActive]       = ImVec4(0.31, 0.00, 0.71, 1.00);
	colors[clr.Button]                 = ImVec4(0.37, 0.00, 0.75, 1.00);
	colors[clr.ButtonHovered]          = ImVec4(0.47, 0.00, 0.94, 1.00);
	colors[clr.ButtonActive]           = ImVec4(0.31, 0.00, 0.71, 1.00);
	colors[clr.Header]                 = ImVec4(0.37, 0.00, 0.75, 1.00);
	colors[clr.HeaderHovered]          = ImVec4(0.47, 0.00, 0.94, 1.00);
	colors[clr.HeaderActive]           = ImVec4(0.31, 0.00, 0.71, 1.00);
	colors[clr.ResizeGrip]             = ImVec4(1.00, 0.28, 0.28, 1.00);
	colors[clr.ResizeGripHovered]      = ImVec4(1.00, 0.39, 0.39, 1.00);
	colors[clr.ResizeGripActive]       = ImVec4(1.00, 0.19, 0.19, 1.00);
	colors[clr.CloseButton]            = ImVec4(0.40, 0.39, 0.38, 0.16);
	colors[clr.CloseButtonHovered]     = ImVec4(0.40, 0.39, 0.38, 0.39);
	colors[clr.CloseButtonActive]      = ImVec4(0.40, 0.39, 0.38, 1.00);
	colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00);
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00);
	colors[clr.PlotHistogram]          = ImVec4(1.00, 0.21, 0.21, 1.00);
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.18, 0.18, 1.00);
	colors[clr.TextSelectedBg]         = ImVec4(1.00, 0.32, 0.32, 1.00);
	colors[clr.ModalWindowDarkening]   = ImVec4(0.26, 0.26, 0.26, 0.60);
end	

themeSettings()