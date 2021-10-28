-- Author - https://vk.com/klamet1

require "lib.sampfuncs"
require "lib.moonloader"

script_name("FindPlayers")
script_author("СоМиК")
script_version("1.1")
script_properties("work-in-pause")

local main_color = 0x5A90CE
local color_text = "{FFFF00}"
local tag = "[FindPlayers]: "

local dlstatus = require('moonloader').download_status

local script_vers = 2
local script_vers_text = "1.1"
local script_path = thisScript().path
local script_url = "https://raw.githubusercontent.com/SoMiK3/FindPlayers/main/FindPlayers.lua"
local update_path = getWorkingDirectory() .. "/fplayersupdate.ini"
local update_url = "https://raw.githubusercontent.com/SoMiK3/FindPlayers/main/fplayersupdate.ini"
local config_path = getWorkingDirectory() .. "/config/FindPlayer.ini"

local MoonFolder = getWorkingDirectory()
local MoonLibFolder = MoonFolder .. "\\lib"
local samplua_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/events.lua"
local raknet_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/raknet.lua"
local utils_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/events/utils.lua"
local handlers_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/events/handlers.lua"
local extra_types_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/events/extra_types.lua"
local bitstream_io_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/events/bitstream_io.lua"
local core_url = "https://raw.githubusercontent.com/THE-FYP/SAMP.Lua/master/samp/events/core.lua"
local imgui_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/imgui.lua"
local imguidll_url = "https://github.com/SoMiK3/FastLinkLibs/blob/main/MoonImGui.dll?raw=true"
local fAwesome5_url = "https://raw.githubusercontent.com/SoMiK3/FastLinkLibs/main/fAwesome5.lua"
local fa_solid_900_url = "https://github.com/SoMiK3/FastLinkLibs/blob/main/fa-solid-900.ttf?raw=true"
-- ДЛЯ МОДЕРАТОРОВ BLASTHACK. МНЕ СКАЗАЛИ, ЧТО ССЫЛКУ НА ИМГУИ МОЖНО НЕ МЕНЯТЬ, ТАК КАК ИМГУИ ОБНОВЛЯТЬСЯ НЕ БУДЕТ (ТОЖЕ САМОЕ С Ф.АВЕСОМ). НЕ НАДО ИЗ-ЗА ЭТОГО ОТПРАВЛЯТЬ ФАЙЛ НА ПОВТОРНУЮ ПРЕМОДЕРАЦИЮ, МОГУ ПОКАЗАТЬ ЧТО МНЕ ОТВЕТИЛ ВСЕФОРУМ.
nalichie = true

function onScriptTerminate(script, quitGame)
	if script == thisScript() then
		sampShowDialog(1338, "{FFFF00}Краш скрипта {FFFFFF}FindPlayers", "{FFFF00}Скрипт был {FFFFFF}крашнут {FFFF00}по какой-то причине...\nВозможно, скрипт был {FFFFFF}перезагружен{FFFF00}, это могло посодействовать появлению данного окна\n\nЕсли же скрипт не был перезагружен, пожалуйста, обратитесь сюда: {FFFFFF}https://vk.com/klamet1/\nНе забудьте указать{FFFF00}, каким было ваше последнее действие перед {FFFFFF}крашем{FFFF00} скрипта.\n\n\n{ffff00}И последнее... Никогда не отчаивайтесь и запомните, {FFFFFF}Аллах {FFFF00}вам в помощь.\n{ff0033}ДОЛБИТЕ ВСЕМИ СИЛАМИ ПО КЛАВИШАМ, ПОСТОЯННО ПЕРЕЗАГРУЖАЙТЕ СКРИПТ КОМБИНАЦИЕЙ CTRL + R\nПОСТОЯННО ПЕРЕЗАПУСКАЙТЕ ГТА ЕСЛИ КОМБИНАЦИЯ НЕ СРАБОТАЛА И НАДЕЙТЕСЬ НА УДАЧУ ДО ПОСЛЕДНЕГО, ПОКА СКРИПТ НЕ ЗАРАБОТАЕТ\n{FFFF00}Ну или просто дождитесь {FFFFFF}фикса {FFFF00}от автора :)\nВсем {00FF00}б{FFFF00}обра и позитива, {FFFFFF}чао", "{ff0000}Автор гей", nil, DIALOG_STYLE_MSGBOX)
	end
end

if not doesDirectoryExist("moonloader//lib") then
	createDirectory("moonloader//lib")
end
if not doesDirectoryExist("moonloader//lib//samp") then
	createDirectory("moonloader//lib//samp")
end
if not doesDirectoryExist("moonloader//lib//samp//events") then
	createDirectory("moonloader//lib//samp//events")
end
if not doesDirectoryExist("moonloader//lib//resource") then
	createDirectory("moonloader//lib//resource")
end
if not doesDirectoryExist("moonloader//lib//resource//fonts") then
	createDirectory("moonloader//lib//resource//fonts")
end

if not doesFileExist(MoonLibFolder .."\\samp\\events.lua") then
	downloadUrlToFile(samplua_url, MoonLibFolder .."\\samp\\events.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\raknet.lua") then
	downloadUrlToFile(raknet_url, MoonLibFolder .."\\samp\\raknet.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\events\\utils.lua") then
	downloadUrlToFile(utils_url, MoonLibFolder .."\\samp\\events\\utils.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\events\\handlers.lua") then
	downloadUrlToFile(handlers_url, MoonLibFolder .."\\samp\\events\\handlers.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\events\\extra_types.lua") then
	downloadUrlToFile(extra_types_url, MoonLibFolder .."\\samp\\events\\extra_types.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\events\\bitstream_io.lua") then
	downloadUrlToFile(bitstream_io_url, MoonLibFolder .."\\samp\\events\\bitstream_io.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\samp\\events\\core.lua") then
	downloadUrlToFile(core_url, MoonLibFolder .."\\samp\\events\\core.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\imgui.lua") then
	downloadUrlToFile(imgui_url, MoonLibFolder .."\\imgui.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\fAwesome5.lua") then
	downloadUrlToFile(fAwesome5_url, MoonLibFolder .."\\fAwesome5.lua")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\resource\\fonts\\fa-solid-900.ttf") then
	downloadUrlToFile(fa_solid_900_url, MoonLibFolder .."\\resource\\fonts\\fa-solid-900.ttf")
	nalichie = false
end
if not doesFileExist(MoonLibFolder .."\\MoonImGui.dll") then
	downloadUrlToFile(imguidll_url, MoonLibFolder .."\\MoonImGui.dll")
	nalichie = false
end
if not nalichie then
	thisScript():reload()
end

local sampev = require "lib.samp.events"
local keys = require "vkeys"
local inicfg = require "inicfg"
local rkeys = require "rkeys"
local wm = require 'lib.windows.message'
local sw, sh = getScreenResolution()
local initable = {
cfg = {
	posx = 0,
	posy = sh / 2,
	bindKey = "[104]",
	command = "findplayers",
	findlvl = 1,
	check = false,
	message = "Привет, я использую скрипт \"FindPlayers\" сделанный СоМиК'ом. Это сообщение будет отправлено автоматически!",
	color1 = 0.00,
	color2 = 0.49,
	color3 = 1.00,
	theme = 1,
	rgb_style = false
	}
}
local FindPlayer
if not doesDirectoryExist("moonloader//lib") then
	createDirectory("moonloader//lib")
	inicfg.save(initable, "FindPlayer")
end
FindPlayer = inicfg.load(nil, "FindPlayer")
if FindPlayer == nil then
	inicfg.save(initable, "FindPlayer")
	FindPlayer = inicfg.load(nil, "FindPlayer")
end
a1 = FindPlayer.cfg.color1
b1 = FindPlayer.cfg.color2
c1 = FindPlayer.cfg.color3
local rgb_speed = 0.5
if FindPlayer.cfg.rgb_style then
	rgb_style = true
end
theme = FindPlayer.cfg.theme
local imgui = require "imgui"
local encoding = require "encoding"
encoding.default = "CP1251"
u8 = encoding.UTF8

local menuSelected = 1
local page = 1

local window = imgui.ImBool(false)
local nickIgnore = imgui.ImBuffer(50)
local FindLVLi = imgui.ImInt(FindPlayer.cfg.findlvl)
local message = imgui.ImBuffer(200)
message.v = u8(FindPlayer.cfg.message)
local chkmsg = imgui.ImBool(FindPlayer.cfg.check)
local command = imgui.ImBuffer(35)
local color = imgui.ImFloat3(a1, b1, c1)
imgui.HotKey = require("imgui_addons").HotKey
local activeKeys = {
	v = decodeJson(FindPlayer.cfg.bindKey)
}
local tLastKeys = {}
command.v = tostring(u8(FindPlayer.cfg.command))
cmd = tostring(FindPlayer.cfg.command)

local fa_font = nil
local fa = require 'fAwesome5'
local fa_glyph_ranges = imgui.ImGlyphRanges({ fa.min_range, fa.max_range })

nicksandnumbers = {
}
numbersid = {
	[1] = "1",
	[2] = "1",
	[3] = "1",
	[4] = "1",
	[5] = "1",
	[6] = "1",
	[7] = "1",
	[8] = "1",
	[9] = "1",
	[0] = "1",
	["callButton"] = "1",
	["call"] = "1",
	["panel"] = "1",
	["outcoming"] = "1",
	["biz"] = "1"
}
servers = {
	["Phoenix"] = "185.169.134.3:7777",
	["Tucson"] = "185.169.134.4:7777",
	["Scottdale"] = "185.169.134.43:7777",
	["Chandler"] = "185.169.134.44:7777",
	["Brainburg"] = "185.169.134.45:7777",
	["Saint Rose"] = "185.169.134.5:7777",
	["Mesa"] = "185.169.134.59:7777",
	["Red Rock"] = "185.169.134.61:7777",
	["Yuma"] = "185.169.134.107:7777",
	["Surprise"] = "185.169.134.109:7777",
	["Prescott"] = "185.169.134.166:7777",
	["Glendale"] = "185.169.134.171:7777",
	["Kingman"] = "185.169.134.172:7777",
	["Winslow"] = "185.169.134.173:7777",
	["Payson"] = "185.169.134.174:7777",
	["Gilbert"] = "80.66.82.191:7777",
	["Show Low"] = "80.66.82.190:7777"
}

local loadScr = true

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end

	sampRegisterChatCommand(cmd, activation)
	
	sampAddChatMessage(tag .. color_text .. "Скрипт готов к работе. Автор - " .. "{FFFFFF}" ..  "СоМиК" .. color_text .. "! Меню скрипта: " .. "{FFFFFF}/" .. cmd, main_color)

	bindKey = rkeys.registerHotKey(activeKeys.v, 1, true, callbackFunc)

	activeCmd = cmd
	windowActive = false

	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	-- CLIENT RADAR:

	---------------------------------------------------------------------------------------------

	-- Samsung (client radar)
	coordinatesSamsungLine = {89.56632232666, 198.91032409668}
	coordinatesSamsungBIZ = {66.333366394043, 228.8927154541}
	coordinatesSamsungPanel = {56.699771881104, 293.26712036133}
	coordinatesSamsungNum1 = {59.266868591309, 213.95120239258}
	coordinatesSamsungNum2 = {78.333251953125, 213.92163085938}
	coordinatesSamsungNum3 = {96.999626159668, 213.93641662598}
	coordinatesSamsungNum4 = {59.266868591309, 234.95248413086}
	coordinatesSamsungNum5 = {78.099914550781, 234.73768615723}
	coordinatesSamsungNum6 = {96.999626159668, 234.73768615723}
	coordinatesSamsungNum7 = {59.266868591309, 255.75375366211}
	coordinatesSamsungNum8 = {78.099914550781, 255.53897094727}
	coordinatesSamsungNum9 = {96.999626159668, 255.53897094727}
	coordinatesSamsungNum0 = {78.099914550781, 276.04022216797}
	coordinatesSamsungCall = {78.099914550781, 296.64147949219}
	coordinatesSamsungOutcoming = {89.799598693848, 243.42527770996}

	---------------------------------------------------------------------------------------------

	-- iPhone (client radar)
	coordinatesiPhoneLine = {88.366340637207, 194.11003112793}
	coordinatesiPhoneBIZ = {66.333366394043, 233.97048950195}
	coordinatesiPhonePanel = {57.033203125, 296.46331787109}
	coordinatesiPhoneNum1 = {58.066886901855, 210.35098266602}
	coordinatesiPhoneNum2 = {77.133270263672, 210.32141113281}
	coordinatesiPhoneNum3 = {95.799644470215, 210.33619689941}
	coordinatesiPhoneNum4 = {58.066886901855, 231.3522644043}
	coordinatesiPhoneNum5 = {76.899932861328, 231.13746643066}
	coordinatesiPhoneNum6 = {95.799644470215, 231.13746643066}
	coordinatesiPhoneNum7 = {58.066886901855, 252.15353393555}
	coordinatesiPhoneNum8 = {76.899932861328, 251.9387512207}
	coordinatesiPhoneNum9 = {95.799644470215, 251.9387512207}
	coordinatesiPhoneNum0 = {76.899932861328, 272.44000244141}
	coordinatesiPhoneCall = {76.899932861328, 293.04125976563}
	coordinatesiPhoneOutcoming = {88.399620056152, 243.82530212402}

	---------------------------------------------------------------------------------------------

	-- GooglePixel (client radar)
	coordinatesPixelLine = {87.866348266602, 201.01045227051}
	coordinatesPixelBIZ = {66.333366394043, 241.02226257324}
	coordinatesPixelPanel = {57.3332862854, 286.34381103516}
	coordinatesPixelNum1 = {57.56689453125, 216.85137939453}
	coordinatesPixelNum2 = {76.733276367188, 216.92181396484}
	coordinatesPixelNum3 = {95.299652099609, 216.93659973145}
	coordinatesPixelNum4 = {57.56689453125, 238.15267944336}
	coordinatesPixelNum5 = {76.399940490723, 238.03788757324}
	coordinatesPixelNum6 = {95.299652099609, 238.03788757324}
	coordinatesPixelNum7 = {57.56689453125, 258.95394897461}
	coordinatesPixelNum8 = {76.399940490723, 258.83917236328}
	coordinatesPixelNum9 = {95.299652099609, 258.83917236328}
	coordinatesPixelNum0 = {76.399940490723, 279.34042358398}
	coordinatesPixelCall = {57.800224304199, 279.34042358398}
	coordinatesPixelOutcoming = {88.299621582031, 250.42570495605}

	---------------------------------------------------------------------------------------------

	-- Huawei (client radar)
	coordinatesHuaweiLine = {88.466339111328, 193.3099822998}
	coordinatesHuaweiBIZ = {66.333366394043, 234.07048034668}
	coordinatesHuaweiPanel = {56.999866485596, 297.13726806641}
	coordinatesHuaweiNum1 = {58.166885375977, 209.75094604492}
	coordinatesHuaweiNum2 = {77.333267211914, 209.82138061523}
	coordinatesHuaweiNum3 = {95.899642944336, 209.83616638184}
	coordinatesHuaweiNum4 = {58.166885375977, 230.45220947266}
	coordinatesHuaweiNum5 = {76.999931335449, 230.33741760254}
	coordinatesHuaweiNum6 = {95.899642944336, 230.33741760254}
	coordinatesHuaweiNum7 = {58.166885375977, 251.15347290039}
	coordinatesHuaweiNum8 = {76.999931335449, 251.13870239258}
	coordinatesHuaweiNum9 = {95.899642944336, 251.13870239258}
	coordinatesHuaweiNum0 = {76.999931335449, 271.63995361328}
	coordinatesHuaweiCall = {58.400215148926, 271.63995361328}
	coordinatesHuaweiOutcoming = {88.399620056152, 243.82530212402}

	---------------------------------------------------------------------------------------------

	-- Xiaomi (client radar)
	coordinatesXiaomiLine = {88.366340637207, 194.11003112793}
	coordinatesXiaomiBIZ = {66.333366394043, 251.16299438477}
	coordinatesXiaomiPanel = {57.666564941406, 297.07797241211}
	coordinatesXiaomiNum1 = {58.066886901855, 210.35098266602}
	coordinatesXiaomiNum2 = {77.133270263672, 210.32141113281}
	coordinatesXiaomiNum3 = {95.799644470215, 210.33619689941}
	coordinatesXiaomiNum4 = {58.066886901855, 231.3522644043}
	coordinatesXiaomiNum5 = {76.899932861328, 231.13746643066}
	coordinatesXiaomiNum6 = {95.799644470215, 231.13746643066}
	coordinatesXiaomiNum7 = {58.066886901855, 252.15353393555}
	coordinatesXiaomiNum8 = {76.899932861328, 251.9387512207}
	coordinatesXiaomiNum9 = {95.799644470215, 251.9387512207}
	coordinatesXiaomiNum0 = {76.899932861328, 272.44000244141}
	coordinatesXiaomiCall = {76.899932861328, 293.04125976563}
	coordinatesXiaomiOutcoming = {88.399620056152, 243.82530212402}

	---------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	-- LAUNCHER RADAR:

	---------------------------------------------------------------------------------------------

	-- Samsung (Launcher radar)
	coordinatesSamsungLineR = {64.56632232666, 173.91032409668}
	coordinatesSamsungBIZR = {41.333366394043, 203.8927154541}
	coordinatesSamsungPanelR = {31.699771881104, 268.26712036133}
	coordinatesSamsungNum1R = {34.266868591309, 188.95120239258}
	coordinatesSamsungNum2R = {53.333251953125, 188.92163085938}
	coordinatesSamsungNum3R = {71.999626159668, 188.93641662598}
	coordinatesSamsungNum4R = {34.266868591309, 209.95248413086}
	coordinatesSamsungNum5R = {53.099914550781, 209.73768615723}
	coordinatesSamsungNum6R = {71.999626159668, 209.73768615723}
	coordinatesSamsungNum7R = {34.266868591309, 230.75375366211}
	coordinatesSamsungNum8R = {53.099914550781, 230.53897094727}
	coordinatesSamsungNum9R = {71.999626159668, 230.53897094727}
	coordinatesSamsungNum0R = {53.099914550781, 251.04022216797}
	coordinatesSamsungCallR = {53.099914550781, 271.64147949219}
	coordinatesSamsungOutcomingR = {64.799598693848, 218.42527770996}

	---------------------------------------------------------------------------------------------

	-- iPhone (Launcher radar)
	coordinatesiPhoneLineR = {63.366340637207, 169.11003112793}
	coordinatesiPhoneBIZR = {41.333366394043, 208.97048950195}
	coordinatesiPhonePanelR = {32.033203125, 271.46331787109}
	coordinatesiPhoneNum1R = {33.066886901855, 185.35098266602}
	coordinatesiPhoneNum2R = {52.133270263672, 185.32141113281}
	coordinatesiPhoneNum3R = {70.799644470215, 185.33619689941}
	coordinatesiPhoneNum4R = {33.066886901855, 206.3522644043}
	coordinatesiPhoneNum5R = {51.899932861328, 206.13746643066}
	coordinatesiPhoneNum6R = {70.799644470215, 206.13746643066}
	coordinatesiPhoneNum7R = {33.066886901855, 227.15353393555}
	coordinatesiPhoneNum8R = {51.899932861328, 226.9387512207}
	coordinatesiPhoneNum9R = {70.799644470215, 226.9387512207}
	coordinatesiPhoneNum0R = {51.899932861328, 247.44000244141}
	coordinatesiPhoneCallR = {51.899932861328, 268.04125976563}
	coordinatesiPhoneOutcomingR = {63.399620056152, 218.82530212402}

	---------------------------------------------------------------------------------------------

	-- GooglePixel (Launcher radar)
	coordinatesPixelLineR = {62.866348266602, 176.01045227051}
	coordinatesPixelBIZR = {41.333366394043, 216.02226257324}
	coordinatesPixelPanelR = {32.3332862854, 261.34381103516}
	coordinatesPixelNum1R = {32.56689453125, 191.85137939453}
	coordinatesPixelNum2R = {51.733276367188, 191.92181396484}
	coordinatesPixelNum3R = {70.299652099609, 191.93659973145}
	coordinatesPixelNum4R = {32.56689453125, 213.15267944336}
	coordinatesPixelNum5R = {51.399940490723, 213.03788757324}
	coordinatesPixelNum6R = {70.299652099609, 213.03788757324}
	coordinatesPixelNum7R = {32.56689453125, 233.95394897461}
	coordinatesPixelNum8R = {51.399940490723, 233.83917236328}
	coordinatesPixelNum9R = {70.299652099609, 233.83917236328}
	coordinatesPixelNum0R = {51.399940490723, 254.34042358398}
	coordinatesPixelCallR = {32.800224304199, 254.34042358398}
	coordinatesPixelOutcomingR = {63.299621582031, 225.42570495605}

	---------------------------------------------------------------------------------------------

	-- Huawei (Launcher radar)
	coordinatesHuaweiLineR = {63.466339111328, 168.3099822998}
	coordinatesHuaweiBIZR = {41.333366394043, 209.07048034668}
	coordinatesHuaweiPanelR = {31.999866485596, 272.13726806641}
	coordinatesHuaweiNum1R = {33.166885375977, 184.75094604492}
	coordinatesHuaweiNum2R = {52.333267211914, 184.82138061523}
	coordinatesHuaweiNum3R = {70.899642944336, 184.83616638184}
	coordinatesHuaweiNum4R = {33.166885375977, 205.45220947266}
	coordinatesHuaweiNum5R = {51.999931335449, 205.33741760254}
	coordinatesHuaweiNum6R = {70.899642944336, 205.33741760254}
	coordinatesHuaweiNum7R = {33.166885375977, 226.15347290039}
	coordinatesHuaweiNum8R = {51.999931335449, 226.13870239258}
	coordinatesHuaweiNum9R = {70.899642944336, 226.13870239258}
	coordinatesHuaweiNum0R = {51.999931335449, 246.63995361328}
	coordinatesHuaweiCallR = {33.400215148926, 246.63995361328}
	coordinatesHuaweiOutcomingR = {63.399620056152, 218.82530212402}

	---------------------------------------------------------------------------------------------

	-- Xiaomi (Launcher radar)
	coordinatesXiaomiLineR = {63.366340637207, 169.11003112793}
	coordinatesXiaomiBIZR = {41.333366394043, 226.16299438477}
	coordinatesXiaomiPanelR = {32.666564941406, 272.07797241211}
	coordinatesXiaomiNum1R = {33.066886901855, 185.35098266602}
	coordinatesXiaomiNum2R = {52.133270263672, 185.32141113281}
	coordinatesXiaomiNum3R = {70.799644470215, 185.33619689941}
	coordinatesXiaomiNum4R = {33.066886901855, 206.3522644043}
	coordinatesXiaomiNum5R = {51.899932861328, 206.13746643066}
	coordinatesXiaomiNum6R = {70.799644470215, 206.13746643066}
	coordinatesXiaomiNum7R = {33.066886901855, 227.15353393555}
	coordinatesXiaomiNum8R = {51.899932861328, 226.9387512207}
	coordinatesXiaomiNum9R = {70.799644470215, 226.9387512207}
	coordinatesXiaomiNum0R = {51.899932861328, 247.44000244141}
	coordinatesXiaomiCallR = {51.899932861328, 268.04125976563}
	coordinatesXiaomiOutcomingR = {63.399620056152, 218.82530212402}

	---------------------------------------------------------------------------------------------

	local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
	if file == nil then
		io.open(MoonFolder .."\\config\\FindPlayer.json", "a")
	end
	local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
	a = file:read("*a")
	file:close()
	local tabl = decodeJson(a)
	if tabl == nil then
		tabl = {
			nicks = {
			}
		}
	end
	encodedTable = encodeJson(tabl)
	local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
	file:write(encodedTable)
	file:flush()
	file:close()

	downloadUrlToFile(update_url, update_path, function(id, status)
		if status == dlstatus.STATUS_ENDDOWNLOADDATA then
			checkupd = true
			updateIni = inicfg.load(nil, update_path)
			if tonumber(updateIni.info.vers) > script_vers then
				sampAddChatMessage(tag .. color_text .. "Есть {FFFFFF}обновление{FFFF00}! Новая версия: {FFFFFF}" .. updateIni.info.vers_text .."{FFFF00}. Текущая версия: {FFFFFF}".. script_vers_text .. "{FFFF00}.", main_color)
				sampAddChatMessage(tag .. color_text .. "Чтобы {FFFFFF}установить{FFFF00} обновление, необходимо перейти в раздел {FFFFFF}\"обновления\"{FFFF00} в меню скрипта", main_color)
				mbobnova = true
				checkupd = false
			else
				checkupd = false
				sampAddChatMessage(tag .. color_text .. "Обновлений {FFFFFF}не найдено{FFFF00}.", main_color)
			end
			os.remove(update_path)
			checkupd = false
		end
	end)

	while true do
		wait(0)
		if loadScr then
			repeat
				wait(0)
			until sampIsLocalPlayerSpawned()
			local ip, port = sampGetCurrentServerAddress()
			local currentServer = ip .. ":" .. port
			for k, v in pairs(servers) do
				if currentServer == v then
					for i = 1, 3 do
						sampAddChatMessage(tag .. color_text .. "Сервер: {FFFFFF}Arizona Role Play: " .. k .. "{FFFF00}. Скрипт {FFFFFF}готов {FFFF00}к работе.", main_color)
					end
					break
				else
					if k == "Show Low" then
						for i = 1, 10 do
							sampAddChatMessage(tag .. color_text .. "Скрипт работает только на серверах {FFFFFF}ARIZONA GAMES{FFFF00}!", main_color)
						end
						thisScript():unload()
					end
				end
			end
			loadScr = false
		end
		if callbackAct then
			callbackAct = false
			if window.v then
				window.v = not window.v
				imgui.Process = false
			else
				window.v = true
				imgui.Process = true
			end
		end
		if obnova then
			downloadUrlToFile(script_url, script_path, function(id, status)
				if status == dlstatus.STATUS_ENDDOWNLOADDATA then
					sampAddChatMessage(tag .. color_text .. "Обновление {FFFFFF}успешно{FFFF00} установлено. Новая версия: {FFFFFF}" .. updateIni.info.vers_text, main_color)
					sampAddChatMessage(tag .. color_text .. "{FFFFFF}Узнать{FFFF00} историю обновлений можно в разделе {FFFFFF}\"обновления\"{FFFF00} в меню скрипта", main_color)
					sampAddChatMessage(tag .. color_text .. "Конфиг был автоматически {FFFFFF}сброшен {FFFF00}до состояния по умолчанию", main_color)
					os.remove(config_path)
				end
			end)
			break
		end
		if window.v then
			imgui.ShowCursor = true
		else
			imgui.ShowCursor = false
		end
		if windowActive then
			local result, button, list, input = sampHasDialogRespond(1337)
			if result then
				if button == 0 then
					imgui.Process = true
					window.v = true
					windowActive = false
				else
					imgui.Process = true
					window.v = true
					windowActive = false
				end
			end
		end
		if FindPlayer.cfg.bindKey:match("{}") then
			noValue = true
			oneKey = false
			double = false
			triple = false
		end
		if FindPlayer.cfg.bindKey:match("%[%d+%]") then
			showKey = FindPlayer.cfg.bindKey:match("%[(%d+)%]")
			showKey = tonumber(showKey)
			noValue = false
			oneKey = true
			double = false
			triple = false
		elseif FindPlayer.cfg.bindKey:match("%[%d+,%d+%]") then
			showKey1, showKey2 = FindPlayer.cfg.bindKey:match("%[(%d+),(%d+)%]")
			showKey1 = tonumber(showKey1)
			showKey2 = tonumber(showKey2)
			noValue = false
			oneKey = false
			double = true
			triple = false
		elseif FindPlayer.cfg.bindKey:match("%[%d+,%d+,%d+%]") then
			showKey1, showKey2, showKey3 = FindPlayer.cfg.bindKey:match("%[(%d+),(%d+),(%d+)%]")
			showKey1 = tonumber(showKey1)
			showKey2 = tonumber(showKey2)
			showKey3 = tonumber(showKey3)
			noValue = false
			oneKey = false
			double = false
			triple = true
		end
	end
