-- Generated by wz2lua (implementation file)
version(0) --- version of the script API this script is written for
enemy = 0
-- public		INTMESSAGE	MissionBrief;
incomingSnd = nil
-- Structure Limits
-- starting Tech
numTechs = 0
startTech = Array(10)
count = 0
newColour = 0
temp = 0
oldColour = 0
objectDroid = nil
viewerDroid = nil
objectObj = nil
viewerObj = nil

-- delay between "incoming.." and brief.
-- 10 second delay

function start()
	count = 0
	while count < numStrucStats1 do
		setStructureLimits(strucStat[count], strucLimit[count], player)
		enableStructure(strucStat[count], player)
		count = count + 1
	end
	
	-- don't let player see his base on 3A!!!
	-- (0, 140, 64, 192);
	setScrollParams(0, 137, 64, 192)
	-- set position for limbo units for this map
	setLimboLanding(limboX1, limboY1, limboX2, limboY2)
	
	createAlliance(player, curPlayer)
	newColour = getPlayerColour(player)
	
	-- store the old colour so we can reset it later
	oldColour = getPlayerColour(curPlayer)
	
	-- make curPlayer units player colour
	setPlayerColour(newColour, curPlayer)
	-- give gamma base starting tech
	count = 0
	while count < numTechs do
		completeResearch(startTech[count], curPlayer)
		count = count + 1
	end
end
callbackEvent(start, CALL_GAMEINIT)


-- has player found gamma base (after briefing)
function seen()
	deactivateEvent(betaDead)
	-- give player briefing
	-- don't use briefing anymore!!!
	-- addMessage(MissionBrief, MISS_MSG, 0, true);
	playSound(rescuedSnd, player)
	
	count = 0
	while count < numRegions do
		takeOverDroidsInArea(curPlayer, player, RegionsX1[count], RegionsY1[count], RegionsX2[count], RegionsY2[count])
		takeOverStructsInArea(curPlayer, player, RegionsX1[count], RegionsY1[count], RegionsX2[count], RegionsY2[count])
		count = count + 1
	end
	C.extraVictoryFlag = true
	-- allow access to base
	resetLimboMission()
	-- allow full map access
	setScrollParams(0, 0, 64, 192)
	-- set radar zoom level
	setRadarZoom(0)
	-- set timelimit
	setMissionTime(timeLimit/10.0)
	-- reset structure limits
	count = 0
	while count < numStrucStats1 do
		setStructureLimits(strucStat[count], 200, player)
		enableStructure(strucStat[count], player)
		count = count + 1
	end
	while count < numStrucStats1 + numStrucStats2 do
		setStructureLimits(strucStat[count], strucLimit[count], player)
		enableStructure(strucStat[count], player)
		count = count + 1
	end
	
	-- reset the player's colour
	setPlayerColour(oldColour, curPlayer)
	
	addPower(player, powerBoost)
	playSound(powTransSnd, player)
	
	-- stop player from failing now they've reached Gamma Base!
	deactivateEvent(seen)
end

-- has player found gamma base?
-- needs to be object seen
-- CALL_OBJ_SEEN, INT player, ref BASEOBJ object, ref BASEOBJ viewer
-- event seen2(CALL_DROID_SEEN, player, ref objectDroid, ref viewerDroid)
function seen2(_objectObj, _viewerObj)
	if _viewerObj.player ~= player then return end
	objectObj, viewerObj = _objectObj, _viewerObj -- wz2lua: probably these can be used as function arguments directly
	if objectObj.player == curPlayer then
		playSound(incomingSnd, player)
		delayedEvent(seen, 3.0)
		deactivateEvent(seen2)
	end
end
callbackEvent(seen2, CALL_OBJ_SEEN)

-- 45)
function betaDead()
	temp = 0
	count = 0
	-- get count of team gamma units
	while count < numDroids do
		if droids[count] ~= nil then
			temp = temp + 1
		end
		count = count + 1
	end
	-- only gamma units alive => limbo units all dead!!
	if temp >= getDroidCount(player) then
		C.extraFailFlag = true
		-- reset the player's colour
		setPlayerColour(oldColour, curPlayer)
		
		deactivateEvent(betaDead)
	end
end
repeatingEvent(betaDead, 1.0)


---------- stubs ----------

if takeOverDroidsInArea == nil then takeOverDroidsInArea = function() print("stub: takeOverDroidsInArea"); return 0 end end
if setEventTrigger == nil then setEventTrigger = function() print("stub: setEventTrigger"); return 0 end end
if addPower == nil then addPower = function() print("stub: addPower"); return 0 end end
if takeOverStructsInArea == nil then takeOverStructsInArea = function() print("stub: takeOverStructsInArea"); return 0 end end
if completeResearch == nil then completeResearch = function() print("stub: completeResearch"); return 0 end end
if getPlayerColour == nil then getPlayerColour = function() print("stub: getPlayerColour"); return 0 end end
if getDroidCount == nil then getDroidCount = function() print("stub: getDroidCount"); return 0 end end
if setPlayerColour == nil then setPlayerColour = function() print("stub: setPlayerColour"); return 0 end end
if setRadarZoom == nil then setRadarZoom = function() print("stub: setRadarZoom"); return 0 end end
if setScrollParams == nil then setScrollParams = function() print("stub: setScrollParams"); return 0 end end
if enableStructure == nil then enableStructure = function() print("stub: enableStructure"); return 0 end end
if setStructureLimits == nil then setStructureLimits = function() print("stub: setStructureLimits"); return 0 end end
if setLimboLanding == nil then setLimboLanding = function() print("stub: setLimboLanding"); return 0 end end
if setMissionTime == nil then setMissionTime = function() print("stub: setMissionTime"); return 0 end end
if createAlliance == nil then createAlliance = function() print("stub: createAlliance"); return 0 end end
if playSound == nil then playSound = function() print("stub: playSound"); return 0 end end
if resetLimboMission == nil then resetLimboMission = function() print("stub: resetLimboMission"); return 0 end end