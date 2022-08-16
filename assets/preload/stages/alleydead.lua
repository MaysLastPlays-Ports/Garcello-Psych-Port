function onCreate() 
    precacheImage('gar/GAR_CUTSCENE')
    makeLuaSprite('back', 'gar/garStagebgAlt', -500, -170)
    addLuaSprite('back')

    makeAnimatedLuaSprite('smoke', 'gar/garSmoke', -500, -570)
    addAnimationByPrefix('smoke', 'smokey', 'smokey', 24, true)
    objectPlayAnimation('smoke', 'smokey', true)
    setProperty('smoke.alpha', 0.3)
    setGraphicSize('smoke', math.floor(getProperty('smoke.width') * 1.7))
    addLuaSprite('smoke')

    makeLuaSprite('front', 'gar/garStagealt', -500, -200)
    addLuaSprite('front')

    makeLuaSprite('corpse', 'gar/gardead', -230, 540)
    addLuaSprite('corpse')

    makeAnimatedLuaSprite('smoke2', 'gar/garSmoke', -500, -350)
    addAnimationByPrefix('smoke2', 'smokey', 'smokey', 24, true)
    objectPlayAnimation('smoke2', 'smokey', true)
    setProperty('smoke2.alpha', 0.3)
    setGraphicSize('smoke2', math.floor(getProperty('smoke2.width') * 1.7))
    addLuaSprite('smoke2', true)

    close(true)
end