end

function callb(arg)
	sampAddChatMessage(sampTextdrawGetString(tonumber(arg)), -1)
	local x, y = sampTextdrawGetPos(arg)
	local text = sampTextdrawGetString(arg)
	print(x .. ", " .. y .. " | " .. text .. " | " .. arg)
	sampAddChatMessage(x .. ", " .. y .. " | " .. text .. " | " .. arg, -1)
end

function stringToArray(str)
	local t = {}
	for i = 1, #str do
	  t[i] = str:sub(i, i)
	end
	return t
end

function activation()
	if window.v then
		window.v = not window.v
		imgui.Process = false
	else
		window.v = true
		imgui.Process = true
	end
end

function findLvl()
	process = true
	lua_thread.create(function()
		while true do
			wait(0)
			for i = 1, 1000 do
				if process then
					if #nicksandnumbers ~= 0 then
						if sampIsPlayerConnected(i) then
							local predNick = sampGetPlayerNickname(i)
							score = sampGetPlayerScore(i)
							if score == findLVLi then
								local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
								a = file:read("*a")
								file:close()
								local ignoredNicknamesMassive = decodeJson(a)
								if #ignoredNicknamesMassive["nicks"] ~= 0 then
									local cou = 1
									for _,v in ipairs(ignoredNicknamesMassive["nicks"]) do
										if predNick ~= v then
											cou = cou + 1
											if cou > #ignoredNicknamesMassive["nicks"] then
												wait(100)
												repeat
													wait(5)
													if not process then
														break
													end
												until sended == true
												id = i
												nickse = sampGetPlayerNickname(i)
												kostil = true
												if process then
													wait(100)
													sended = false
													sampSendChat("/number " .. i)
													wait(500)
												end
												break
											end
										else
											break
										end
									end
								else
									wait(100)
									repeat
										wait(5)
										if not process then
											break
										end
									until sended == true
									id = i
									nickse = sampGetPlayerNickname(i)
									kostil = true
									if process then
										wait(100)
										sended = false
										sampSendChat("/number " .. i)
										wait(500)
									end
								end
							end
						end
					else
						if sampIsPlayerConnected(i) then
							local predNick = sampGetPlayerNickname(i)
							score = sampGetPlayerScore(i)
							if score == findLVLi then
								local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
								a = file:read("*a")
								file:close()
								local ignoredNicknamesMassive = decodeJson(a)
								if #ignoredNicknamesMassive["nicks"] ~= 0 then
									local cou = 1
									for _,v in ipairs(ignoredNicknamesMassive["nicks"]) do
										if predNick ~= v then
											cou = cou + 1
											if cou > #ignoredNicknamesMassive["nicks"] then
												wait(100)
												id = i
												nickse = sampGetPlayerNickname(i)
												kostil = true
												if process then
													sampSendChat("/number " .. i)
													wait(100)
													sended = true
													wait(500)
												end
												break
											end
										else
											break
										end
									end
								else
									wait(100)
									id = i
									nickse = sampGetPlayerNickname(i)
									kostil = true
									if process then
										sampSendChat("/number " .. i)
										wait(100)
										sended = true
										wait(500)
									end
								end
							end
						end
					end
					if i == 1000 then
						if #nicksandnumbers == 0 then
							table.insert(nicksandnumbers, {0, "игроки не найдены", 0})
						end
					end
				else
					break
				end
			end
			process = false
			break
		end
	end)
end

function phone()
	phoneProcess = false
	NumberArray = nil
	onenum = nil
	twonum = nil
	threenum = nil
	fournum = nil
	fivenum = nil
	sixfnum = nil
	sevennum = nil
	waitCalling = false
	calling = false
	phoneProcess = true
	NumberArray = stringToArray(returnNumber)
	setPlayerControl(PlayerPed, true)
	if not sampTextdrawIsExists(tonumber(numbersid["panel"])) and not sampTextdrawGetString(tonumber(numbersid["biz"])):match("^BIZ$") then
		sampSendChat("/phone")
		lua_thread.create(function()
			while true do
				wait(500)
				break
			end
		end)
	end
	if #NumberArray == 5 then
		lua_thread.create(function()
			while true do
				wait(0)
				if not sampTextdrawGetString(tonumber(numbersid["biz"])):match("^BIZ$") then
					wait(500)
					if not sampTextdrawGetString(tonumber(numbersid["biz"])):match("^BIZ$") then
						repeat 
							sampSendChat("/phone")
							wait(500)
						until sampTextdrawIsExists(tonumber(numbersid["panel"])) and sampTextdrawGetString(tonumber(numbersid["biz"])):match("^BIZ$")
					end
				end
				repeat
					wait(50)
					sampSendClickTextdraw(tonumber(numbersid["panel"]))
				until sampTextdrawIsExists(tonumber(numbersid["panel"]))
				repeat 
					wait(50)
				until sampTextdrawIsExists(tonumber(numbersid["call"]))
				repeat
					if NumberArray ~= nil then
						sampSendClickTextdraw(tonumber(numbersid[tonumber(NumberArray[1])]))
						wait(200)
						onenum = sampTextdrawGetString(tonumber(numbersid["call"]))
					else
						phoneProcess = false
						NumberArray = nil
						onenum = nil
						twonum = nil
						threenum = nil
						fournum = nil
						fivenum = nil
						sixfnum = nil
						sevennum = nil
						nedostupen = false
						numbersid[1] = "1"
						numbersid[2] = "1"
						numbersid[3] = "1"
						numbersid[4] = "1"
						numbersid[5] = "1"
						numbersid[6] = "1"
						numbersid[7] = "1"
						numbersid[8] = "1"
						numbersid[9] = "1"
						numbersid[0] = "1"
						numbersid["callButton"] = "1"
						numbersid["call"] = "1"
						numbersid["panel"] = "1"
						numbersid["outcoming"] = "1"
						numbersid["biz"] = "1"
						break
					end
				until onenum:match("^%d$")
				repeat
					if NumberArray ~= nil then
						sampSendClickTextdraw(tonumber(numbersid[tonumber(NumberArray[2])]))
						wait(200)
						twonum = sampTextdrawGetString(tonumber(numbersid["call"]))
					else
						phoneProcess = false
						NumberArray = nil
						onenum = nil
						twonum = nil
						threenum = nil
						fournum = nil
						fivenum = nil
						sixfnum = nil
						sevennum = nil
						nedostupen = false
						numbersid[1] = "1"
						numbersid[2] = "1"
						numbersid[3] = "1"
						numbersid[4] = "1"
						numbersid[5] = "1"
						numbersid[6] = "1"
						numbersid[7] = "1"
						numbersid[8] = "1"
						numbersid[9] = "1"
						numbersid[0] = "1"
						numbersid["callButton"] = "1"
						numbersid["call"] = "1"
						numbersid["panel"] = "1"
						numbersid["outcoming"] = "1"
						numbersid["biz"] = "1"
						break
					end
				until twonum:match("^%d%d$")
				repeat
					if NumberArray ~= nil then
						sampSendClickTextdraw(tonumber(numbersid[tonumber(NumberArray[3])]))
						wait(200)
						threenum = sampTextdrawGetString(tonumber(numbersid["call"]))
					else
						phoneProcess = false
						NumberArray = nil
						onenum = nil
						twonum = nil
						threenum = nil
						fournum = nil
						fivenum = nil
						sixfnum = nil
						sevennum = nil
						nedostupen = false
						numbersid[1] = "1"
						numbersid[2] = "1"
						numbersid[3] = "1"
						numbersid[4] = "1"
						numbersid[5] = "1"
						numbersid[6] = "1"
						numbersid[7] = "1"
						numbersid[8] = "1"
						numbersid[9] = "1"
						numbersid[0] = "1"
						numbersid["callButton"] = "1"
						numbersid["call"] = "1"
						numbersid["panel"] = "1"
						numbersid["outcoming"] = "1"
						numbersid["biz"] = "1"
						break
					end
				until threenum:match("^%d%d%d$")
				repeat
					if NumberArray ~= nil then
						sampSendClickTextdraw(tonumber(numbersid[tonumber(NumberArray[4])]))
						wait(200)
						fournum = sampTextdrawGetString(tonumber(numbersid["call"]))
					else
						phoneProcess = false
						NumberArray = nil
						onenum = nil
						twonum = nil
						threenum = nil
						fournum = nil
						fivenum = nil
						sixfnum = nil
						sevennum = nil
						nedostupen = false
						numbersid[1] = "1"
						numbersid[2] = "1"
						numbersid[3] = "1"
						numbersid[4] = "1"
						numbersid[5] = "1"
						numbersid[6] = "1"
						numbersid[7] = "1"
						numbersid[8] = "1"
						numbersid[9] = "1"
						numbersid[0] = "1"
						numbersid["callButton"] = "1"
						numbersid["call"] = "1"
						numbersid["panel"] = "1"
						numbersid["outcoming"] = "1"
						numbersid["biz"] = "1"
						break
					end
				until fournum:match("^%d%d%d%d$")
				repeat
					if NumberArray ~= nil then
						sampSendClickTextdraw(tonumber(numbersid[tonumber(NumberArray[5])]))
						wait(200)
						fivenum = sampTextdrawGetString(tonumber(numbersid["call"]))
					else
						phoneProcess = false
						NumberArray = nil
						onenum = nil
						twonum = nil
						threenum = nil
						fournum = nil
						fivenum = nil
						sixfnum = nil
						sevennum = nil
						nedostupen = false
						numbersid[1] = "1"
						numbersid[2] = "1"
						numbersid[3] = "1"
						numbersid[4] = "1"
						numbersid[5] = "1"
						numbersid[6] = "1"
						numbersid[7] = "1"
						numbersid[8] = "1"
						numbersid[9] = "1"
						numbersid[0] = "1"
						numbersid["callButton"] = "1"
						numbersid["call"] = "1"
						numbersid["panel"] = "1"
						numbersid["outcoming"] = "1"
						numbersid["biz"] = "1"
						break
					end
				until fivenum:match("^%d%d%d%d%d$")
				repeat
					if phoneProcess ~= false then
						sampSendClickTextdraw(tonumber(numbersid["callButton"]))
						wait(200)
					else
						break
					end
				until sampTextdrawGetString(tonumber(numbersid["outcoming"])):find("Outcoming") or nedostupen
				if nedostupen then
					wait(50)
					sampSendChat("/phone")
				else
					waitCalling = true
				end
				phoneProcess = false
				NumberArray = nil
				onenum = nil
				twonum = nil
				threenum = nil
				fournum = nil
				fivenum = nil
				sixfnum = nil
				sevennum = nil
				nedostupen = false
				numbersid[1] = "1"
				numbersid[2] = "1"
				numbersid[3] = "1"
				numbersid[4] = "1"
				numbersid[5] = "1"
				numbersid[6] = "1"
				numbersid[7] = "1"
				numbersid[8] = "1"
				numbersid[9] = "1"
				numbersid[0] = "1"
				numbersid["callButton"] = "1"
				numbersid["call"] = "1"
				numbersid["panel"] = "1"
				numbersid["outcoming"] = "1"
				numbersid["biz"] = "1"
				break
			end
		end)
	elseif #NumberArray == 7 then
		lua_thread.create(function()
			while true do
				wait(0)
				if not sampTextdrawGetString(tonumber(numbersid["biz"])):match("^BIZ$") then
					wait(500)
					if not sampTextdrawGetString(tonumber(numbersid["biz"])):match("^BIZ$") then
						repeat 
							sampSendChat("/phone")
							wait(500)
						until sampTextdrawIsExists(tonumber(numbersid["panel"])) and sampTextdrawGetString(tonumber(numbersid["biz"])):match("^BIZ$")
					end
				end
				repeat
					wait(50)
					sampSendClickTextdraw(tonumber(numbersid["panel"]))
				until sampTextdrawIsExists(tonumber(numbersid["panel"]))
				repeat 
					wait(50)
				until sampTextdrawIsExists(tonumber(numbersid["call"]))
				repeat
					if NumberArray ~= nil then
						sampSendClickTextdraw(tonumber(numbersid[tonumber(NumberArray[1])]))
						wait(200)
						onenum = sampTextdrawGetString(tonumber(numbersid["call"]))
					else
						phoneProcess = false
						NumberArray = nil
						onenum = nil
						twonum = nil
						threenum = nil
						fournum = nil
						fivenum = nil
						sixfnum = nil
						sevennum = nil
						nedostupen = false
						numbersid[1] = "1"
						numbersid[2] = "1"
						numbersid[3] = "1"
						numbersid[4] = "1"
						numbersid[5] = "1"
						numbersid[6] = "1"
						numbersid[7] = "1"
						numbersid[8] = "1"
						numbersid[9] = "1"
						numbersid[0] = "1"
						numbersid["callButton"] = "1"
						numbersid["call"] = "1"
						numbersid["panel"] = "1"
						numbersid["outcoming"] = "1"
						numbersid["biz"] = "1"
						break
					end
				until onenum:match("^%d$")
				repeat
					if NumberArray ~= nil then
						sampSendClickTextdraw(tonumber(numbersid[tonumber(NumberArray[2])]))
						wait(200)
						twonum = sampTextdrawGetString(tonumber(numbersid["call"]))
					else
						phoneProcess = false
						NumberArray = nil
						onenum = nil
						twonum = nil
						threenum = nil
						fournum = nil
						fivenum = nil
						sixfnum = nil
						sevennum = nil
						nedostupen = false
						numbersid[1] = "1"
						numbersid[2] = "1"
						numbersid[3] = "1"
						numbersid[4] = "1"
						numbersid[5] = "1"
						numbersid[6] = "1"
						numbersid[7] = "1"
						numbersid[8] = "1"
						numbersid[9] = "1"
						numbersid[0] = "1"
						numbersid["callButton"] = "1"
						numbersid["call"] = "1"
						numbersid["panel"] = "1"
						numbersid["outcoming"] = "1"
						numbersid["biz"] = "1"
						break
					end
				until twonum:match("^%d%d$")
				repeat
					if NumberArray ~= nil then
						sampSendClickTextdraw(tonumber(numbersid[tonumber(NumberArray[3])]))
						wait(200)
						threenum = sampTextdrawGetString(tonumber(numbersid["call"]))
					else
						phoneProcess = false
						NumberArray = nil
						onenum = nil
						twonum = nil
						threenum = nil
						fournum = nil
						fivenum = nil
						sixfnum = nil
						sevennum = nil
						nedostupen = false
						numbersid[1] = "1"
						numbersid[2] = "1"
						numbersid[3] = "1"
						numbersid[4] = "1"
						numbersid[5] = "1"
						numbersid[6] = "1"
						numbersid[7] = "1"
						numbersid[8] = "1"
						numbersid[9] = "1"
						numbersid[0] = "1"
						numbersid["callButton"] = "1"
						numbersid["call"] = "1"
						numbersid["panel"] = "1"
						numbersid["outcoming"] = "1"
						numbersid["biz"] = "1"
						break
					end
				until threenum:match("^%d%d%d$")
				repeat
					if NumberArray ~= nil then
						sampSendClickTextdraw(tonumber(numbersid[tonumber(NumberArray[4])]))
						wait(200)
						fournum = sampTextdrawGetString(tonumber(numbersid["call"]))
					else
						phoneProcess = false
						NumberArray = nil
						onenum = nil
						twonum = nil
						threenum = nil
						fournum = nil
						fivenum = nil
						sixfnum = nil
						sevennum = nil
						nedostupen = false
						numbersid[1] = "1"
						numbersid[2] = "1"
						numbersid[3] = "1"
						numbersid[4] = "1"
						numbersid[5] = "1"
						numbersid[6] = "1"
						numbersid[7] = "1"
						numbersid[8] = "1"
						numbersid[9] = "1"
						numbersid[0] = "1"
						numbersid["callButton"] = "1"
						numbersid["call"] = "1"
						numbersid["panel"] = "1"
						numbersid["outcoming"] = "1"
						numbersid["biz"] = "1"
						break
					end
				until fournum:match("^%d%d%d%d$")
				repeat
					if NumberArray ~= nil then
						sampSendClickTextdraw(tonumber(numbersid[tonumber(NumberArray[5])]))
						wait(200)
						fivenum = sampTextdrawGetString(tonumber(numbersid["call"]))
					else
						phoneProcess = false
						NumberArray = nil
						onenum = nil
						twonum = nil
						threenum = nil
						fournum = nil
						fivenum = nil
						sixfnum = nil
						sevennum = nil
						nedostupen = false
						numbersid[1] = "1"
						numbersid[2] = "1"
						numbersid[3] = "1"
						numbersid[4] = "1"
						numbersid[5] = "1"
						numbersid[6] = "1"
						numbersid[7] = "1"
						numbersid[8] = "1"
						numbersid[9] = "1"
						numbersid[0] = "1"
						numbersid["callButton"] = "1"
						numbersid["call"] = "1"
						numbersid["panel"] = "1"
						numbersid["outcoming"] = "1"
						numbersid["biz"] = "1"
						break
					end
				until fivenum:match("^%d%d%d%d%d$")
				repeat
					if NumberArray ~= nil then
						sampSendClickTextdraw(tonumber(numbersid[tonumber(NumberArray[6])]))
						wait(200)
						sixnum = sampTextdrawGetString(tonumber(numbersid["call"]))
					else
						phoneProcess = false
						NumberArray = nil
						onenum = nil
						twonum = nil
						threenum = nil
						fournum = nil
						fivenum = nil
						sixfnum = nil
						sevennum = nil
						nedostupen = false
						numbersid[1] = "1"
						numbersid[2] = "1"
						numbersid[3] = "1"
						numbersid[4] = "1"
						numbersid[5] = "1"
						numbersid[6] = "1"
						numbersid[7] = "1"
						numbersid[8] = "1"
						numbersid[9] = "1"
						numbersid[0] = "1"
						numbersid["callButton"] = "1"
						numbersid["call"] = "1"
						numbersid["panel"] = "1"
						numbersid["outcoming"] = "1"
						numbersid["biz"] = "1"
						break
					end
				until sixnum:match("^%d%d%d%d%d%d$")
				repeat
					if NumberArray ~= nil then
						sampSendClickTextdraw(tonumber(numbersid[tonumber(NumberArray[7])]))
						wait(200)
						sevennum = sampTextdrawGetString(tonumber(numbersid["call"]))
					else
						phoneProcess = false
						NumberArray = nil
						onenum = nil
						twonum = nil
						threenum = nil
						fournum = nil
						fivenum = nil
						sixfnum = nil
						sevennum = nil
						nedostupen = false
						numbersid[1] = "1"
						numbersid[2] = "1"
						numbersid[3] = "1"
						numbersid[4] = "1"
						numbersid[5] = "1"
						numbersid[6] = "1"
						numbersid[7] = "1"
						numbersid[8] = "1"
						numbersid[9] = "1"
						numbersid[0] = "1"
						numbersid["callButton"] = "1"
						numbersid["call"] = "1"
						numbersid["panel"] = "1"
						numbersid["outcoming"] = "1"
						numbersid["biz"] = "1"
						break
					end
				until sevennum:match("^%d%d%d%d%d%d%d$")
				repeat
					if phoneProcess ~= false then
						sampSendClickTextdraw(tonumber(numbersid["callButton"]))
						wait(200)
					else
						break
					end
				until sampTextdrawGetString(tonumber(numbersid["outcoming"])):find("Outcoming") or nedostupen
				if nedostupen then
					wait(50)
					sampSendChat("/phone")
				else
					waitCalling = true
				end
				phoneProcess = false
				NumberArray = nil
				onenum = nil
				twonum = nil
				threenum = nil
				fournum = nil
				fivenum = nil
				sixfnum = nil
				sevennum = nil
				nedostupen = false
				numbersid[1] = "1"
				numbersid[2] = "1"
				numbersid[3] = "1"
				numbersid[4] = "1"
				numbersid[5] = "1"
				numbersid[6] = "1"
				numbersid[7] = "1"
				numbersid[8] = "1"
				numbersid[9] = "1"
				numbersid[0] = "1"
				numbersid["callButton"] = "1"
				numbersid["call"] = "1"
				numbersid["panel"] = "1"
				numbersid["outcoming"] = "1"
				numbersid["biz"] = "1"
				break
			end
		end)
	end
