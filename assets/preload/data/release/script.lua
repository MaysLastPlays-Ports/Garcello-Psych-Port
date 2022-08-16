local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true)
		makeAnimatedLuaSprite('cut', 'gar/GAR_CUTSCENE', 0, 0)
		addAnimationByPrefix('cut', 'cutscene', 'garcutscene', 15)
		setGraphicSize('cut', getProperty('cut.width') * 2)
		objectPlayAnimation('cut', 'cutscene')
		setObjectCamera('cut', 'camHUD')
		playSound('Garcello_Dies', 1)
		addLuaSprite('cut', true)
		runTimer('removeSprite', 7);		
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'removeSprite' then -- Timer completed, play dialogue
		doTweenAlpha('cutFadeOut', 'cut', 0, 0.5)
	end
	if tag == 'startDiag' then
		startDialogue('dialogue');
	end
end
function onTweenCompleted(tag)

	if tag == 'cutFadeOut' then
		removeLuaSprite('cut', true)
		runTimer('startDiag', 0.8)
	end

end
-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end