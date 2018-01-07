--[[
	Project:		lowHealthAlarm
	Friendly Name:	Low Health Alarm
	Author:			AndrielChaoti


	File:			low_health_alarm.lua
	Purpose:		Main code, handles making the beeps happen

	Copyright (c) Donald Granger. All Rights Reserved
	Licenced under the MIT License. See LICENSE file in the project root
	for full licence information.
]]

local lha_oldInit = init
function init()
	lha_oldInit()
	self.criticalSoundTimer = 0
	self.criticalStartTime = 0

	self.lha_config = {}
	self.lha_config = root.assetJson("/low_health_alarm.config")

end


local lha_oldUpdate = update
function update(...)
	lha_oldUpdate(...)

	local dt = select(1,...)

	local healthPrc = status.resource("health") / status.stat("maxHealth")

	-- check if drowning:
	if not status.resourcePositive("breath") then return end

	-- check for alarm:
	if healthPrc <= self.lha_config.alarmThreshold
		and status.resource("health") <= 0 then

		-- has alarm started?
		if self.criticalStartTime == 0 then
			self.criticalStartTime = os.clock()
			if self.lha_config.alarmFadeTime > 0 then
				self.fadeEndTime = self.criticalStartTime + self.lha_config.alarmFadeTime
			end
		end

		self.criticalSoundTimer = self.criticalSoundTimer - dt

		-- handle alarm
		if self.criticalSoundTimer <= 0 then
			self.criticalSoundTimer = self.lha_config.alarmCooldown

			local volume
			-- handle alarm fading
			if self.fadeEndTime then
				volume = self.lha_config.alarmFadeVolume
				if os.clock() < self.fadeEndTime then
					local remaining = self.fadeEndTime - os.clock()
					volume = volume + ((remaining / self.lha_config.alarmFadeTime) * self.lha_config.alarmFadeVolume)
				end
			end

			animator.setSoundVolume("criticalHealth", (volume and volume or 1), 0)
			animator.playSound("criticalHealth")

		end

	else
		self.criticalStartTime = 0
		self.criticalSoundTimer = 0
	end
end