end

function sampev.onSendClickTextDraw(id)
	if id == 65535 then
		if phoneProcess then
			phoneProcess = false
			NumberArray = nil
			onenum = nil
			twonum = nil
			threenum = nil
			fournum = nil
			fivenum = nil
			sixfnum = nil
			sevennum = nil
			nedostupen = false
			waitCalling = false
			calling = false
			numbersid[1] = "1"
			numbersid[2] = "1"
			numbersid[3] = "1"
			numbersid[4] = "1"
			numbersid[5] = "1"
			numbersid[6] = "1"
			numbersid[7] = "1"
			numbersid[8] = "1"
			numbersid[9] = "1"
			numbersid[0] = "1"
			numbersid["callButton"] = "1"
			numbersid["call"] = "1"
			numbersid["panel"] = "1"
			numbersid["outcoming"] = "1"
			numbersid["biz"] = "1"
			setPlayerControl(PlayerPed, true)
		end
	else
		if phoneProcess then
			sampAddChatMessage(tag .. color_text .. "Кликать по {FFFFFF}текстдравам {FFFF00}самостоятельно запрещено, когда активен процесс {FFFFFF}авто-звонка{FFFF00}!", main_color)
			return false
		end
	end
end

function callbackFunc()
	callbackAct = true
end

function sampev.onServerMessage(color, msg)
	if process then
		if msg:match("^У вас нет телефонной книжки$") then
			table.insert(nicksandnumbers, {nickse, "нет телефонной книжки", id})
			sended = true
			process = false
			sampAddChatMessage(tag .. color_text .. "У вас нет {FFFFFF}телефонной книжки{FFFF00}, необходимой для работы скрипта. Купите её в любом магазине {FFFFFF}24/7", main_color)
			return false
		elseif msg:match("^%[Ошибка%] {......}У этого игрока нет sim карты!$") then
			table.insert(nicksandnumbers, {nickse, "нет сим-карты", id})
			sended = true
			return false
		elseif msg:match("^{......}%S+%[%d+%]:    {......}%d+$") then
			local number = msg:match("^{......}%S+%[%d+%]:    {......}(%d+)$")
			table.insert(nicksandnumbers, {nickse, number, id})
			sended = true
			return false
		end
	end
	if waitCalling then
		if msg:match("^%[Информация%] {FFFFFF}Собеседник взял трубку$") then
			calling = true
			if calling then
				if chkmsg.v then
					if #FindPlayer.cfg.message ~= 0 then
						lua_thread.create(function ()
							while true do
								wait(100)
								sampSendChat(FindPlayer.cfg.message)
								break
							end
						end)
					else
						if oneKey then
							sampAddChatMessage(tag .. color_text .. "Авто-сообщение при дозвоне было включено, но не сработало, потому что сообщение {FFFFFF}пустое", main_color)
							sampAddChatMessage(tag .. color_text .. "перейди в меню скрипта, с помощью клавишы {FFFFFF}" .. keys.id_to_name(showKey) .. "{FFFF00} или команды \"{FFFFFF}/" .. cmd .. "{FFFF00}\"", main_color)
							sampAddChatMessage(tag .. color_text .. "а затем перейди во вкладку \"{FFFFFF}параметры скрипта{FFFF00}\" и впиши текст который должен будет выводиться при дозвоне в специальное поле.", main_color)
						elseif double then
							sampAddChatMessage(tag .. color_text .. "Авто-сообщение при дозвоне было включено, но не сработало, потому что сообщение {FFFFFF}пустое", main_color)
							sampAddChatMessage(tag .. color_text .. "перейди в меню скрипта, с помощью клавишы {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. "{FFFF00} или команды \"{FFFFFF}/" .. cmd .. "{FFFF00}\"", main_color)
							sampAddChatMessage(tag .. color_text .. "а затем перейди во вкладку \"{FFFFFF}параметры скрипта{FFFF00}\" и впиши текст который должен будет выводиться при дозвоне в специальное поле.", main_color)
						elseif triple then
							sampAddChatMessage(tag .. color_text .. "Авто-сообщение при дозвоне было включено, но не сработало, потому что сообщение {FFFFFF}пустое", main_color)
							sampAddChatMessage(tag .. color_text .. "перейди в меню скрипта, с помощью клавишы {FFFFFF}" .. keys.id_to_name(showKey1) .. " + " .. keys.id_to_name(showKey2) .. " + " .. keys.id_to_name(showKey3) .. "{FFFF00} или команды \"{FFFFFF}/" .. cmd .. "{FFFF00}\"", main_color)
							sampAddChatMessage(tag .. color_text .. "а затем перейди во вкладку \"{FFFFFF}параметры скрипта{FFFF00}\" и впиши текст который должен будет выводиться при дозвоне в специальное поле.", main_color)
						elseif noValue then
							sampAddChatMessage(tag .. color_text .. "Авто-сообщение при дозвоне было включено, но не сработало, потому что сообщение {FFFFFF}пустое", main_color)
							sampAddChatMessage(tag .. color_text .. "перейди в меню скрипта, с помощью клавишы {FFFFFF}КЛАВИША НЕ УКАЗАНА{FFFF00} или команды \"{FFFFFF}/" .. cmd .. "{FFFF00}\"", main_color)
							sampAddChatMessage(tag .. color_text .. "а затем перейди во вкладку \"{FFFFFF}параметры скрипта{FFFF00}\" и впиши текст который должен будет выводиться при дозвоне в специальное поле.", main_color)
						end
					end
				end
			end
		end
		if msg:match("%[Информация%] {......}Звонок окончен! Время разговора {......}%d+ секунд%.") then
			calling = false
			waitCalling = false
			lua_thread.create(function ()
				while true do
					wait(0)
					sampSendChat("/phone")
					wait(100)
					sampAddChatMessage(tag .. color_text .. "{FFFF00}Звонок был {FFFFFF}завершен{FFFF00}.", main_color)
					break
				end
			end)
		end
		if msg:match("^%[Информация%] {FFFFFF}Собеседник отменил звонок$") then
			calling = false
			waitCalling = false
			lua_thread.create(function ()
				while true do
					wait(0)
					sampSendChat("/phone")
					wait(100)
					sampAddChatMessage(tag .. color_text .. "{FFFFFF}Абонент {FFFF00}отклонил ваш звонок.", main_color)
					break
				end
			end)
		end
	end
end

function sampev.onSendCommand(cmd)
	if process then
		if not cmd:find("/number") then
			sampAddChatMessage(tag .. color_text .. "Команды {FFFFFF}запрещено {FFFF00}использовать, когда поиск людей {FFFFFF}активен{FFFF00}!", main_color)
			return false
		end
	end
	if phoneProcess then
		if not cmd:find("/phone") then
			sampAddChatMessage(tag .. color_text .. "Команды {FFFFFF}запрещено {FFFF00}использовать, когда авто-звонок {FFFFFF}активен{FFFF00}!", main_color)
			return false
		end
	end
	if calling then
		if cmd:find("/phone") then
			waitCalling = false
			calling = false
		end
	end
end

function sampev.onSendClientJoin(version, mod, nickname, challengeResponse, joinAuthKey, clientVer, challengeResponse2)
	local ip, port = sampGetCurrentServerAddress()
	local currentServer = ip .. ":" .. port
	for k, v in pairs(servers) do
		if currentServer == v then
			for i = 1, 10 do
				sampAddChatMessage(tag .. color_text .. "Сервер: {FFFFFF}Arizona Role Play: " .. k .. "{FFFF00}. Скрипт {FFFFFF}готов {FFFF00}к работе.", main_color)
			end
			break
		else
			if k == "Show Low" then
				for i = 1, 10 do
					sampAddChatMessage(tag .. color_text .. "Скрипт работает только на серверах {FFFFFF}ARIZONA GAMES{FFFF00}!", main_color)
				end
				thisScript():unload()
			end
		end
	end
end

