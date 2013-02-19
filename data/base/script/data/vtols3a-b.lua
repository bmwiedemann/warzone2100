-- Generated by wz2lua (data file)
version(0) -- version of the script API this script is written for
-- slo: "vtols.slo"




-- don't add any pads but setup the pad player
padPlayer = 3
-- MAX = 5
numPads = 0

-- set up the no vis targetting
player = 0
noVisTargetting = true

-- vtol groups - MAX 4
numGroups = 3

-- place to put VTOLS
groupX = {}
groupX[0] = 832
groupY = {}
groupY[0] = 6464
-- number of droids in group
VTOLsize = {}
VTOLsize[0] = 4
templates = {}
templates[0] = "NX-M-Bomb2-VTOL"
-- 0 - droid, 1 - structure
targetObjType = {}
targetObjType[0] = 1
-- 2min	(*10secs)
startTime = {}
startTime[0] = 12
-- 7mins(*10secs)
everyTime = {}
everyTime[0] = 42

-- place to put VTOLS
groupX[1] = 832
groupY[1] = 6464
-- number of droids in group
VTOLsize[1] = 4
templates[1] = "NX-M-Bomb2-VTOL"
-- 0 - droid, 1 - structure
targetObjType[1] = 1
-- 5min	(*10secs)
startTime[1] = 30
-- 7min	(*10secs)
everyTime[1] = 42

-- place to put VTOLS
groupX[2] = 832
groupY[2] = 6464
-- number of droids in group
VTOLsize[2] = 5
templates[2] = "NX-M-Bomb4-VTOL"
-- 0 - droid, 1 - structure
targetObjType[2] = 1
-- 10min	(*10secs)
startTime[2] = 60
-- 7mins(*10secs)
everyTime[2] = 42

--[[groupX		[3]	int		832			//place to put VTOLS
groupY		[3]	int		6464
VTOLsize	[3]	int		2			//number of droids in group
templates	[3]	TEMPLATE	"NX-L-Missile-A-T-VTOL"
targetObjType	[3]	int		1		// 0 - droid, 1 - structure
startTime	[3]	int		540	//90min	(*10secs)
everyTime	[3]	int		48	//8mins(*10secs)]]--
-- HQbuilding	STRUCTUREID	1180			//HQ when destroyed stops VTOLS
-- don't use an ID for stopping VTOLS
dontStopFlag = true

vanishX = 1
vanishY = 80

-- preferred targets (max 4 each struc/droid)
numPrefStruc = 4
-- DEF_IDF
prefStruc = {}
prefStruc[0] = 16384
-- Sensors
prefStruc[1] = 2048
-- Rearm Pads
prefStruc[2] = 1024
-- DEF_GROUND
prefStruc[3] = 4096


numPrefDroid = 0

--run the code
dofile('vtols_logic.lua')