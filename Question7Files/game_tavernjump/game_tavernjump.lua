--variables for our windows and buttons
tavernjumpButton = nil
tavernjumpWindow = nil
windowJumpButton = nil
--helper variables for the button math and resetting
local buttonMax = 160
local buttonMin = 0
local buttonDecrement = 5
local buttonPos = buttonMax


function init()
  tavernjumpButton = modules.client_topmenu.addRightToggleButton('tavernjumpButton', tr('Tavern Jump'), '/game_tavernjump/game_tavernjump/game_tavernjump', closing)
  tavernjumpButton:setOn(false)

  tavernjumpWindow = g_ui.displayUI('game_tavernjump')
  tavernjumpWindow:setVisible(false)
  
  --the actual "Jump!" button we'll be clicking
  windowJumpButton = tavernjumpWindow:getChildById('Jump')

  allTabs = tavernjumpWindow:recursiveGetChildById('allTabs')
  allTabs:setContentWidget(tavernjumpWindow:getChildById('optionsTabContent'))
  

end

--function called when we click the "Jump!" button and also used for our loop
--for the scrolling button effect
function moveButton()

	if windowJumpButton then
		--if button is at the edge of our window, reset to the right and randomize height
		if buttonPos < buttonMin then
			windowJumpButton:setMarginTop( math.random(buttonMin, buttonMax) )
			buttonPos = buttonMax
		end
		--else, continue normally by setting position, updating our variable, and continuing the loop
		windowJumpButton:setMarginLeft( buttonPos )
		buttonPos = buttonPos - buttonDecrement
		loopEventId = scheduleEvent(moveButton, 50)
	end


end

--function called when our "Jump!" button is clicked
function buttonClicked()
	buttonPos = buttonMax
	windowJumpButton:setMarginTop( math.random(buttonMin, buttonMax) )
	removeEvent(loopEventId)
	moveButton()
end

function terminate()
  removeEvent(loopEventId)
  tavernjumpButton:destroy()
  tavernjumpWindow:destroy()
end

function closing()
  if tavernjumpButton:isOn() then
    tavernjumpWindow:setVisible(false)
    tavernjumpButton:setOn(false)
  else
    tavernjumpWindow:setVisible(true)
    tavernjumpButton:setOn(true)
  end
  removeEvent(loopEventId)
end