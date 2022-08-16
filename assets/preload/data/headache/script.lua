local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
		setProperty('healthBar.visible', false)
		setProperty('healthBarBG.visible', false)
		setProperty('scoreTxt.visible', false)
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		makeLuaSprite('intro', 'gar/garIntroText', 0, 0)
		setObjectCamera('intro', 'camhud')
		addLuaSprite('intro')
		runTimer('cutFade', 3)
	end
	if tag == 'cutFade' then
		doTweenAlpha('intro', 'intro', 0, 2)
	end
end
function onTweenCompleted(tag)
	if tag == 'intro' then
		startDialogue('dialogue');
		setProperty('iconP1.visible', true)
		setProperty('iconP2.visible', true)
		setProperty('healthBar.visible', true)
		setProperty('healthBarBG.visible', true)
		setProperty('scoreTxt.visible', true)
		removeLuaSprite('intro', true)
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end