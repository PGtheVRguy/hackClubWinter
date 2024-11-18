if((dbDT > global.framerate*5) and (decrementTimer = true))
{
	dbDT = 0
	global.doorDestroyerTimer--
}

global.doorDestroyerTimer = clamp(global.doorDestroyerTimer,0,10)
dbDT += aggressiveness
frame++






if(global.doorDestroyerTimer = 0)
{
	if(failed = false)
	{
		if((instance_exists(obj_camera)) && (global.mainCam = 11))
		{
			obj_camera.blackout = 4*global.framerate
		}
	}
	failed = true
}

if(failed = true)
{
	global.frontDoor = false
	global.doorDestroyerTimer = 0
}



if((global.mainCam = 11) && (obj_game.state = "camera"))
{
	audio_group_set_gain(ag_musicbox,0.25,1)
}
else
{
	audio_group_set_gain(ag_musicbox,0,1)
}

var _dc = string(global.mainCam)
var _ds = string(obj_game.state)
//var _aud = string(audio_group_get_gain(ag_musicbox))

//var _string = "cam: " + _dc + " state: " + _ds + " gain: " + _aud
//show_debug_message(_string)