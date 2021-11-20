local g_ResRoot = getResourceRootElement(getThisResource())

local soundVolume = 0.5

function playAudio(filename)
	-- outputDebugString("play sound "..filename)
	local sound = playSound("audio/"..filename)
	setSoundVolume(sound, soundVolume)
end

addEvent("playClientAudio", true)
addEventHandler("playClientAudio", root, playAudio)

addEventHandler('onClientResourceStart', g_ResRoot,
	function()
		playAudio("raceon.mp3")
	end
)

addEvent("onClientPlayerOutOfTime", true)
addEventHandler('onClientPlayerOutOfTime', root,
	function()
		playAudio("timesup.mp3")
	end
)

addCommandHandler("soundvolume",
    function(cmd, value)
		soundVolume = value/100
		outputConsole("set sound volume to "..value.."%")
    end
)