function sampev.onShowTextDraw(id, data)
	if tostring(data.position.x) == tostring(coordinatesSamsungBIZ[1]) and tostring(data.position.y) == tostring(coordinatesSamsungBIZ[2]) then
		if id ~= tonumber(numbersid["biz"]) then
			numbersid["biz"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesSamsungBIZR[1]) and tostring(data.position.y) == tostring(coordinatesSamsungBIZR[2]) then
		if id ~= tonumber(numbersid["biz"]) then
			numbersid["biz"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesXiaomiBIZ[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiBIZ[2]) then
		if id ~= tonumber(numbersid["biz"]) then
			numbersid["biz"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesXiaomiBIZR[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiBIZR[2]) then
		if id ~= tonumber(numbersid["biz"]) then
			numbersid["biz"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesiPhoneBIZ[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneBIZ[2]) then
		if id ~= tonumber(numbersid["biz"]) then
			numbersid["biz"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesiPhoneBIZR[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneBIZR[2]) then
		if id ~= tonumber(numbersid["biz"]) then
			numbersid["biz"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesHuaweiBIZ[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiBIZ[2]) then
		if id ~= tonumber(numbersid["biz"]) then
			numbersid["biz"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesHuaweiBIZR[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiBIZR[2]) then
		if id ~= tonumber(numbersid["biz"]) then
			numbersid["biz"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesPixelBIZ[1]) and tostring(data.position.y) == tostring(coordinatesPixelBIZ[2]) then
		if id ~= tonumber(numbersid["biz"]) then
			numbersid["biz"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesPixelBIZR[1]) and tostring(data.position.y) == tostring(coordinatesPixelBIZR[2]) then
		if id ~= tonumber(numbersid["biz"]) then
			numbersid["biz"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesSamsungOutcoming[1]) and tostring(data.position.y) == tostring(coordinatesSamsungOutcoming[2]) then
		if id ~= tonumber(numbersid["outcoming"]) then
			numbersid["outcoming"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesSamsungOutcomingR[1]) and tostring(data.position.y) == tostring(coordinatesSamsungOutcomingR[2]) then
		if id ~= tonumber(numbersid["outcoming"]) then
			numbersid["outcoming"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesXiaomiOutcoming[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiOutcoming[2]) then
		if id ~= tonumber(numbersid["outcoming"]) then
			numbersid["outcoming"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesXiaomiOutcomingR[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiOutcomingR[2]) then
		if id ~= tonumber(numbersid["outcoming"]) then
			numbersid["outcoming"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesiPhoneOutcoming[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneOutcoming[2]) then
		if id ~= tonumber(numbersid["outcoming"]) then
			numbersid["outcoming"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesiPhoneOutcomingR[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneOutcomingR[2]) then
		if id ~= tonumber(numbersid["outcoming"]) then
			numbersid["outcoming"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesHuaweiOutcoming[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiOutcoming[2]) then
		if id ~= tonumber(numbersid["outcoming"]) then
			numbersid["outcoming"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesHuaweiOutcomingR[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiOutcomingR[2]) then
		if id ~= tonumber(numbersid["outcoming"]) then
			numbersid["outcoming"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesPixelOutcoming[1]) and tostring(data.position.y) == tostring(coordinatesPixelOutcoming[2]) then
		if id ~= tonumber(numbersid["outcoming"]) then
			numbersid["outcoming"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesPixelOutcomingR[1]) and tostring(data.position.y) == tostring(coordinatesPixelOutcomingR[2]) then
		if id ~= tonumber(numbersid["outcoming"]) then
			numbersid["outcoming"] = id
		end
	end
	if data.text:find("_") then
		if tostring(data.position.x) == tostring(coordinatesSamsungLine[1]) and tostring(data.position.y) == tostring(coordinatesSamsungLine[2]) then
			if id ~= tonumber(numbersid["call"]) then
				numbersid["call"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungLineR[1]) and tostring(data.position.y) == tostring(coordinatesSamsungLineR[2]) then
			if id ~= tonumber(numbersid["call"]) then
				numbersid["call"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiLine[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiLine[2]) then
			if id ~= tonumber(numbersid["call"]) then
				numbersid["call"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiLineR[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiLineR[2]) then
			if id ~= tonumber(numbersid["call"]) then
				numbersid["call"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneLine[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneLine[2]) then
			if id ~= tonumber(numbersid["call"]) then
				numbersid["call"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneLineR[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneLineR[2]) then
			if id ~= tonumber(numbersid["call"]) then
				numbersid["call"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiLine[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiLine[2]) then
			if id ~= tonumber(numbersid["call"]) then
				numbersid["call"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiLineR[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiLineR[2]) then
			if id ~= tonumber(numbersid["call"]) then
				numbersid["call"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelLine[1]) and tostring(data.position.y) == tostring(coordinatesPixelLine[2]) then
			if id ~= tonumber(numbersid["call"]) then
				numbersid["call"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelLineR[1]) and tostring(data.position.y) == tostring(coordinatesPixelLineR[2]) then
			if id ~= tonumber(numbersid["call"]) then
				numbersid["call"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungCall[1]) and tostring(data.position.y) == tostring(coordinatesSamsungCall[2]) then
			if id ~= tonumber(numbersid["callButton"]) then
				numbersid["callButton"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungCallR[1]) and tostring(data.position.y) == tostring(coordinatesSamsungCallR[2]) then
			if id ~= tonumber(numbersid["callButton"]) then
				numbersid["callButton"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiCall[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiCall[2]) then
			if id ~= tonumber(numbersid["callButton"]) then
				numbersid["callButton"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiCallR[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiCallR[2]) then
			if id ~= tonumber(numbersid["callButton"]) then
				numbersid["callButton"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneCall[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneCall[2]) then
			if id ~= tonumber(numbersid["callButton"]) then
				numbersid["callButton"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneCallR[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneCallR[2]) then
			if id ~= tonumber(numbersid["callButton"]) then
				numbersid["callButton"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiCall[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiCall[2]) then
			if id ~= tonumber(numbersid["callButton"]) then
				numbersid["callButton"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiCallR[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiCallR[2]) then
			if id ~= tonumber(numbersid["callButton"]) then
				numbersid["callButton"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelCall[1]) and tostring(data.position.y) == tostring(coordinatesPixelCall[2]) then
			if id ~= tonumber(numbersid["callButton"]) then
				numbersid["callButton"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelCallR[1]) and tostring(data.position.y) == tostring(coordinatesPixelCallR[2]) then
			if id ~= tonumber(numbersid["callButton"]) then
				numbersid["callButton"] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum1[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum1[2]) then
			if id ~= tonumber(numbersid[1]) then
				numbersid[1] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum2[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum2[2]) then
			if id ~= tonumber(numbersid[2]) then
				numbersid[2] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum3[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum3[2]) then
			if id ~= tonumber(numbersid[3]) then
				numbersid[3] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum4[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum4[2]) then
			if id ~= tonumber(numbersid[4]) then
				numbersid[4] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum5[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum5[2]) then
			if id ~= tonumber(numbersid[5]) then
				numbersid[5] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum6[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum6[2]) then
			if id ~= tonumber(numbersid[6]) then
				numbersid[6] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum7[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum7[2]) then
			if id ~= tonumber(numbersid[7]) then
				numbersid[7] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum8[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum8[2]) then
			if id ~= tonumber(numbersid[8]) then
				numbersid[8] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum9[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum9[2]) then
			if id ~= tonumber(numbersid[9]) then
				numbersid[9] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum0[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum0[2]) then
			if id ~= tonumber(numbersid[0]) then
				numbersid[0] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum1R[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum1R[2]) then
			if id ~= tonumber(numbersid[1]) then
				numbersid[1] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum2R[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum2R[2]) then
			if id ~= tonumber(numbersid[2]) then
				numbersid[2] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum3R[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum3R[2]) then
			if id ~= tonumber(numbersid[3]) then
				numbersid[3] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum4R[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum4R[2]) then
			if id ~= tonumber(numbersid[4]) then
				numbersid[4] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum5R[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum5R[2]) then
			if id ~= tonumber(numbersid[5]) then
				numbersid[5] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum6R[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum6R[2]) then
			if id ~= tonumber(numbersid[6]) then
				numbersid[6] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum7R[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum7R[2]) then
			if id ~= tonumber(numbersid[7]) then
				numbersid[7] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum8R[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum8R[2]) then
			if id ~= tonumber(numbersid[8]) then
				numbersid[8] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum9R[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum9R[2]) then
			if id ~= tonumber(numbersid[9]) then
				numbersid[9] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesSamsungNum0R[1]) and tostring(data.position.y) == tostring(coordinatesSamsungNum0R[2]) then
			if id ~= tonumber(numbersid[0]) then
				numbersid[0] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum1[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum1[2]) then
			if id ~= tonumber(numbersid[1]) then
				numbersid[1] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum2[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum2[2]) then
			if id ~= tonumber(numbersid[2]) then
				numbersid[2] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum3[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum3[2]) then
			if id ~= tonumber(numbersid[3]) then
				numbersid[3] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum4[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum4[2]) then
			if id ~= tonumber(numbersid[4]) then
				numbersid[4] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum5[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum5[2]) then
			if id ~= tonumber(numbersid[5]) then
				numbersid[5] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum6[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum6[2]) then
			if id ~= tonumber(numbersid[6]) then
				numbersid[6] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum7[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum7[2]) then
			if id ~= tonumber(numbersid[7]) then
				numbersid[7] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum8[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum8[2]) then
			if id ~= tonumber(numbersid[8]) then
				numbersid[8] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum9[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum9[2]) then
			if id ~= tonumber(numbersid[9]) then
				numbersid[9] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum0[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum0[2]) then
			if id ~= tonumber(numbersid[0]) then
				numbersid[0] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum1R[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum1R[2]) then
			if id ~= tonumber(numbersid[1]) then
				numbersid[1] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum2R[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum2R[2]) then
			if id ~= tonumber(numbersid[2]) then
				numbersid[2] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum3R[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum3R[2]) then
			if id ~= tonumber(numbersid[3]) then
				numbersid[3] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum4R[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum4R[2]) then
			if id ~= tonumber(numbersid[4]) then
				numbersid[4] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum5R[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum5R[2]) then
			if id ~= tonumber(numbersid[5]) then
				numbersid[5] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum6R[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum6R[2]) then
			if id ~= tonumber(numbersid[6]) then
				numbersid[6] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum7R[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum7R[2]) then
			if id ~= tonumber(numbersid[7]) then
				numbersid[7] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum8R[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum8R[2]) then
			if id ~= tonumber(numbersid[8]) then
				numbersid[8] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum9R[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum9R[2]) then
			if id ~= tonumber(numbersid[9]) then
				numbersid[9] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesXiaomiNum0R[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiNum0R[2]) then
			if id ~= tonumber(numbersid[0]) then
				numbersid[0] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum1[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum1[2]) then
			if id ~= tonumber(numbersid[1]) then
				numbersid[1] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum2[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum2[2]) then
			if id ~= tonumber(numbersid[2]) then
				numbersid[2] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum3[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum3[2]) then
			if id ~= tonumber(numbersid[3]) then
				numbersid[3] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum4[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum4[2]) then
			if id ~= tonumber(numbersid[4]) then
				numbersid[4] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum5[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum5[2]) then
			if id ~= tonumber(numbersid[5]) then
				numbersid[5] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum6[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum6[2]) then
			if id ~= tonumber(numbersid[6]) then
				numbersid[6] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum7[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum7[2]) then
			if id ~= tonumber(numbersid[7]) then
				numbersid[7] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum8[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum8[2]) then
			if id ~= tonumber(numbersid[8]) then
				numbersid[8] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum9[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum9[2]) then
			if id ~= tonumber(numbersid[9]) then
				numbersid[9] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum0[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum0[2]) then
			if id ~= tonumber(numbersid[0]) then
				numbersid[0] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum1R[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum1R[2]) then
			if id ~= tonumber(numbersid[1]) then
				numbersid[1] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum2R[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum2R[2]) then
			if id ~= tonumber(numbersid[2]) then
				numbersid[2] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum3R[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum3R[2]) then
			if id ~= tonumber(numbersid[3]) then
				numbersid[3] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum4R[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum4R[2]) then
			if id ~= tonumber(numbersid[4]) then
				numbersid[4] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum5R[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum5R[2]) then
			if id ~= tonumber(numbersid[5]) then
				numbersid[5] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum6R[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum6R[2]) then
			if id ~= tonumber(numbersid[6]) then
				numbersid[6] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum7R[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum7R[2]) then
			if id ~= tonumber(numbersid[7]) then
				numbersid[7] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum8R[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum8R[2]) then
			if id ~= tonumber(numbersid[8]) then
				numbersid[8] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum9R[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum9R[2]) then
			if id ~= tonumber(numbersid[9]) then
				numbersid[9] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesiPhoneNum0R[1]) and tostring(data.position.y) == tostring(coordinatesiPhoneNum0R[2]) then
			if id ~= tonumber(numbersid[0]) then
				numbersid[0] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum1[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum1[2]) then
			if id ~= tonumber(numbersid[1]) then
				numbersid[1] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum2[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum2[2]) then
			if id ~= tonumber(numbersid[2]) then
				numbersid[2] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum3[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum3[2]) then
			if id ~= tonumber(numbersid[3]) then
				numbersid[3] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum4[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum4[2]) then
			if id ~= tonumber(numbersid[4]) then
				numbersid[4] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum5[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum5[2]) then
			if id ~= tonumber(numbersid[5]) then
				numbersid[5] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum6[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum6[2]) then
			if id ~= tonumber(numbersid[6]) then
				numbersid[6] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum7[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum7[2]) then
			if id ~= tonumber(numbersid[7]) then
				numbersid[7] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum8[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum8[2]) then
			if id ~= tonumber(numbersid[8]) then
				numbersid[8] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum9[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum9[2]) then
			if id ~= tonumber(numbersid[9]) then
				numbersid[9] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum0[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum0[2]) then
			if id ~= tonumber(numbersid[0]) then
				numbersid[0] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum1R[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum1R[2]) then
			if id ~= tonumber(numbersid[1]) then
				numbersid[1] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum2R[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum2R[2]) then
			if id ~= tonumber(numbersid[2]) then
				numbersid[2] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum3R[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum3R[2]) then
			if id ~= tonumber(numbersid[3]) then
				numbersid[3] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum4R[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum4R[2]) then
			if id ~= tonumber(numbersid[4]) then
				numbersid[4] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum5R[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum5R[2]) then
			if id ~= tonumber(numbersid[5]) then
				numbersid[5] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum6R[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum6R[2]) then
			if id ~= tonumber(numbersid[6]) then
				numbersid[6] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum7R[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum7R[2]) then
			if id ~= tonumber(numbersid[7]) then
				numbersid[7] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum8R[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum8R[2]) then
			if id ~= tonumber(numbersid[8]) then
				numbersid[8] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum9R[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum9R[2]) then
			if id ~= tonumber(numbersid[9]) then
				numbersid[9] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesHuaweiNum0R[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiNum0R[2]) then
			if id ~= tonumber(numbersid[0]) then
				numbersid[0] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum1[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum1[2]) then
			if id ~= tonumber(numbersid[1]) then
				numbersid[1] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum2[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum2[2]) then
			if id ~= tonumber(numbersid[2]) then
				numbersid[2] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum3[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum3[2]) then
			if id ~= tonumber(numbersid[3]) then
				numbersid[3] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum4[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum4[2]) then
			if id ~= tonumber(numbersid[4]) then
				numbersid[4] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum5[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum5[2]) then
			if id ~= tonumber(numbersid[5]) then
				numbersid[5] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum6[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum6[2]) then
			if id ~= tonumber(numbersid[6]) then
				numbersid[6] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum7[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum7[2]) then
			if id ~= tonumber(numbersid[7]) then
				numbersid[7] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum8[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum8[2]) then
			if id ~= tonumber(numbersid[8]) then
				numbersid[8] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum9[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum9[2]) then
			if id ~= tonumber(numbersid[9]) then
				numbersid[9] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum0[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum0[2]) then
			if id ~= tonumber(numbersid[0]) then
				numbersid[0] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum1R[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum1R[2]) then
			if id ~= tonumber(numbersid[1]) then
				numbersid[1] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum2R[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum2R[2]) then
			if id ~= tonumber(numbersid[2]) then
				numbersid[2] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum3R[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum3R[2]) then
			if id ~= tonumber(numbersid[3]) then
				numbersid[3] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum4R[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum4R[2]) then
			if id ~= tonumber(numbersid[4]) then
				numbersid[4] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum5R[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum5R[2]) then
			if id ~= tonumber(numbersid[5]) then
				numbersid[5] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum6R[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum6R[2]) then
			if id ~= tonumber(numbersid[6]) then
				numbersid[6] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum7R[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum7R[2]) then
			if id ~= tonumber(numbersid[7]) then
				numbersid[7] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum8R[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum8R[2]) then
			if id ~= tonumber(numbersid[8]) then
				numbersid[8] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum9R[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum9R[2]) then
			if id ~= tonumber(numbersid[9]) then
				numbersid[9] = id
			end
		end
		if tostring(data.position.x) == tostring(coordinatesPixelNum0R[1]) and tostring(data.position.y) == tostring(coordinatesPixelNum0R[2]) then
			if id ~= tonumber(numbersid[0]) then
				numbersid[0] = id
			end
		end
	end
	if tostring(data.position.x) == tostring(coordinatesSamsungPanel[1]) and tostring(data.position.y) == tostring(coordinatesSamsungPanel[2]) then
		if id ~= tonumber(numbersid["panel"]) then
			numbersid["panel"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesSamsungPanelR[1]) and tostring(data.position.y) == tostring(coordinatesSamsungPanelR[2]) then
		if id ~= tonumber(numbersid["panel"]) then
			numbersid["panel"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesXiaomiPanel[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiPanel[2]) then
		if id ~= tonumber(numbersid["panel"]) then
			numbersid["panel"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesXiaomiPanelR[1]) and tostring(data.position.y) == tostring(coordinatesXiaomiPanelR[2]) then
		if id ~= tonumber(numbersid["panel"]) then
			numbersid["panel"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesiPhonePanel[1]) and tostring(data.position.y) == tostring(coordinatesiPhonePanel[2]) then
		if id ~= tonumber(numbersid["panel"]) then
			numbersid["panel"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesiPhonePanelR[1]) and tostring(data.position.y) == tostring(coordinatesiPhonePanelR[2]) then
		if id ~= tonumber(numbersid["panel"]) then
			numbersid["panel"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesHuaweiPanel[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiPanel[2]) then
		if id ~= tonumber(numbersid["panel"]) then
			numbersid["panel"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesHuaweiPanelR[1]) and tostring(data.position.y) == tostring(coordinatesHuaweiPanelR[2]) then
		if id ~= tonumber(numbersid["panel"]) then
			numbersid["panel"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesPixelPanel[1]) and tostring(data.position.y) == tostring(coordinatesPixelPanel[2]) then
		if id ~= tonumber(numbersid["panel"]) then
			numbersid["panel"] = id
		end
	end
	if tostring(data.position.x) == tostring(coordinatesPixelPanelR[1]) and tostring(data.position.y) == tostring(coordinatesPixelPanelR[2]) then
		if id ~= tonumber(numbersid["panel"]) then
			numbersid["panel"] = id
		end
	end
end

function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
	if dialogId == 1000 and title == "{BFBBBA}{FFFFFF}Телефоны | {ae433d}Телефоны" then
		if phoneProcess then
			sampSendDialogResponse(1000, 1, 0, nil)
			return false
		end
	end
	if dialogId == 8254 and title == "{BFBBBA}Телефонная книга" then
		if process then
			sampAddChatMessage(tag .. color_text .. "Телефонную книгу {FFFFFF}запрещено {FFFF00}использовать, когда поиск людей {FFFFFF}активен{FFFF00}!", main_color)
			return false
		end
	end
	if dialogId == 0 and text:find("{B03131}Ваш абонент вне зоны действия сети!") then
		if phoneProcess then
			nedostupen = true
			sampAddChatMessage(tag .. color_text .. "У {FFFFFF}абонента {FFFF00}отключен телефон.", main_color)
			return false
		end
	end
	if dialogId == 0 and text:match("Недостаточно средств для совершения звонка") then
		if phoneProcess then
			sampAddChatMessage(tag .. color_text .. "На Вашем телефонном счету {FFFFFF}недостаточно {FFFF00}средств для совершения звонка, {FFFFFF}необходимо пополнить баланс!", main_color)
			sampSendClickTextdraw(65535)
			return false
		end
	end
end

function onWindowMessage(msg, wparam, lparam)
    if msg == 0x0100 and phoneProcess then
    	if wparam ~= VK_ESCAPE then
        	consumeWindowMessage(true, true)
        	sampAddChatMessage(tag .. color_text .. "Нажимать на клавиши запрещено, когда процесс авто-звонка {FFFFFF}активен{FFFF00}!", main_color)
    	end
    end
end

function apply_custom_style()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4

	local r,g,b,a = rainbow(rgb_speed, 255, 0)
	local argb = join_argb(a, r, g, b)
    local a = a / 255
    local r = r / 255
    local g = g / 255
    local b = b / 255
    if rgb_style then
    	color = imgui.ImFloat3(r, g, b)
    	local clor = join_argb(0, r * 255, g * 255, b * 255)
		d1 = ('%06X'):format(clor)
		d1 = "{" .. d1 .. "}"
    else
    	color = imgui.ImFloat3(a1, b1, c1)
    	local clor = join_argb(0, a1 * 255, b1 * 255, c1 * 255)
		d1 = ('%06X'):format(clor)
		d1 = "{" .. d1 .. "}"
    end

	style.WindowPadding = imgui.ImVec2(8.0, 4.0)
	style.WindowRounding = 16.0
	style.ChildWindowRounding = 6.0
	style.FramePadding = imgui.ImVec2(4.0, 3.0)
	style.FrameRounding = 12.0
	style.ItemSpacing = imgui.ImVec2(12.0, 6.5)
	style.ItemInnerSpacing = imgui.ImVec2(4.0, 4.0)
	style.TouchExtraPadding = imgui.ImVec2(0, 0)
	style.IndentSpacing = 0
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 12.0
	style.GrabMinSize = 20.0
	style.GrabRounding = 16.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
	style.ButtonTextAlign = imgui.ImVec2(0.5, 0.15)

	if theme == 1 then
		colors[clr.Text]                   = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.TextDisabled]           = ImVec4(0.29, 0.29, 0.29, 1.00)
		colors[clr.WindowBg]               = ImVec4(1, 1, 1, 1.00)
		colors[clr.ChildWindowBg]          = ImVec4(0.22, 0.22, 0.22, 0.00)
		colors[clr.PopupBg]                = ImVec4(0, 0, 0, 0.84)
		if rgb_style then
			colors[clr.Border]                 = ImVec4(r, g, b, 1.00)
		else
			colors[clr.Border]                 = ImVec4(a1, b1, c1, 1.00)
		end
		colors[clr.BorderShadow]           = ImVec4(1.00, 1.00, 1.00, 0.00)
		colors[clr.FrameBg]                = ImVec4(0.00, 0.00, 0.00, 0.30)
		colors[clr.FrameBgHovered]         = ImVec4(0.62, 0.62, 0.62, 0.40)
		colors[clr.FrameBgActive]          = ImVec4(1.00, 1.00, 1.00, 0.46)
		if rgb_style then
			colors[clr.TitleBg]                = ImVec4(r, g, b, 0.83)
			colors[clr.TitleBgActive]          = ImVec4(r, g, b, 0.87)
			colors[clr.TitleBgCollapsed]       = ImVec4(r, g, b, 0.20)
		else
			colors[clr.TitleBg]                = ImVec4(a1, b1, c1, 0.83)
			colors[clr.TitleBgActive]          = ImVec4(a1, b1, c1, 0.87)
			colors[clr.TitleBgCollapsed]       = ImVec4(a1, b1, c1, 0.20)
		end
		colors[clr.MenuBarBg]              = ImVec4(1.00, 1.00, 1.00, 0.80)
		if rgb_style then
			colors[clr.ScrollbarBg]            = ImVec4(r, g, b, 0.50)
			colors[clr.ScrollbarGrab]          = ImVec4(r, g, b, 0.82)
			colors[clr.ScrollbarGrabHovered]   = ImVec4(r, g, b, 0.88)
			colors[clr.ScrollbarGrabActive]    = ImVec4(r, g, b, 1.0)
		else
			colors[clr.ScrollbarBg]            = ImVec4(a1, b1, c1, 0.50)
			colors[clr.ScrollbarGrab]          = ImVec4(a1, b1, c1, 0.82)
			colors[clr.ScrollbarGrabHovered]   = ImVec4(a1, b1, c1, 0.88)
			colors[clr.ScrollbarGrabActive]    = ImVec4(a1, b1, c1, 1.0)
		end
		colors[clr.ComboBg]                = ImVec4(1.00, 1.00, 1.00, 0.99)
		if rgb_style then
			colors[clr.CheckMark]              = ImVec4(r, g, b, 0.97)
		else
			colors[clr.CheckMark]              = ImVec4(a1, b1, c1, 0.97)
		end
		colors[clr.SliderGrab]             = ImVec4(0.00, 0.29, 1.00, 0.76)
		colors[clr.SliderGrabActive]       = ImVec4(0.00, 0.45, 1.00, 0.99)
		if rgb_style then
			colors[clr.Button]                 = ImVec4(r, g, b, 0.9)
			colors[clr.ButtonHovered]          = ImVec4(r, g, b, 0.5)
			colors[clr.ButtonActive]           = ImVec4(r, g, b, 1)
			colors[clr.Header]                 = ImVec4(r, g, b, 0.70)
			colors[clr.HeaderHovered]          = ImVec4(r, g, b, 0.46)
			colors[clr.HeaderActive]           = ImVec4(r, g, b, 0.80)
			colors[clr.Separator]              = ImVec4(r, g, b, 1.00)
			colors[clr.SeparatorHovered]       = ImVec4(r, g, b, 1.00)
			colors[clr.SeparatorActive]        = ImVec4(r, g, b, 1.00)
		else
			colors[clr.Button]                 = ImVec4(a1, b1, c1, 0.9)
			colors[clr.ButtonHovered]          = ImVec4(a1, b1, c1, 0.5)
			colors[clr.ButtonActive]           = ImVec4(a1, b1, c1, 1)
			colors[clr.Header]                 = ImVec4(a1, b1, c1, 0.70)
			colors[clr.HeaderHovered]          = ImVec4(a1, b1, c1, 0.46)
			colors[clr.HeaderActive]           = ImVec4(a1, b1, c1, 0.80)
			colors[clr.Separator]              = ImVec4(a1, b1, c1, 1.00)
			colors[clr.SeparatorHovered]       = ImVec4(a1, b1, c1, 1.00)
			colors[clr.SeparatorActive]        = ImVec4(a1, b1, c1, 1.00)
		end
		colors[clr.ResizeGrip]             = ImVec4(1.00, 1.00, 1.00, 0.30)
		colors[clr.ResizeGripHovered]      = ImVec4(1.00, 1.00, 1.00, 0.60)
		colors[clr.ResizeGripActive]       = ImVec4(1.00, 1.00, 1.00, 0.90)
		if rgb_style then
			colors[clr.CloseButton]            = ImVec4(r - 50, g - 50, b - 50, 0.83)
			colors[clr.CloseButtonHovered]     = ImVec4(r - 50, g - 50, b - 50, 0.6)
			colors[clr.CloseButtonActive]      = ImVec4(r - 50, g - 50, b - 50, 0.5)
		else
			colors[clr.CloseButton]            = ImVec4(a1 - 50, b1 - 50, c1 - 50, 0.83)
			colors[clr.CloseButtonHovered]     = ImVec4(a1 - 50, b1 - 50, c1 - 50, 0.6)
			colors[clr.CloseButtonActive]      = ImVec4(a1 - 50, b1 - 50, c1 - 50, 0.5)
		end
		colors[clr.PlotLines]              = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.PlotLinesHovered]       = ImVec4(0.90, 0.70, 0.00, 1.00)
		colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
		colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
		colors[clr.TextSelectedBg]         = ImVec4(0.00, 0.00, 0.00, 0.35)
		colors[clr.ModalWindowDarkening]   = ImVec4(0.20, 0.20, 0.20, 0.35)
	elseif theme == 2 then
		colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.TextDisabled]           = ImVec4(0.60, 0.60, 0.60, 1.00)
		colors[clr.WindowBg]               = ImVec4(0.08, 0.08, 0.08, 1.00)
		colors[clr.ChildWindowBg]          = ImVec4(0.00, 0.00, 0.00, 0.00)
		colors[clr.PopupBg]                = ImVec4(1, 1, 1, 0.84)
		if rgb_style then
			colors[clr.Border]                 = ImVec4(r, g, b, 1.00)
		else
			colors[clr.Border]                 = ImVec4(a1, b1, c1, 1.00)
		end
		colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
		colors[clr.FrameBg]                = ImVec4(0.80, 0.80, 0.80, 0.30)
		colors[clr.FrameBgHovered]         = ImVec4(1.00, 1.00, 1.00, 0.53)
		colors[clr.FrameBgActive]          = ImVec4(1.00, 1.00, 1.00, 0.41)
		if rgb_style then
			colors[clr.TitleBg]                = ImVec4(r, g, b, 1.00)
			colors[clr.TitleBgActive]          = ImVec4(r, g, b, 1.00)
			colors[clr.TitleBgCollapsed]       = ImVec4(r, g, b, 0.35)
		else
			colors[clr.TitleBg]                = ImVec4(a1, b1, c1, 1.00)
			colors[clr.TitleBgActive]          = ImVec4(a1, b1, c1, 1.00)
			colors[clr.TitleBgCollapsed]       = ImVec4(a1, b1, c1, 0.35)
		end
		colors[clr.MenuBarBg]              = ImVec4(1.00, 1.00, 1.00, 0.41)
		if rgb_style then
			colors[clr.ScrollbarBg]            = ImVec4(r, g, b, 0.50)
			colors[clr.ScrollbarGrab]          = ImVec4(r, g, b, 0.82)
			colors[clr.ScrollbarGrabHovered]   = ImVec4(r, g, b, 0.88)
			colors[clr.ScrollbarGrabActive]    = ImVec4(r, g, b, 1.0)
		else
			colors[clr.ScrollbarBg]            = ImVec4(a1, b1, c1, 0.50)
			colors[clr.ScrollbarGrab]          = ImVec4(a1, b1, c1, 0.82)
			colors[clr.ScrollbarGrabHovered]   = ImVec4(a1, b1, c1, 0.88)
			colors[clr.ScrollbarGrabActive]    = ImVec4(a1, b1, c1, 1.0)
		end
		colors[clr.ComboBg]                = ImVec4(0.03, 0.03, 0.03, 0.99)
		if rgb_style then
			colors[clr.CheckMark]              = ImVec4(r, g, b, 1.00)
		else
			colors[clr.CheckMark]              = ImVec4(a1, b1, c1, 1.00)
		end
		colors[clr.SliderGrab]             = ImVec4(1.00, 1.00, 1.00, 0.54)
		colors[clr.SliderGrabActive]       = ImVec4(1.00, 1.00, 1.00, 0.80)
		if rgb_style then
			colors[clr.Button]                 = ImVec4(r, g, b, 0.7)
			colors[clr.ButtonHovered]          = ImVec4(r, g, b, 1.00)
			colors[clr.ButtonActive]           = ImVec4(r, g, b, 0.5)
			colors[clr.Header]                 = ImVec4(r, g, b, 0.8)
			colors[clr.HeaderHovered]          = ImVec4(r, g, b, 0.34)
			colors[clr.HeaderActive]           = ImVec4(r, g, b, 0.74)
			colors[clr.Separator]              = ImVec4(r, g, b, 1.00)
			colors[clr.SeparatorHovered]       = ImVec4(r, g, b, 1.00)
			colors[clr.SeparatorActive]        = ImVec4(r, g, b, 1.00)
		else
			colors[clr.Button]                 = ImVec4(a1, b1, c1, 0.7)
			colors[clr.ButtonHovered]          = ImVec4(a1, b1, c1, 1.00)
			colors[clr.ButtonActive]           = ImVec4(a1, b1, c1, 0.5)
			colors[clr.Header]                 = ImVec4(a1, b1, c1, 0.8)
			colors[clr.HeaderHovered]          = ImVec4(a1, b1, c1, 0.34)
			colors[clr.HeaderActive]           = ImVec4(a1, b1, c1, 0.74)
			colors[clr.Separator]              = ImVec4(a1, b1, c1, 1.00)
			colors[clr.SeparatorHovered]       = ImVec4(a1, b1, c1, 1.00)
			colors[clr.SeparatorActive]        = ImVec4(a1, b1, c1, 1.00)
		end
		colors[clr.ResizeGrip]             = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.ResizeGripHovered]      = ImVec4(1.00, 1.00, 1.00, 0.60)
		colors[clr.ResizeGripActive]       = ImVec4(1.00, 1.00, 1.00, 1.00)
		if rgb_style then
			colors[clr.CloseButton]            = ImVec4(r - 50, g - 50, b - 50, 0.83)
			colors[clr.CloseButtonHovered]     = ImVec4(r - 50, g - 50, b - 50, 1)
			colors[clr.CloseButtonActive]      = ImVec4(r - 50, g - 50, b - 50, 0.5)
		else
			colors[clr.CloseButton]            = ImVec4(a1 - 50, b1 - 50, c1 - 50, 0.83)
			colors[clr.CloseButtonHovered]     = ImVec4(a1 - 50, b1 - 50, c1 - 50, 1)
			colors[clr.CloseButtonActive]      = ImVec4(a1 - 50, b1 - 50, c1 - 50, 0.5)
		end
		colors[clr.PlotLines]              = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.PlotLinesHovered]       = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.PlotHistogram]          = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.PlotHistogramHovered]   = ImVec4(0.00, 0.00, 0.00, 1.00)
		colors[clr.TextSelectedBg]         = ImVec4(0.00, 0.00, 0.00, 0.35)
		colors[clr.ModalWindowDarkening]   = ImVec4(0.00, 0.00, 0.00, 0.35)
	end
end

function imgui.CustomButton(name, color, colorHovered, colorActive, size)
	local clr = imgui.Col
	imgui.PushStyleColor(clr.Button, color)
	imgui.PushStyleColor(clr.ButtonHovered, colorHovered)
	imgui.PushStyleColor(clr.ButtonActive, colorActive)
	if not size then size = imgui.ImVec2(0, 0) end
	local result = imgui.Button(name, size)
	imgui.PopStyleColor(3)
	return result
end

function imgui.TextColoredRGB(text)
	local style = imgui.GetStyle()
	local colors = style.Colors
	local ImVec4 = imgui.ImVec4

	local explode_argb = function(argb)
		local a = bit.band(bit.rshift(argb, 24), 0xFF)
		local r = bit.band(bit.rshift(argb, 16), 0xFF)
		local g = bit.band(bit.rshift(argb, 8), 0xFF)
		local b = bit.band(argb, 0xFF)
		return a, r, g, b
	end

	local getcolor = function(color)
		if color:sub(1, 6):upper() == 'SSSSSS' then
			local r, g, b = colors[1].x, colors[1].y, colors[1].z
			local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
			return ImVec4(r, g, b, a / 255)
		end
		local color = type(color) == 'string' and tonumber(color, 16) or color
		if type(color) ~= 'number' then return end
		local r, g, b, a = explode_argb(color)
		return imgui.ImColor(r, g, b, a):GetVec4()
	end

	local render_text = function(text_)
		for w in text_:gmatch('[^\r\n]+') do
			local text, colors_, m = {}, {}, 1
			w = w:gsub('{(......)}', '{%1FF}')
			while w:find('{........}') do
				local n, k = w:find('{........}')
				local color = getcolor(w:sub(n + 1, k - 1))
				if color then
					text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
					colors_[#colors_ + 1] = color
					m = n
				end
				w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
			end
			if text[0] then
				for i = 0, #text do
					imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
					imgui.SameLine(nil, 0)
				end
				imgui.NewLine()
			else imgui.Text(u8(w)) end
		end
	end

	render_text(text)
end

function imgui.TextColoredRGBCenter(text)
	local style = imgui.GetStyle()
	local colors = style.Colors
	local ImVec4 = imgui.ImVec4

	local width = imgui.GetWindowWidth()
	local height = imgui.GetWindowHeight()
	local calc = imgui.CalcTextSize(text)
	imgui.SetCursorPosX( width / 2 - calc.x / 2 - 125 )
	imgui.SetCursorPosY( height / 2 - calc.y / 2 )

	local explode_argb = function(argb)
		local a = bit.band(bit.rshift(argb, 24), 0xFF)
		local r = bit.band(bit.rshift(argb, 16), 0xFF)
		local g = bit.band(bit.rshift(argb, 8), 0xFF)
		local b = bit.band(argb, 0xFF)
		return a, r, g, b
	end

	local getcolor = function(color)
		if color:sub(1, 6):upper() == 'SSSSSS' then
			local r, g, b = colors[1].x, colors[1].y, colors[1].z
			local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
			return ImVec4(r, g, b, a / 255)
		end
		local color = type(color) == 'string' and tonumber(color, 16) or color
		if type(color) ~= 'number' then return end
		local r, g, b, a = explode_argb(color)
		return imgui.ImColor(r, g, b, a):GetVec4()
	end

	local render_text = function(text_)
		for w in text_:gmatch('[^\r\n]+') do
			local text, colors_, m = {}, {}, 1
			w = w:gsub('{(......)}', '{%1FF}')
			while w:find('{........}') do
				local n, k = w:find('{........}')
				local color = getcolor(w:sub(n + 1, k - 1))
				if color then
					text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
					colors_[#colors_ + 1] = color
					m = n
				end
				w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
			end
			if text[0] then
				for i = 0, #text do
					imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
					imgui.SameLine(nil, 0)
				end
				imgui.NewLine()
			else imgui.Text(u8(w)) end
		end
	end

	render_text(text)
end

function imgui.CenterText(text)
	local width = imgui.GetWindowWidth()
	local calc = imgui.CalcTextSize(text)
	imgui.SetCursorPosX( width / 2 - calc.x / 2 )
	imgui.Text(text)
end

function imgui.CenterTextDisabled(text)
	local width = imgui.GetWindowWidth()
	local calc = imgui.CalcTextSize(text)
	imgui.SetCursorPosX( width / 2 - calc.x / 2 )
	imgui.TextDisabled(text)
end

function imgui.TextQuestion(text)
	imgui.TextDisabled('(?)')
	if imgui.IsItemHovered() then
		if theme == 1 then
			imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
		elseif theme == 2 then
			imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
		end
		imgui.BeginTooltip()
		imgui.PushTextWrapPos(550)
		imgui.TextUnformatted(text)
		imgui.PopTextWrapPos()
		imgui.EndTooltip()
		imgui.PopStyleColor()
	end
end

function join_argb(a, r, g, b)
	local argb = b  -- b
	argb = bit.bor(argb, bit.lshift(g, 8))  -- g
	argb = bit.bor(argb, bit.lshift(r, 16)) -- r
	argb = bit.bor(argb, bit.lshift(a, 24)) -- a
	return argb
end

function rainbow(speed, alpha, offset)
    local clock = os.clock() + offset
    local r = math.floor(math.sin(clock * speed) * 127 + 128)
    local g = math.floor(math.sin(clock * speed + 2) * 127 + 128)
    local b = math.floor(math.sin(clock * speed + 4) * 127 + 128)
    return r,g,b,alpha
end

local clor = join_argb(0, a1 * 255, b1 * 255, c1 * 255)
d1 = ('%06X'):format(clor)
d1 = "{" .. d1 .. "}"

function imgui.VerticalSeparator()
	local p = imgui.GetCursorScreenPos()
	imgui.GetWindowDrawList():AddLine(imgui.ImVec2(p.x, p.y), imgui.ImVec2(p.x, p.y + imgui.GetContentRegionMax().y - 33), imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.Separator]))
end

function imgui.BeforeDrawFrame()
	if fa_font == nil then
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize40 == nil then
		fontsize40 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 40.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize20 == nil then
		fontsize20 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 20.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize30 == nil then
		fontsize30 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 30.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize35 == nil then
		fontsize35 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 35.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize25 == nil then
		fontsize25 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 25.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize23 == nil then
		fontsize23 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 23.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 18.0, font_config, fa_glyph_ranges)
	end
	if fontsize18 == nil then
		fontsize18 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\comicbd.ttf', 18.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		local font_config = imgui.ImFontConfig()
		font_config.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/lib/resource/fonts/fa-solid-900.ttf', 11.0, font_config, fa_glyph_ranges)
	end
end 

function imgui.OnDrawFrame()
	imgui.Process = window.v
	apply_custom_style()
	if window.v then
		imgui.ShowCursor = true
		imgui.SetNextWindowSize(imgui.ImVec2(1350, 363), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2 - 725, sh / 2 - 181.5), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"FindPlayers", window, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoScrollWithMouse)
		imgui.PushFont(fontsize25)
		imgui.Spacing()
		imgui.BeginChild("Select", imgui.ImVec2(367, 334))
			if menuSelected == 1 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_SEARCH .. u8" поиск людей", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_SEARCH .. u8" поиск людей", imgui.ImVec2(355, 35)) then
					menuSelected = 1
				end
			end
			if menuSelected == 2 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_COG .. u8" параметры скрипта", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_COG .. u8" параметры скрипта", imgui.ImVec2(355, 35)) then
					menuSelected = 2
				end
			end
			if menuSelected == 3 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_KEYBOARD .. u8" настройки активации скрипта", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_KEYBOARD .. u8" настройки активации скрипта", imgui.ImVec2(355, 35)) then
					menuSelected = 3
				end
			end
			if menuSelected == 4 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_BAN .. u8" система игнорирования никнеймов", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_BAN .. u8" система игнорирования никнеймов", imgui.ImVec2(355, 35)) then
					menuSelected = 4
				end
			end
			if menuSelected == 5 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_PALETTE .. u8" кастомизация интерфейса", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_PALETTE .. u8" кастомизация интерфейса", imgui.ImVec2(355, 35)) then
					menuSelected = 5
				end
			end
			if menuSelected == 6 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_FOLDER_PLUS .. u8" обновления", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_FOLDER_PLUS .. u8" обновления", imgui.ImVec2(355, 35)) then
					menuSelected = 6
				end
			end
			if menuSelected == 7 then
				local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
				imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
				imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.Button(fa.ICON_FA_INFO_CIRCLE .. u8" информация о скрипте", imgui.ImVec2(355, 35))
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
			else
				if imgui.Button(fa.ICON_FA_INFO_CIRCLE .. u8" информация о скрипте", imgui.ImVec2(355, 35)) then
					menuSelected = 7
				end
			end
			if theme == 1 then
				local style = imgui.GetStyle()
				local colors = style.Colors
				local clr = imgui.Col
				local ImVec4 = imgui.ImVec4
				colors[clr.Text] = ImVec4(1.00, 1.00, 1.00, 1.00)
				if imgui.CustomButton(fa.ICON_FA_BRUSH .. u8" перейти на тёмную тему", imgui.ImVec4(0.00, 0.00, 0.00, 0.95),  imgui.ImVec4(0.00, 0.00, 0.00, 1.00), imgui.ImVec4(0.00, 0.00, 0.00, 0.8), imgui.ImVec2(355, 35))  then
					theme = 2
					FindPlayer.cfg.theme = theme
					inicfg.save(FindPlayer, "FindPlayer")
				end
				colors[clr.Text] = ImVec4(0.00, 0.00, 0.00, 1.00)
			elseif theme == 2 then
				local style = imgui.GetStyle()
				local colors = style.Colors
				local clr = imgui.Col
				local ImVec4 = imgui.ImVec4
				colors[clr.Text] = ImVec4(0.00, 0.00, 0.00, 1.00)
				if imgui.CustomButton(fa.ICON_FA_BRUSH .. u8" перейти на светлую тему", imgui.ImVec4(1.00, 1.00, 1.00, 0.8),  imgui.ImVec4(1.00, 1.00, 1.00, 1.00), imgui.ImVec4(1.00, 1.00, 1.00, 0.40), imgui.ImVec2(355, 35))  then
					theme = 1
					FindPlayer.cfg.theme = theme
					inicfg.save(FindPlayer, "FindPlayer")
				end
				colors[clr.Text] = ImVec4(1.00, 1.00, 1.00, 1.00)
			end
			imgui.Spacing()
		imgui.EndChild()
		imgui.PopFont()
		imgui.SameLine()
		imgui.VerticalSeparator()
		imgui.Spacing()
		if menuSelected == 1 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("LVLsAndNUMBERs", imgui.ImVec2(933, 323), true)
			imgui.PushFont(fontsize25)
				if not process then
					imgui.Spacing()
					if imgui.Button(fa.ICON_FA_TOGGLE_ON .. u8" начать поиск ", imgui.ImVec2(453, 35)) then
						if #nicksandnumbers ~= 0 then
							for i = 1, #nicksandnumbers do
								table.remove(nicksandnumbers, 1)
							end
							findLVLi = FindPlayer.cfg.findlvl
							findLvl()
						else
							findLVLi = FindPlayer.cfg.findlvl
							findLvl()
						end
					end
					imgui.SameLine()
					local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
					imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
					imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
					imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
					imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.PopFont()
					imgui.PushFont(fontsize25)
						imgui.Button(fa.ICON_FA_POWER_OFF .. u8" остановить поиск ", imgui.ImVec2(453, 35))
					imgui.PopFont()
					imgui.PushFont(fontsize20)
					imgui.PopStyleColor()
					imgui.PopStyleColor()
					imgui.PopStyleColor()
					imgui.PopStyleColor()
					if imgui.IsItemHovered() then
						if theme == 1 then
							imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
						elseif theme == 2 then
							imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
						end
						imgui.BeginTooltip()
						imgui.PushTextWrapPos(260)
						imgui.TextUnformatted(u8"Поиск игроков неактивен")
						imgui.PopTextWrapPos()
						imgui.EndTooltip()
						imgui.PopStyleColor()
					end
					imgui.Spacing()
					imgui.Separator()
					imgui.Spacing()
			imgui.PopFont()
			imgui.PushFont(fontsize20)
					if #nicksandnumbers ~= 0 then
						if nicksandnumbers[1][2] == "игроки не найдены" then
							imgui.TextColoredRGB("{660000}Игроки с уровнем " .. d1 .. findLVLi .. " {660000}не были найдены на сервере.")
						elseif nicksandnumbers[1][2] == "нет телефонной книжки" then
							imgui.TextColoredRGB("{660000}У вас нет " .. d1 .. "телефонной книжки{660000}, необходимой для работы скрипта, купите её в любом магазине " .. d1 .. "24/7{660000}.")
						else
							for i = 1, #nicksandnumbers do
								local style = imgui.GetStyle()
								style.FrameRounding = 0
								if theme == 1 then
									if nicksandnumbers[i][2] == "нет сим-карты" then
										imgui.TextColoredRGB("{000000}Никнейм: " .. d1 .. nicksandnumbers[i][1] .. "{000000}[" .. nicksandnumbers[i][3] .. "], уровень: " .. d1 .. findLVLi .. "{000000}, номер телефона - {660000}" .. nicksandnumbers[i][2])
										imgui.SameLine()
										imgui.PopFont()
										imgui.PushFont(fontsize18)
											local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
											a = file:read("*a")
											file:close()
											local insideTabl = decodeJson(a)
											if #insideTabl["nicks"] ~= 0 then
												local item = 1
												for _, nick in ipairs(insideTabl["nicks"]) do
													if nick == nicksandnumbers[i][1] then
														if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" из игнорирования ##" .. i, imgui.ImVec2(150, 23)) then
															local itemForDelete = 1
															for _, value in ipairs(insideTabl["nicks"]) do
																if value == nicksandnumbers[i][1] then
																	table.remove(insideTabl["nicks"], itemForDelete)
																else
																	itemForDelete = itemForDelete + 1
																end
															end
															encodedTable = encodeJson(insideTabl)
															local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
															file:write(encodedTable)
															file:flush()
															file:close()
														end
													else
														item = item + 1
														if item > #insideTabl["nicks"] then
															local pizda = 1
															if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
																table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
																encodedTable = encodeJson(insideTabl)
																local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
																file:write(encodedTable)
																file:flush()
																file:close()
															end
														end
													end
												end
											else
												if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
													table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
													encodedTable = encodeJson(insideTabl)
													local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
													file:write(encodedTable)
													file:flush()
													file:close()
												end
											end
											imgui.SameLine()
											local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
											imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
											imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
											imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
											imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
												imgui.Button(fa.ICON_FA_PHONE .. u8" позвонить##" .. i, imgui.ImVec2(100, 23))
											imgui.PopStyleColor()
											imgui.PopStyleColor()
											imgui.PopStyleColor()
											imgui.PopStyleColor()
											if imgui.IsItemHovered() then
												if theme == 1 then
													imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
												elseif theme == 2 then
													imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
												end
												imgui.BeginTooltip()
												imgui.PushTextWrapPos(230)
												imgui.TextUnformatted(u8"У игрока отсутствует сим-карта.")
												imgui.PopTextWrapPos()
												imgui.EndTooltip()
												imgui.PopStyleColor()
											end
										imgui.PopFont()
										imgui.PushFont(fontsize20)
									else
										imgui.TextColoredRGB("{000000}Никнейм: " .. d1 .. nicksandnumbers[i][1] .. "{000000}[" .. nicksandnumbers[i][3] .. "], уровень: " .. d1 .. findLVLi .. "{000000}, номер телефона - " .. d1 .. nicksandnumbers[i][2])
										imgui.SameLine()
										imgui.PopFont()
										imgui.PushFont(fontsize18)
											local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
											a = file:read("*a")
											file:close()
											local insideTabl = decodeJson(a)
											if #insideTabl["nicks"] ~= 0 then
												local item = 1
												for _, nick in ipairs(insideTabl["nicks"]) do
													if nick == nicksandnumbers[i][1] then
														if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" из игнорирования ##" .. i, imgui.ImVec2(150, 23)) then
															local itemForDelete = 1
															for _, value in ipairs(insideTabl["nicks"]) do
																if value == nicksandnumbers[i][1] then
																	table.remove(insideTabl["nicks"], itemForDelete)
																else
																	itemForDelete = itemForDelete + 1
																end
															end
															encodedTable = encodeJson(insideTabl)
															local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
															file:write(encodedTable)
															file:flush()
															file:close()
														end
													else
														item = item + 1
														if item > #insideTabl["nicks"] then
															local pizda = 1
															if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
																table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
																encodedTable = encodeJson(insideTabl)
																local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
																file:write(encodedTable)
																file:flush()
																file:close()
															end
														end
													end
												end
											else
												if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
													table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
													encodedTable = encodeJson(insideTabl)
													local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
													file:write(encodedTable)
													file:flush()
													file:close()
												end
											end
											imgui.SameLine()
											if imgui.Button(fa.ICON_FA_PHONE .. u8" позвонить##" .. i, imgui.ImVec2(100, 23)) then
												if process then
													sampAddChatMessage(tag .. color_text .. "Запрещено использовать, когда {FFFFFF}активен {FFFF00}поиск людей!", main_color)
												else
													if phoneProcess then
														sampAddChatMessage(tag .. color_text .. "Процесс {FFFFFF}авто-звонка {FFFF00}уже выполняется, подождите немного!", main_color)
													else
														if sampTextdrawIsExists(tonumber(numbersid["panel"])) and not sampTextdrawGetString(tonumber(numbersid["biz"])):match("^BIZ$") then
															sampAddChatMessage(tag .. color_text .. "Вы должны находиться в {FFFFFF}главном меню {FFFF00}телефона!", main_color)
														else
															returnNumber = nicksandnumbers[i][2]
															phone()
															sampAddChatMessage(tag .. color_text .. "Если во время {FFFFFF}авто-звонка {FFFF00}что-то пойдет ни так, попробуйте нажать {FFFFFF}ESC {FFFF00}на клавиатуре,", main_color)
															sampAddChatMessage(tag .. color_text .. "либо перезагрузить скрипт во вкладке \"{FFFFFF}параметры скрипта{FFFF00}\", через специальную кнопку", main_color)
															setPlayerControl(PlayerPed, false)
														end
													end
												end
											end
										imgui.PopFont()
										imgui.PushFont(fontsize20)
									end
								elseif theme == 2 then
									if nicksandnumbers[i][2] == "нет сим-карты" then
										imgui.TextColoredRGB("{FFFFFF}Никнейм: " .. d1 .. nicksandnumbers[i][1] .. "{FFFFFF}[" .. nicksandnumbers[i][3] .. "], уровень: " .. d1 .. findLVLi .. "{FFFFFF}, номер телефона - {660000}" .. nicksandnumbers[i][2])
										imgui.SameLine()
										imgui.PopFont()
										imgui.PushFont(fontsize18)
											local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
											a = file:read("*a")
											file:close()
											local insideTabl = decodeJson(a)
											if #insideTabl["nicks"] ~= 0 then
												local item = 1
												for _, nick in ipairs(insideTabl["nicks"]) do
													if nick == nicksandnumbers[i][1] then
														if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" из игнорирования ##" .. i, imgui.ImVec2(150, 23)) then
															local itemForDelete = 1
															for _, value in ipairs(insideTabl["nicks"]) do
																if value == nicksandnumbers[i][1] then
																	table.remove(insideTabl["nicks"], itemForDelete)
																else
																	itemForDelete = itemForDelete + 1
																end
															end
															encodedTable = encodeJson(insideTabl)
															local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
															file:write(encodedTable)
															file:flush()
															file:close()
														end
													else
														item = item + 1
														if item > #insideTabl["nicks"] then
															local pizda = 1
															if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
																table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
																encodedTable = encodeJson(insideTabl)
																local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
																file:write(encodedTable)
																file:flush()
																file:close()
															end
														end
													end
												end
											else
												if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
													table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
													encodedTable = encodeJson(insideTabl)
													local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
													file:write(encodedTable)
													file:flush()
													file:close()
												end
											end
											imgui.SameLine()
											local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
											imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
											imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
											imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
											imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
												imgui.Button(fa.ICON_FA_PHONE .. u8" позвонить##" .. i, imgui.ImVec2(100, 23))
											imgui.PopStyleColor()
											imgui.PopStyleColor()
											imgui.PopStyleColor()
											imgui.PopStyleColor()
											if imgui.IsItemHovered() then
												if theme == 1 then
													imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
												elseif theme == 2 then
													imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
												end
												imgui.BeginTooltip()
												imgui.PushTextWrapPos(230)
												imgui.TextUnformatted(u8"У игрока отсутствует сим-карта.")
												imgui.PopTextWrapPos()
												imgui.EndTooltip()
												imgui.PopStyleColor()
											end
										imgui.PopFont()
										imgui.PushFont(fontsize20)
									else
										imgui.TextColoredRGB("{FFFFFF}Никнейм: " .. d1 .. nicksandnumbers[i][1] .. "{FFFFFF}[" .. nicksandnumbers[i][3] .. "], уровень: " .. d1 .. findLVLi .. "{FFFFFF}, номер телефона - " .. d1 .. nicksandnumbers[i][2])
										imgui.SameLine()
										imgui.PopFont()
										imgui.PushFont(fontsize18)
											local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
											a = file:read("*a")
											file:close()
											local insideTabl = decodeJson(a)
											if #insideTabl["nicks"] ~= 0 then
												local item = 1
												for _, nick in ipairs(insideTabl["nicks"]) do
													if nick == nicksandnumbers[i][1] then
														if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" из игнорирования ##" .. i, imgui.ImVec2(150, 23)) then
															local itemForDelete = 1
															for _, value in ipairs(insideTabl["nicks"]) do
																if value == nicksandnumbers[i][1] then
																	table.remove(insideTabl["nicks"], itemForDelete)
																else
																	itemForDelete = itemForDelete + 1
																end
															end
															encodedTable = encodeJson(insideTabl)
															local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
															file:write(encodedTable)
															file:flush()
															file:close()
														end
													else
														item = item + 1
														if item > #insideTabl["nicks"] then
															local pizda = 1
															if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
																table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
																encodedTable = encodeJson(insideTabl)
																local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
																file:write(encodedTable)
																file:flush()
																file:close()
															end
														end
													end
												end
											else
												if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
													table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
													encodedTable = encodeJson(insideTabl)
													local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
													file:write(encodedTable)
													file:flush()
													file:close()
												end
											end
											imgui.SameLine()
											if imgui.Button(fa.ICON_FA_PHONE .. u8" позвонить##" .. i, imgui.ImVec2(100, 23)) then
												if process then
													sampAddChatMessage(tag .. color_text .. "Запрещено использовать, когда {FFFFFF}активен {FFFF00}поиск людей!", main_color)
												else
													if phoneProcess then
														sampAddChatMessage(tag .. color_text .. "Процесс {FFFFFF}авто-звонка {FFFF00}уже выполняется, подождите немного!", main_color)
													else
														if sampTextdrawIsExists(tonumber(numbersid["panel"])) and not sampTextdrawGetString(tonumber(numbersid["biz"])):match("^BIZ$") then
															sampAddChatMessage(tag .. color_text .. "Вы должны находиться в {FFFFFF}главном меню {FFFF00}телефона!", main_color)
														else
															returnNumber = nicksandnumbers[i][2]
															phone()
															sampAddChatMessage(tag .. color_text .. "Если во время {FFFFFF}авто-звонка {FFFF00}что-то пойдет ни так, попробуйте нажать {FFFFFF}ESC {FFFF00}на клавиатуре,", main_color)
															sampAddChatMessage(tag .. color_text .. "либо перезагрузить скрипт во вкладке \"{FFFFFF}параметры скрипта{FFFF00}\", через специальную кнопку", main_color)
															setPlayerControl(PlayerPed, false)
														end
													end
												end
											end
										imgui.PopFont()
										imgui.PushFont(fontsize20)
									end
								end
								style.FrameRounding = 12.0
							end
							if not process then
								imgui.TextColoredRGB("{009900}Поиск был завершён. Найдены " .. d1 .. #nicksandnumbers .. " {009900}человек(а) с уровнем " .. d1 .. findLVLi .. "{009900}.")
								imgui.Spacing()
								imgui.Separator()
								imgui.Spacing()
							end
						end
					end
				else
					imgui.Spacing()
					local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
					imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
					imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
					imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
					imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
					imgui.PopFont()
					imgui.PushFont(fontsize25)
						imgui.Button(fa.ICON_FA_TOGGLE_ON .. u8" начать поиск ", imgui.ImVec2(453, 35))
					imgui.PopFont()
					imgui.PushFont(fontsize20)
					imgui.PopStyleColor()
					imgui.PopStyleColor()
					imgui.PopStyleColor()
					imgui.PopStyleColor()
					if imgui.IsItemHovered() then
						if theme == 1 then
							imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
						elseif theme == 2 then
							imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
						end
						imgui.BeginTooltip()
						imgui.PushTextWrapPos(260)
						imgui.TextUnformatted(u8"Поиск игроков уже активен")
						imgui.PopTextWrapPos()
						imgui.EndTooltip()
						imgui.PopStyleColor()
					end
					imgui.SameLine()
					imgui.PopFont()
					imgui.PushFont(fontsize25)
					if imgui.Button(fa.ICON_FA_POWER_OFF .. u8" остановить поиск ", imgui.ImVec2(453, 35)) then
						process = false
					end
					imgui.Spacing()
					imgui.Separator()
					imgui.Spacing()
					imgui.PopFont()
					imgui.PushFont(fontsize20)
					if #nicksandnumbers ~= 0 then
						if nicksandnumbers[1][2] == "игроки не найдены" then
							imgui.TextColoredRGB("{660000}Игроки с уровнем" .. d1 .. findLVLi .. " {660000}не были найдены на сервере.")
						else
							for i = 1, #nicksandnumbers do
								local style = imgui.GetStyle()
								style.FrameRounding = 0
								if theme == 1 then
									if nicksandnumbers[i][2] == "нет сим-карты" then
										imgui.TextColoredRGB("{000000}Никнейм: " .. d1 .. nicksandnumbers[i][1] .. "{000000}[" .. nicksandnumbers[i][3] .. "], уровень: " .. d1 .. findLVLi .. "{000000}, номер телефона - {660000}" .. nicksandnumbers[i][2])
										imgui.SameLine()
										imgui.PopFont()
										imgui.PushFont(fontsize18)
											local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
											a = file:read("*a")
											file:close()
											local insideTabl = decodeJson(a)
											if #insideTabl["nicks"] ~= 0 then
												local item = 1
												for _, nick in ipairs(insideTabl["nicks"]) do
													if nick == nicksandnumbers[i][1] then
														if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" из игнорирования ##" .. i, imgui.ImVec2(150, 23)) then
															local itemForDelete = 1
															for _, value in ipairs(insideTabl["nicks"]) do
																if value == nicksandnumbers[i][1] then
																	table.remove(insideTabl["nicks"], itemForDelete)
																else
																	itemForDelete = itemForDelete + 1
																end
															end
															encodedTable = encodeJson(insideTabl)
															local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
															file:write(encodedTable)
															file:flush()
															file:close()
														end
													else
														item = item + 1
														if item > #insideTabl["nicks"] then
															local pizda = 1
															if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
																table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
																encodedTable = encodeJson(insideTabl)
																local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
																file:write(encodedTable)
																file:flush()
																file:close()
															end
														end
													end
												end
											else
												if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
													table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
													encodedTable = encodeJson(insideTabl)
													local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
													file:write(encodedTable)
													file:flush()
													file:close()
												end
											end
											imgui.SameLine()
											local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
											imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
											imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
											imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
											imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
												imgui.Button(fa.ICON_FA_PHONE .. u8" позвонить##" .. i, imgui.ImVec2(100, 23))
											imgui.PopStyleColor()
											imgui.PopStyleColor()
											imgui.PopStyleColor()
											imgui.PopStyleColor()
											if imgui.IsItemHovered() then
												if theme == 1 then
													imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
												elseif theme == 2 then
													imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
												end
												imgui.BeginTooltip()
												imgui.PushTextWrapPos(230)
												imgui.TextUnformatted(u8"У игрока отсутствует сим-карта.")
												imgui.PopTextWrapPos()
												imgui.EndTooltip()
												imgui.PopStyleColor()
											end
										imgui.PopFont()
										imgui.PushFont(fontsize20)
									else
										imgui.TextColoredRGB("{000000}Никнейм: " .. d1 .. nicksandnumbers[i][1] .. "{000000}[" .. nicksandnumbers[i][3] .. "], уровень: " .. d1 .. findLVLi .. "{000000}, номер телефона - " .. d1 .. nicksandnumbers[i][2])
										imgui.SameLine()
										imgui.PopFont()
										imgui.PushFont(fontsize18)
											local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
											a = file:read("*a")
											file:close()
											local insideTabl = decodeJson(a)
											if #insideTabl["nicks"] ~= 0 then
												local item = 1
												for _, nick in ipairs(insideTabl["nicks"]) do
													if nick == nicksandnumbers[i][1] then
														if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" из игнорирования ##" .. i, imgui.ImVec2(150, 23)) then
															local itemForDelete = 1
															for _, value in ipairs(insideTabl["nicks"]) do
																if value == nicksandnumbers[i][1] then
																	table.remove(insideTabl["nicks"], itemForDelete)
																else
																	itemForDelete = itemForDelete + 1
																end
															end
															encodedTable = encodeJson(insideTabl)
															local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
															file:write(encodedTable)
															file:flush()
															file:close()
														end
													else
														item = item + 1
														if item > #insideTabl["nicks"] then
															local pizda = 1
															if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
																table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
																encodedTable = encodeJson(insideTabl)
																local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
																file:write(encodedTable)
																file:flush()
																file:close()
															end
														end
													end
												end
											else
												if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
													table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
													encodedTable = encodeJson(insideTabl)
													local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
													file:write(encodedTable)
													file:flush()
													file:close()
												end
											end
											imgui.SameLine()
											if imgui.Button(fa.ICON_FA_PHONE .. u8" позвонить##" .. i, imgui.ImVec2(100, 23)) then
												if process then
													sampAddChatMessage(tag .. color_text .. "Запрещено использовать, когда {FFFFFF}активен {FFFF00}поиск людей!", main_color)
												else
													if phoneProcess then
														sampAddChatMessage(tag .. color_text .. "Процесс {FFFFFF}авто-звонка {FFFF00}уже выполняется, подождите немного!", main_color)
													else
														if sampTextdrawIsExists(tonumber(numbersid["panel"])) and not sampTextdrawGetString(tonumber(numbersid["biz"])):match("^BIZ$") then
															sampAddChatMessage(tag .. color_text .. "Вы должны находиться в {FFFFFF}главном меню {FFFF00}телефона!", main_color)
														else
															returnNumber = nicksandnumbers[i][2]
															phone()
															sampAddChatMessage(tag .. color_text .. "Если во время {FFFFFF}авто-звонка {FFFF00}что-то пойдет ни так, попробуйте нажать {FFFFFF}ESC {FFFF00}на клавиатуре,", main_color)
															sampAddChatMessage(tag .. color_text .. "либо перезагрузить скрипт во вкладке \"{FFFFFF}параметры скрипта{FFFF00}\", через специальную кнопку", main_color)
															setPlayerControl(PlayerPed, false)
														end
													end
												end
											end
										imgui.PopFont()
										imgui.PushFont(fontsize20)
									end
								elseif theme == 2 then
									if nicksandnumbers[i][2] == "нет сим-карты" then
										imgui.TextColoredRGB("{FFFFFF}Никнейм: " .. d1 .. nicksandnumbers[i][1] .. "{FFFFFF}[" .. nicksandnumbers[i][3] .. "], уровень: " .. d1 .. findLVLi .. "{FFFFFF}, номер телефона - {660000}" .. nicksandnumbers[i][2])
										imgui.SameLine()
										imgui.PopFont()
										imgui.PushFont(fontsize18)
											local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
											a = file:read("*a")
											file:close()
											local insideTabl = decodeJson(a)
											if #insideTabl["nicks"] ~= 0 then
												local item = 1
												for _, nick in ipairs(insideTabl["nicks"]) do
													if nick == nicksandnumbers[i][1] then
														if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" из игнорирования ##" .. i, imgui.ImVec2(150, 23)) then
															local itemForDelete = 1
															for _, value in ipairs(insideTabl["nicks"]) do
																if value == nicksandnumbers[i][1] then
																	table.remove(insideTabl["nicks"], itemForDelete)
																else
																	itemForDelete = itemForDelete + 1
																end
															end
															encodedTable = encodeJson(insideTabl)
															local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
															file:write(encodedTable)
															file:flush()
															file:close()
														end
													else
														item = item + 1
														if item > #insideTabl["nicks"] then
															local pizda = 1
															if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
																table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
																encodedTable = encodeJson(insideTabl)
																local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
																file:write(encodedTable)
																file:flush()
																file:close()
															end
														end
													end
												end
											else
												if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
													table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
													encodedTable = encodeJson(insideTabl)
													local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
													file:write(encodedTable)
													file:flush()
													file:close()
												end
											end
											imgui.SameLine()
											local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
											imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
											imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
											imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
											imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
												imgui.Button(fa.ICON_FA_PHONE .. u8" позвонить##" .. i, imgui.ImVec2(100, 23))
											imgui.PopStyleColor()
											imgui.PopStyleColor()
											imgui.PopStyleColor()
											imgui.PopStyleColor()
											if imgui.IsItemHovered() then
												if theme == 1 then
													imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
												elseif theme == 2 then
													imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
												end
												imgui.BeginTooltip()
												imgui.PushTextWrapPos(230)
												imgui.TextUnformatted(u8"У игрока отсутствует сим-карта.")
												imgui.PopTextWrapPos()
												imgui.EndTooltip()
												imgui.PopStyleColor()
											end
										imgui.PopFont()
										imgui.PushFont(fontsize20)
									else
										imgui.TextColoredRGB("{FFFFFF}Никнейм: " .. d1 .. nicksandnumbers[i][1] .. "{FFFFFF}[" .. nicksandnumbers[i][3] .. "], уровень: " .. d1 .. findLVLi .. "{FFFFFF}, номер телефона - " .. d1 .. nicksandnumbers[i][2])
										imgui.SameLine()
										imgui.PopFont()
										imgui.PushFont(fontsize18)
											local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
											a = file:read("*a")
											file:close()
											local insideTabl = decodeJson(a)
											if #insideTabl["nicks"] ~= 0 then
												local item = 1
												for _, nick in ipairs(insideTabl["nicks"]) do
													if nick == nicksandnumbers[i][1] then
														if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" из игнорирования ##" .. i, imgui.ImVec2(150, 23)) then
															local itemForDelete = 1
															for _, value in ipairs(insideTabl["nicks"]) do
																if value == nicksandnumbers[i][1] then
																	table.remove(insideTabl["nicks"], itemForDelete)
																else
																	itemForDelete = itemForDelete + 1
																end
															end
															encodedTable = encodeJson(insideTabl)
															local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
															file:write(encodedTable)
															file:flush()
															file:close()
														end
													else
														item = item + 1
														if item > #insideTabl["nicks"] then
															local pizda = 1
															if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
																table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
																encodedTable = encodeJson(insideTabl)
																local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
																file:write(encodedTable)
																file:flush()
																file:close()
															end
														end
													end
												end
											else
												if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" в игнорирование ##" .. i, imgui.ImVec2(150, 23)) then
													table.insert(insideTabl["nicks"], u8:decode(nicksandnumbers[i][1]))
													encodedTable = encodeJson(insideTabl)
													local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
													file:write(encodedTable)
													file:flush()
													file:close()
												end
											end
											imgui.SameLine()
											if imgui.Button(fa.ICON_FA_PHONE .. u8" позвонить##" .. i, imgui.ImVec2(100, 23)) then
												if process then
													sampAddChatMessage(tag .. color_text .. "Запрещено использовать, когда {FFFFFF}активен {FFFF00}поиск людей!", main_color)
												else
													if phoneProcess then
														sampAddChatMessage(tag .. color_text .. "Процесс {FFFFFF}авто-звонка {FFFF00}уже выполняется, подождите немного!", main_color)
													else
														if sampTextdrawIsExists(tonumber(numbersid["panel"])) and not sampTextdrawGetString(tonumber(numbersid["biz"])):match("^BIZ$") then
															sampAddChatMessage(tag .. color_text .. "Вы должны находиться в {FFFFFF}главном меню {FFFF00}телефона!", main_color)
														else
															returnNumber = nicksandnumbers[i][2]
															phone()
															sampAddChatMessage(tag .. color_text .. "Если во время {FFFFFF}авто-звонка {FFFF00}что-то пойдет ни так, попробуйте нажать {FFFFFF}ESC {FFFF00}на клавиатуре,", main_color)
															sampAddChatMessage(tag .. color_text .. "либо перезагрузить скрипт во вкладке \"{FFFFFF}параметры скрипта{FFFF00}\", через специальную кнопку", main_color)
															setPlayerControl(PlayerPed, false)
														end
													end
												end
											end
										imgui.PopFont()
										imgui.PushFont(fontsize20)
									end
								end
								style.FrameRounding = 12.0
							end
							imgui.TextColoredRGB("{e28b00}Процесс поиска запущен...")
							imgui.Spacing()
							imgui.Separator()
							imgui.Spacing()
							if not process then
								imgui.TextColoredRGB("{009900}Поиск был завершён. Найдены " .. d1 .. #nicksandnumbers .. " {009900}человек(а) с уровнем " .. d1 .. findLVLi .. "{009900}.")
								imgui.Spacing()
								imgui.Separator()
								imgui.Spacing()
							end
						end
					end
				end	
			imgui.PopFont()
			imgui.EndChild()
		end
		if menuSelected == 2 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("Params", imgui.ImVec2(933, 323), true, imgui.WindowFlags.NoScrollbar)
				imgui.PushFont(fontsize20)
					imgui.Text(u8"Введите ниже, какой уровень игрока скрипт должен будет искать.")
				imgui.PopFont()
				imgui.PushFont(fontsize25)
					imgui.PushItemWidth(915)
					local style = imgui.GetStyle()
					style.FrameRounding = 0
						if imgui.InputInt("", FindLVLi, 1) then
							if FindLVLi.v > 1000 then
								FindLVLi.v = 1000
							elseif FindLVLi.v < 1 then
								FindLVLi.v = 1
							end
							FindPlayer.cfg.findlvl = FindLVLi.v
							inicfg.save(FindPlayer, "FindPlayer")
						end
						imgui.Spacing()
						imgui.Separator()
						imgui.Spacing()
						imgui.PopFont()
						imgui.PushFont(fontsize20)
							if imgui.Checkbox(u8"- Отправка определённого текста в чат при дозвоне", chkmsg) then
								if chkmsg.v then
									FindPlayer.cfg.check = true
								else
									FindPlayer.cfg.check = false
								end
								inicfg.save(FindPlayer, "FindPlayer")
							end
						imgui.PopFont()
						imgui.PushFont(fontsize25)
						imgui.Spacing()
						if chkmsg.v then
							if imgui.InputText(u8"##", message) then
								if message.v:match("^%s+.+$") then
									local mes = message.v:match("^%s+(.+)$")
									message.v = mes
								end
								if message.v:match("^%s+$") then
									message.v = ""
									FindPlayer.cfg.message = ""
								else
									if #message.v == 0 then
										FindPlayer.cfg.message = ""
									else
										FindPlayer.cfg.message = u8:decode(message.v)
									end
								end
								inicfg.save(FindPlayer, "FindPlayer")
							end
							if #message.v == 0 then
								imgui.PopFont()
								imgui.PushFont(fontsize20)
								if imgui.IsItemHovered() then
									if theme == 1 then
										imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
									elseif theme == 2 then
										imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
									end
									imgui.BeginTooltip()
									imgui.PushTextWrapPos(320)
									imgui.TextUnformatted(u8"Введите сюда сообщение, которое будет ввводиться автоматически при дозвоне")
									imgui.PopTextWrapPos()
									imgui.EndTooltip()
									imgui.PopStyleColor()
								end
								imgui.PopFont()
								imgui.PushFont(fontsize25)
							end
						end
					style.FrameRounding = 12.0
					imgui.PopItemWidth()
					imgui.Spacing()
					imgui.Separator()
					imgui.Spacing()
					if imgui.Button(fa.ICON_FA_UNDO .. u8" перезагрузить скрипт", imgui.ImVec2(453, 35)) then
						thisScript():reload()
					end
					imgui.SameLine()
					if imgui.Button(fa.ICON_FA_POWER_OFF .. u8" выгрузить скрипт", imgui.ImVec2(453, 35)) then
						thisScript():unload()
					end
					imgui.SameLine()
					imgui.Spacing()
					imgui.Spacing()
					imgui.Separator()
				imgui.PopFont()
			imgui.EndChild()
		end
		if menuSelected == 3 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("Bind", imgui.ImVec2(933, 323), true, imgui.WindowFlags.NoScrollbar)
				imgui.Spacing()
				imgui.PushFont(fontsize20)
					if imgui.HotKey("##1", activeKeys, tLastKeys, 580) then
						rkeys.changeHotKey(bindKey, activeKeys.v)
						FindPlayer.cfg.bindKey = encodeJson(activeKeys.v)
						inicfg.save(FindPlayer, "FindPlayer")
					end
					imgui.SameLine()
					imgui.Text(u8"- клавиша, отвечающая за активацию окна")
					local style = imgui.GetStyle()
					style.ItemSpacing = imgui.ImVec2(0, 6.5)
					imgui.PushFont(fontsize23)
						imgui.Text("/")
					imgui.PopFont()
					imgui.SameLine()
					imgui.PushItemWidth(572)
						if imgui.InputText(u8"", command) then
							if #command.v == 0 then
								command.v = activeCmd
							else
								command.v = command.v:gsub(' ', '')
								sampUnregisterChatCommand(cmd)
								FindPlayer.cfg.command = u8:decode(command.v)
								inicfg.save(FindPlayer, "FindPlayer")
								cmd = FindPlayer.cfg.command
								activeCmd = cmd
								sampRegisterChatCommand(cmd, activation)
							end
						end
						if #command.v == 0 then
							if imgui.IsItemHovered() then
								if theme == 1 then
									imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
								elseif theme == 2 then
									imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
								end
								imgui.BeginTooltip()
								imgui.PushTextWrapPos(400)
								imgui.TextUnformatted(u8"Необходимо ввести команду, которая будет использоваться в дальнейшем для активации окна")
								imgui.PopTextWrapPos()
								imgui.EndTooltip()
								imgui.PopStyleColor()
							end
						end
					imgui.PopItemWidth()
					style.ItemSpacing = imgui.ImVec2(12.0, 6.5)
					imgui.SameLine()
					imgui.Text(u8"- команда, отвечающая за активацию окна")
				imgui.PopFont()
				imgui.PushFont(fontsize25)
				imgui.Spacing()
				imgui.Separator()
				imgui.Spacing()
					if imgui.Button(fa.ICON_FA_EJECT .. u8" сбросить команду отвечающую за активацию окна до состояния по умолчанию", imgui.ImVec2(918, 35)) then
						if cmd ~= "findplayers" then
							local lastCmd = cmd
							sampUnregisterChatCommand(cmd)
							FindPlayer.cfg.command = "findplayers"
							inicfg.save(FindPlayer, "FindPlayer")
							cmd = FindPlayer.cfg.command
							command.v = cmd
							sampRegisterChatCommand(cmd, activation)
							sampAddChatMessage(tag .. color_text .. "Команда \"{FFFFFF}/" .. lastCmd .. "{FFFF00}\", отвечающая за активацию окна была изменена на \"{FFFFFF}/" .. cmd .. "{FFFF00}\"", main_color)
						else
							sampAddChatMessage(tag .. color_text .. "Команда, отвечающая за активацию окна {FFFFFF}не была изменена{FFFF00}, так как она и так является командой по умолчанию.", main_color)
						end
					end
				imgui.PopFont()
				imgui.Spacing()
				imgui.Separator()
			imgui.EndChild()
		end
		if menuSelected == 4 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("IgnoreNicks", imgui.ImVec2(933, 323), true, imgui.WindowFlags.NoScrollbar)
			imgui.Spacing()
				imgui.PushFont(fontsize20)
					imgui.PushItemWidth(400)
					if imgui.InputText(u8"никнейм", nickIgnore) then
						nickIgnore.v = nickIgnore.v:gsub(' ', '')
					end
					imgui.PopItemWidth()
					imgui.SameLine()
					imgui.TextQuestion(u8"Данная функция отвечает за игнорирование никнеймов...\nСкрипт будет игнорировать никнеймы игроков при поиске,\nдаже если их уровень и уровень который нужно найти будут идентичны")
					imgui.SameLine()
					imgui.TextDisabled(u8"- наведи курсор на вопросик")
				imgui.PopFont()
				imgui.PushFont(fontsize25)
					if imgui.Button(fa.ICON_FA_PLUS_SQUARE .. u8" добавить никнейм в игнорирование", imgui.ImVec2(453, 35)) then
						if #nickIgnore.v == 0 then
							sampAddChatMessage(tag .. color_text .. "Поле для ввода {FFFFFF}пустое", main_color)
						else
							local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
							a = file:read("*a")
							file:close()
							local insideTabl = decodeJson(a)
							if #insideTabl["nicks"] ~= 0 then
								local i = 1
								for _,v in ipairs(insideTabl["nicks"]) do
									if u8:decode(nickIgnore.v) == v then
										sampAddChatMessage(tag .. color_text .. "Такой никнейм уже присутствует в {FFFFFF}игнорировании", main_color)
										break
									else
										i = i + 1
										if i > #insideTabl["nicks"] then
											sampAddChatMessage(tag .. color_text .. "Никнейм {FFFFFF}успешно{FFFF00} добавлен в {FFFFFF}игнорирование", main_color)
											table.insert(insideTabl["nicks"], u8:decode(nickIgnore.v))
											encodedTable = encodeJson(insideTabl)
											local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
											file:write(encodedTable)
											file:flush()
											file:close()
											break
										end
									end
								end
							else
								sampAddChatMessage(tag .. color_text .. "Никнейм {FFFFFF}успешно{FFFF00} добавлен в{FFFFFF} игнорирование", main_color)
								table.insert(insideTabl["nicks"], u8:decode(nickIgnore.v))
								encodedTable = encodeJson(insideTabl)
								local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
								file:write(encodedTable)
								file:flush()
								file:close()
							end
						end
					end
					imgui.SameLine()
					if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" удалить никнейм из игнорирования", imgui.ImVec2(453, 35)) then
						if #nickIgnore.v == 0 then
							sampAddChatMessage(tag .. color_text .. "Поле для ввода {FFFFFF}пустое", main_color)
						else
							local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
							a = file:read("*a")
							file:close()
							local i = 1
							local insideTabl = decodeJson(a)
							for _, v in ipairs(insideTabl["nicks"]) do
								if u8:decode(nickIgnore.v) == v then
									table.remove(insideTabl["nicks"], i)
									linkDeleted = true
									sampAddChatMessage(tag .. color_text .. "Никнейм {FFFFFF}успешно {FFFF00}удалён:", main_color)
									sampAddChatMessage(tag .. "{FFFFFF}" .. v, main_color)
									break
								else
									i = i + 1
								end
							end
							if not linkDeleted then
								sampAddChatMessage(tag .. color_text .. "Данный никнейм {FFFFFF}не найден{FFFF00} в {FFFFFF}игнорировании", main_color)
							else
								linkDeleted = false
							end
							encodedTable = encodeJson(insideTabl)
							local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
							file:write(encodedTable)
							file:flush()
							file:close()
						end
					end
					local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
					insideTabl = file:read("*a")
					file:close()
					local massivewithnicks = decodeJson(insideTabl)
					if #massivewithnicks["nicks"] == 0 then
						local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
						imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
						imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
						imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
						imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
						imgui.PopFont()
						imgui.PushFont(fontsize25)
							imgui.Button(fa.ICON_FA_EYE .. u8" посмотреть все никнеймы в игнорировании", imgui.ImVec2(918, 35))
						imgui.PopFont()
						imgui.PushFont(fontsize20)
						imgui.PopStyleColor()
						imgui.PopStyleColor()
						imgui.PopStyleColor()
						imgui.PopStyleColor()
						if imgui.IsItemHovered() then
							if theme == 1 then
								imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
							elseif theme == 2 then
								imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
							end
							imgui.BeginTooltip()
							imgui.PushTextWrapPos(325)
							imgui.TextUnformatted(u8"В игнорировании нет ни одного никнейма")
							imgui.PopTextWrapPos()
							imgui.EndTooltip()
							imgui.PopStyleColor()
						end
					else
						if imgui.Button(fa.ICON_FA_EYE .. u8" посмотреть все никнеймы в игнорировании", imgui.ImVec2(918, 35)) then
							local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
							local a = file:read("*a")
							file:close()
							sampAddChatMessage(tag .. color_text .. "Ниже в ряд будут {FFFFFF}показаны{FFFF00} все никнеймы, которые находятся в {FFFFFF}игнорировании", main_color)
							local allnicks = decodeJson(a)
							for _, v in ipairs(allnicks["nicks"]) do
								sampAddChatMessage(tag .. "{FFFFFF}" .. v, main_color)
							end
							sampAddChatMessage(tag .. color_text .. "Сейчас в {FFFFFF}игнорировании {FFFF00}находится {FFFFFF}" .. #allnicks["nicks"] .. " {FFFF00}никнеймов", main_color)
						end
					end
					if #massivewithnicks["nicks"] == 0 then
						local r, g, b, a = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()
						imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, a/2) )
						imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, a/2))
						imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, a/2))
						imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
						imgui.PopFont()
						imgui.PushFont(fontsize25)
							imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" удалить все никнеймы из игнорирования", imgui.ImVec2(918, 35))
						imgui.PopFont()
						imgui.PushFont(fontsize20)
						imgui.PopStyleColor()
						imgui.PopStyleColor()
						imgui.PopStyleColor()
						imgui.PopStyleColor()
						if imgui.IsItemHovered() then
							if theme == 1 then
								imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
							elseif theme == 2 then
								imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
							end
							imgui.BeginTooltip()
							imgui.PushTextWrapPos(325)
							imgui.TextUnformatted(u8"В игнорировании нет ни одного никнейма")
							imgui.PopTextWrapPos()
							imgui.EndTooltip()
							imgui.PopStyleColor()
						end
					else
						if imgui.Button(fa.ICON_FA_MINUS_SQUARE .. u8" удалить все никнеймы из игнорирования", imgui.ImVec2(918, 35)) then
							local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "r")
							a = file:read("*a")
							file:close()
							local insideTabl = decodeJson(a)
							if #insideTabl["nicks"] ~= 0 then
								local count = #insideTabl["nicks"]
								for i = 1, count do
									table.remove(insideTabl["nicks"], 1)
								end
								sampAddChatMessage(tag .. color_text .. "Все никнеймы из {FFFFFF}игнорирования {FFFF00}были{FFFFFF} успешно {FFFF00}удалены", main_color)
								encodedTable = encodeJson(insideTabl)
								local file = io.open(MoonFolder .."\\config\\FindPlayer.json", "w")
								file:write(encodedTable)
								file:flush()
								file:close()
							else
								sampAddChatMessage(tag .. color_text .. "В {FFFFFF}игнорировании {FFFF00}нет ни одного никнейма", main_color)
							end
						end
					end
					imgui.Spacing()
					imgui.Separator()
					imgui.Spacing()
				imgui.PopFont()
			imgui.EndChild()
		end
		if menuSelected == 5 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("Customization", imgui.ImVec2(933, 323), true, imgui.WindowFlags.NoScrollbar)
			imgui.Spacing()
				imgui.PushFont(fontsize20)
					imgui.PushItemWidth(400)
					local style = imgui.GetStyle()
					local colors = style.Colors
					local clr = imgui.Col
					local ImVec4 = imgui.ImVec4
					if theme == 1 then
						imgui.PushStyleColor(imgui.Col.PopupBg, imgui.ImVec4(0.08, 0.08, 0.08, 1))
						imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
						imgui.PushStyleColor(imgui.Col.FrameBg, imgui.ImVec4(0.2, 0.2, 0.2, 1))
					elseif theme == 2 then
						imgui.PushStyleColor(imgui.Col.PopupBg, imgui.ImVec4(1, 1, 1, 1))
						imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
						imgui.PushStyleColor(imgui.Col.FrameBg, imgui.ImVec4(0.8, 0.8, 0.8, 1))
					end
					if imgui.ColorEdit3("##1337", color) then
						local clr = join_argb(0, color.v[1] * 255, color.v[2] * 255, color.v[3] * 255)
						a1 = string.format('%.2f', color.v[1])
						b1 = string.format('%.2f', color.v[2])
						c1 = string.format('%.2f', color.v[3])
						d1 = ('%06X'):format(clr)
						d1 = "{" .. d1 .. "}"
						changeColor = true
						rgb_style = false
						local style = imgui.GetStyle()
						local colors = style.Colors
						local clr = imgui.Col
						local ImVec4 = imgui.ImVec4
						colors[clr.CheckMark] = ImVec4(a1, b1, c1, 0.97)
					end
					imgui.PopItemWidth()
					imgui.PopStyleColor()
					imgui.PopStyleColor()
					imgui.PopStyleColor()
					imgui.SameLine()
					imgui.Text(u8"-  Изменить цвет стиля")
				imgui.PopFont()
				imgui.PushFont(fontsize25)
					if imgui.Button(fa.ICON_FA_SAVE .. u8" сохранить новый стиль в конфиг", imgui.ImVec2(918, 35)) then
						if changeColor then
							if rgb_style then
								sampAddChatMessage(tag .. color_text .. "Новый {ff4c5b}R{99ff99}G{00ffff}B{FFFFFF} СТИЛЬ {FFFF00}успешно {FFFFFF}сохранен {FFFF00}в конфиг", main_color)
								FindPlayer.cfg.rgb_style = true
								inicfg.save(FindPlayer, "FindPlayer")
							else
								sampAddChatMessage(tag .. color_text .. "Новый " .. d1 .. "СТИЛЬ {FFFF00}успешно {FFFFFF}сохранен {FFFF00}в конфиг", main_color)
								FindPlayer.cfg.color1 = a1
								FindPlayer.cfg.color2 = b1
								FindPlayer.cfg.color3 = c1
								inicfg.save(FindPlayer, "FindPlayer")
							end
						else
							sampAddChatMessage(tag .. color_text .. "Сначала необходимо {FFFFFF}изменить {FFFF00}цвет", main_color)
						end
					end
					if imgui.Button(fa.ICON_FA_EJECT .. u8" сбросить до стиля по умолчанию", imgui.ImVec2(918, 35)) then
						sampAddChatMessage(tag .. color_text .. "Стиль сброшен до состояния по умолчанию и{FFFF00} успешно {FFFFFF}сохранен {FFFF00}в конфиг", main_color)
						FindPlayer.cfg.color1 = 0.00
						FindPlayer.cfg.color2 = 0.49
						FindPlayer.cfg.color3 = 1.00
						rgb_style = false
						FindPlayer.cfg.rgb_style = false
						a1 = 0.00
						b1 = 0.49
						c1 = 1.00
						local clr = join_argb(0, a1 * 255, b1 * 255, c1 * 255)
						d1 = ('%06X'):format(clr)
						d1 = "{" .. d1 .. "}"
						color = imgui.ImFloat3(a1, b1, c1)
						inicfg.save(FindPlayer, "FindPlayer")
					end
					if not rgb_style then
						local r,g,b,a = rainbow(rgb_speed, 255, 0)
						local argb = join_argb(a, r, g, b)
    					local a = a / 255
    					local r = r / 255
    					local g = g / 255
    					local b = b / 255
						if imgui.CustomButton(fa.ICON_FA_PAINT_ROLLER .. u8" RGB стиль", imgui.ImVec4(r, g, b, 0.95),  imgui.ImVec4(r, g, b, 1.00), imgui.ImVec4(r, g, b, 0.8), imgui.ImVec2(918, 35)) then
							sampAddChatMessage(tag .. color_text .. "{ff4c5b}R{99ff99}G{00ffff}B{FFFFFF} стиль {FFFF00}успешно {FFFFFF}применен{FFFF00}, но НЕ сохранен в конфиг", main_color)
							rgb_style = true
							changeColor = true
						end
					else
						local r,g,b,a = rainbow(rgb_speed, 255, 0)
						local argb = join_argb(a, r, g, b)
    					local a = a / 255
    					local r = r / 255
    					local g = g / 255
    					local b = b / 255
						imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
						imgui.PopFont()
						imgui.PushFont(fontsize25)
							imgui.CustomButton(fa.ICON_FA_PAINT_ROLLER .. u8" RGB стиль", imgui.ImVec4(r, g, b, 0.3),  imgui.ImVec4(r, g, b, 0.3), imgui.ImVec4(r, g, b, 0.3), imgui.ImVec2(918, 35))
						imgui.PopFont()
						imgui.PushFont(fontsize20)
						imgui.PopStyleColor()
						if imgui.IsItemHovered() then
							if theme == 1 then
								imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.00, 1.00, 1.00, 1.00))
								imgui.PushStyleColor(imgui.Col.PopupBg, imgui.ImVec4(0, 0, 0, 0.84))
							elseif theme == 2 then
								imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
								imgui.PushStyleColor(imgui.Col.PopupBg, imgui.ImVec4(1, 1, 1, 0.84))
							end
							imgui.BeginTooltip()
							imgui.PushTextWrapPos(325)
							imgui.TextUnformatted(u8"RGB стиль уже активирован")
							imgui.PopTextWrapPos()
							imgui.EndTooltip()
							imgui.PopStyleColor()
							imgui.PopStyleColor()
						end
					end
					imgui.Spacing()
					imgui.Separator()
					imgui.Spacing()
				imgui.PopFont()
			imgui.EndChild()
		end
		if menuSelected == 6 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("UpdateMN", imgui.ImVec2(933, 323), true, imgui.WindowFlags.NoScrollbar)
				imgui.PushFont(fontsize25)
				imgui.Spacing()
					if imgui.Button(fa.ICON_FA_CLOUD_UPLOAD_ALT .. u8" проверить наличие обновлений", imgui.ImVec2(918, 35)) then
						if not checkupd then
							sampAddChatMessage(tag .. color_text .. "{FFFFFF}Проверяем {FFFF00}наличие обновлений...", main_color)
							downloadUrlToFile(update_url, update_path, function(id, status)
								if status == dlstatus.STATUS_ENDDOWNLOADDATA then
									checkupd = true
									updateIni = inicfg.load(nil, update_path)
									if tonumber(updateIni.info.vers) > script_vers then
										sampAddChatMessage(tag .. color_text .. "Есть {FFFFFF}обновление{FFFF00}! Новая версия: {FFFFFF}" .. updateIni.info.vers_text .."{FFFF00}. Текущая версия: {FFFFFF}".. script_vers_text .. "{FFFF00}.", main_color)
										sampAddChatMessage(tag .. color_text .. "Чтобы {FFFFFF}установить{FFFF00} обновление, необходимо перейти в раздел {FFFFFF}\"обновления\"{FFFF00} в меню скрипта", main_color)
										mbobnova = true
										checkupd = false
									else
										checkupd = false
										sampAddChatMessage(tag .. color_text .. "Обновлений {FFFFFF}не найдено{FFFF00}.", main_color)
									end
									os.remove(update_path)
									checkupd = false
								end
							end)
						else
							sampAddChatMessage(tag .. color_text .. "Повторите проверку на наличие обновлений чуть {FFFFFF}позже{FFFF00}! Сейчас уже проходит данная проверка.", main_color)
						end
					end
					if imgui.Button(fa.ICON_FA_DOWNLOAD .. u8" обновить", imgui.ImVec2(918, 35)) then
						if mbobnova then
							sampAddChatMessage(tag .. color_text .. "Начинаю {FFFFFF}устанавливать {FFFF00}найденное обновление", main_color)
							window.v = not window.v
							imgui.Process = window.v
							obnova = true
						else
							sampAddChatMessage(tag .. color_text .. "Обновлений {FFFFFF}не найдено{FFFF00}.", main_color)
						end
					end
					if imgui.Button(fa.ICON_FA_HISTORY .. u8" история обновлений", imgui.ImVec2(918, 35)) then
						sampShowDialog(1337, "{FFFF00}История обновлений скрипта {FFFFFF}FindPlayers", "{FFFF00}Версия {FFFFFF}1.0{FFFF00}:\n{FFFFFF}- Релиз {808080}(дата выхода: {a5a5a5}28.10.21{808080}\n{FFFF00}Версия {FFFFFF}1.1{FFFF00}:\n{FFFFFF}- Исправлены некоторые ошибки {808080}(дата выхода: {a5a5a5}28.10.21{808080})                       ", "{ff0000}Закрыть", nil, DIALOG_STYLE_MSGBOX)
						window.v = false
						windowActive = true
					end
					imgui.Spacing()
					imgui.Separator()
					imgui.Spacing()
				imgui.PopFont()
			imgui.EndChild()
		end
		if menuSelected == 7 then
			imgui.SameLine()
			imgui.Spacing()
			imgui.SameLine()
			imgui.BeginChild("InfoOfScript", imgui.ImVec2(933, 323), true, imgui.WindowFlags.NoScrollbar)
				imgui.PushFont(fontsize20)
					if theme == 1 then
						if page == 1 then
							imgui.TextColoredRGB("" .. d1 .. "Скрипт {000000}FindPlayers " .. d1 .. "был создан для удобного поиска людей с определённым уровнем по всему серверу. Как только скрипт\n" .. d1 .. "находит человека с нужным уровнем, он автоматически получает его {000000}айди" .. d1 .. ", {000000}ник-нейм" .. d1 .. ", а также {000000}номер телефона" .. d1 .. ", а затем\n" .. d1 .. "выводит всю эту информацию в окне. В этом же окне через специальные кнопки можно {000000}звонить игроку " .. d1 .. "(если у него есть \n" .. d1 .. "сим-карта) и {000000}редактировать систему игнорирования никнеймов " .. d1 .. "(по другому - чёрный список для никнеймов)\n" .. d1 .. "Для того, чтобы скрипт начал искать людей по серверу с нужным уровнем, достаточно перейти в раздел {000000}\"поиск людей\"\n" .. d1 .. "и нажать на специальную кнопку. По умолчанию скрипт будет искать лишь людей с {000000}1-ым" .. d1 .. " уровнем, но изменить это\n" .. d1 .. "можно в разделе {000000}\"параметры скрипта\"" .. d1 .. ". Также в этом разделе можно: {000000}настроить отправку сообщения при дозвоне до игрока" .. d1 .. ",\n{000000}перезагрузить скрипт" .. d1 .. " и {000000}выгрузить скрипт полностью" .. d1 .. ". Для того, чтобы изменить {000000}бинд" .. d1 .. ", либо {000000}команду активации окна " .. d1 .. "скрипта,\n" .. d1 .. "достаточно перейти в раздел {000000}\"настройки активации скрипта\"" .. d1 .. ", и уже там настроить всё по своему. В разделе {000000}\"система\nигнорирования никнеймов\"" .. d1 .. " можно: {000000}посмотреть все никнеймы находящиеся в игнорировании" .. d1 .. ", {000000}удалить все никнеймы из\nигнорирования" .. d1 .. ", {000000}добавить никнейм в игнорирование" .. d1 .. " и {000000}удалить никнейм из игнорирования" .. d1 .. ". Данная функция отвечает за\n" .. d1 .. "игорирование определённых игроков при поиске, даже если их уровень соответствует нужному.")
							imgui.SameLine()
							if imgui.Button(fa.ICON_FA_FORWARD .. u8" следующая страница", imgui.ImVec2(205, 25)) then
								page = 2
							end
						elseif page == 2 then
							imgui.TextColoredRGB("" .. d1 .. "Если же вам надоела стандартная цветовая схема в скрипте, вы можете перейти в раздел {000000}\"кастомизация интерфейса\"" .. d1 .. ", и уже\n" .. d1 .. "там полностью изменить всю цветовую схему, а также активировать {000000}RGB стиль" .. d1 .. " с переливанием всех цветов. Ну и кончено\n" .. d1 .. "же нельзя забывать о таком разделе, как {000000}\"обновления\"" .. d1 .. ". В этом разделе можно: {000000}проверить наличие обновления" .. d1 .. ", {000000}обновить\nскрипт " .. d1 .. "(если обновление доступно), а также посмотреть {000000}историю всех обновлений этого скрипта" .. d1 .. ".\n" .. d1 .. "Автор скрипта: {000000}https://vk.com/klamet1/" .. d1 .. ". Если вы нашли какой либо {000000}баг" .. d1 .. ", просто хотите выразить {000000}благодарность" .. d1 .. " или заказать\n" .. d1 .. "какой либо {000000}скрипт" .. d1 .. ", вы можете это сделать во {000000}ВКонтакте\n" .. d1 .. "Также автор принимает и {000000}материальную благодарность" .. d1 .. ". Вы можете оформить перевод средств на мой {000000}QIWI кошелек " .. d1 .. "по\nникнейму" .. d1 .. ", мой никнейм в {000000}QIWI" .. d1 .. " кошельке: {000000}HADIV201" .. d1 .. ".\n{000000}Спасибо " .. d1 .. "за использование моего скрипта. {000000}Надеюсь" .. d1 .. ", что он будет приносить лишь пользу.")
							imgui.SameLine()
							if imgui.Button(fa.ICON_FA_BACKWARD .. u8" предыдущая страница", imgui.ImVec2(205, 25)) then
								page = 1
							end
							imgui.PopFont()
							imgui.PushFont(fontsize25)
							imgui.Spacing()
							imgui.Separator()
							imgui.Spacing()
							imgui.Spacing()
							if imgui.Button(fa.ICON_FA_GLOBE .. u8" связаться с автором", imgui.ImVec2(453, 35)) then
								os.execute("start www.vk.com/klamet1")
							end
							imgui.SameLine()
							if imgui.Button(fa.ICON_FA_USERS .. u8" тема с этим скриптом на форуме BlastHack", imgui.ImVec2(453, 35)) then
								os.execute("start www.blast.hk")
							end
							imgui.PopFont()
							imgui.PushFont(fontsize20)
						end
					elseif theme == 2 then
						if page == 1 then
							imgui.TextColoredRGB("" .. d1 .. "Скрипт {FFFFFF}FindPlayers " .. d1 .. "был создан для удобного поиска людей с определённым уровнем по всему серверу. Как только скрипт\n" .. d1 .. "находит человека с нужным уровнем, он автоматически получает его {FFFFFF}айди" .. d1 .. ", {FFFFFF}ник-нейм" .. d1 .. ", а также {FFFFFF}номер телефона" .. d1 .. ", а затем\n" .. d1 .. "выводит всю эту информацию в окне. В этом же окне через специальные кнопки можно {FFFFFF}звонить игроку " .. d1 .. "(если у него есть \n" .. d1 .. "сим-карта) и {FFFFFF}редактировать систему игнорирования никнеймов " .. d1 .. "(по другому - чёрный список для никнеймов)\n" .. d1 .. "Для того, чтобы скрипт начал искать людей по серверу с нужным уровнем, достаточно перейти в раздел {FFFFFF}\"поиск людей\"\n" .. d1 .. "и нажать на специальную кнопку. По умолчанию скрипт будет искать лишь людей с {FFFFFF}1-ым" .. d1 .. " уровнем, но изменить это\n" .. d1 .. "можно в разделе {FFFFFF}\"параметры скрипта\"" .. d1 .. ". Также в этом разделе можно: {FFFFFF}настроить отправку сообщения при дозвоне до игрока" .. d1 .. ",\n{FFFFFF}перезагрузить скрипт" .. d1 .. " и {FFFFFF}выгрузить скрипт полностью" .. d1 .. ". Для того, чтобы изменить {FFFFFF}бинд" .. d1 .. ", либо {FFFFFF}команду активации окна " .. d1 .. "скрипта,\n" .. d1 .. "достаточно перейти в раздел {FFFFFF}\"настройки активации скрипта\"" .. d1 .. ", и уже там настроить всё по своему. В разделе {FFFFFF}\"система\nигнорирования никнеймов\"" .. d1 .. " можно: {FFFFFF}посмотреть все никнеймы находящиеся в игнорировании" .. d1 .. ", {FFFFFF}удалить все никнеймы из\nигнорирования" .. d1 .. ", {FFFFFF}добавить никнейм в игнорирование" .. d1 .. " и {FFFFFF}удалить никнейм из игнорирования" .. d1 .. ". Данная функция отвечает за\n" .. d1 .. "игорирование определённых игроков при поиске, даже если их уровень соответствует нужному.")
							imgui.SameLine()
							if imgui.Button(fa.ICON_FA_FORWARD .. u8" следующая страница", imgui.ImVec2(205, 25)) then
								page = 2
							end
						elseif page == 2 then
							imgui.TextColoredRGB("" .. d1 .. "Если же вам надоела стандартная цветовая схема в скрипте, вы можете перейти в раздел {FFFFFF}\"кастомизация интерфейса\"" .. d1 .. ", и уже\n" .. d1 .. "там полностью изменить всю цветовую схему, а также активировать {FFFFFF}RGB стиль" .. d1 .. " с переливанием всех цветов. Ну и кончено\n" .. d1 .. "же нельзя забывать о таком разделе, как {FFFFFF}\"обновления\"" .. d1 .. ". В этом разделе можно: {FFFFFF}проверить наличие обновления" .. d1 .. ", {FFFFFF}обновить\nскрипт " .. d1 .. "(если обновление доступно), а также посмотреть {FFFFFF}историю всех обновлений этого скрипта" .. d1 .. ".\n" .. d1 .. "Автор скрипта: {FFFFFF}https://vk.com/klamet1/" .. d1 .. ". Если вы нашли какой либо {FFFFFF}баг" .. d1 .. ", просто хотите выразить {FFFFFF}благодарность" .. d1 .. " или заказать\n" .. d1 .. "какой либо {FFFFFF}скрипт" .. d1 .. ", вы можете это сделать во {FFFFFF}ВКонтакте\n" .. d1 .. "Также автор принимает и {FFFFFF}материальную благодарность" .. d1 .. ". Вы можете оформить перевод средств на мой {FFFFFF}QIWI кошелек " .. d1 .. "по\nникнейму" .. d1 .. ", мой никнейм в {FFFFFF}QIWI" .. d1 .. " кошельке: {FFFFFF}HADIV201" .. d1 .. ".\n{FFFFFF}Спасибо " .. d1 .. "за использование моего скрипта. {FFFFFF}Надеюсь" .. d1 .. ", что он будет приносить лишь пользу.")
							imgui.SameLine()
							if imgui.Button(fa.ICON_FA_BACKWARD .. u8" предыдущая страница", imgui.ImVec2(205, 25)) then
								page = 1
							end
							imgui.PopFont()
							imgui.PushFont(fontsize25)
							imgui.Spacing()
							imgui.Separator()
							imgui.Spacing()
							imgui.Spacing()
							if imgui.Button(fa.ICON_FA_GLOBE .. u8" связаться с автором", imgui.ImVec2(453, 35)) then
								os.execute("start www.vk.com/klamet1")
							end
							imgui.SameLine()
							if imgui.Button(fa.ICON_FA_USERS .. u8" тема с этим скриптом на форуме BlastHack", imgui.ImVec2(453, 35)) then
								os.execute("start www.blast.hk/threads/106115/")
							end
							imgui.PopFont()
							imgui.PushFont(fontsize20)
						end
					end
				imgui.PopFont()
			imgui.EndChild()
		end
		imgui.End()
	end
end