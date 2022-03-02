-- local POINT_LIGHT = script:GetCustomProperty("PointLight"):WaitForObject()

-- local current_atten = .8

-- local t = Task.Spawn(function()
-- 	local r = math.random(1, 5)

-- 	if(r == 1) then
-- 		--POINT_LIGHT.attenuationRadius = math.random(current_atten - 200, current_atten + 200)#

-- 		local a = CoreMath.Clamp(current_atten + (math.random() -.3), 6, 10)

-- 		print(a)
-- 		POINT_LIGHT.intensity = a
-- 		current_atten = a
-- 	end
-- end)

-- --t.repeatInterval = .1
-- t.repeatCount = -1

-- script.destroyEvent:Connect(function()
-- 	if(t ~= nil) then
-- 		t:Cancel()
-- 		t = nil
-- 	end
-- end)