-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Sebastian N
-- Created on: April 19
--
-- This program calculates Pi
-----------------------------------------------------------------------------------------

-- Visual Elements
display.setDefault('background', 0.5, 0.1, 0)
local mytittle = display.newText('What is Pi with Gregory-Leibniz series', display.contentCenterX, 150, native.SystemFont, 100)

-- Iterations space
local iterationsText = display.newText('Iterations: ', display.contentCenterX - 650, display.contentCenterY - 300, native.SystemFont, 150)
local iterationsTextField = native.newTextField(display.contentCenterX - 130, display.contentCenterY - 290, 400, 200)
iterationsTextField.id = 'The text box'

-- Initiation button
local piButton = display.newImageRect('./Assets/Sprites/pi.png', 400, 350)
piButton.x = display.contentCenterX + 500
piButton.y = display.contentCenterY - 280
piButton.id = 'Pi button'

-- Result statement
local myResult = display.newText('', display.contentCenterX, display.contentCenterY + 600, native.SystemFont, 100)

-- Function
function piButton:touch(event)
	-- Variables
	local iterations = tonumber(iterationsTextField.text)
	local sum = 0
	local pi = 0
	local initial = 0

	-- If statement
	if (event.phase == 'ended') then
		if iterations == ((math.floor(iterations * 100))/100) and iterations > 0 then
			repeat
				sum = sum + ((-1)^initial)/((2*initial) + 1)
				initial = initial + 1
			until iterations == initial 
			pi = (math.floor((sum * 4)*1000))/1000
			myResult.text = ('Pi is equal to '.. pi)

		elseif iterations ~= ((math.floor(iterations * 100))/100) then
			myResult.text = ('Invalid input')
		end
	end
end

-- Event Listener
piButton:addEventListener('touch', piButton)


