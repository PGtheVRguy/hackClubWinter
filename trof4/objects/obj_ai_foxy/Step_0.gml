/*
if((global.mainCam != 6) or (!instance_exists(obj_camera)))
{	
	timer+=foAI
}


if((global.mainCam = 6) && (instance_exists(obj_camera)) && (phase >=3))
{	
	atTi+=15
}

if(timer > 60*global.framerate)
{
	timer = 0
	phase++
}

if phase >=3 //:3
{
	strt_attack = true
}


if(end_attack = true)
{
	phase = -1
	if((!audio_is_playing(snd_footsteps)) && (playedFoxySound = true))
	{
		if(global.frontDoor = false)
		{
			var _js = instance_create_layer(0,0,"js",obj_jumpscare)
			_js.aiID = 4
			instance_destroy();
		}
		else
		{
			audio_play_sound(snd_doorknock,10,false)
			end_attack = false
			strt_attack = false
			phase = -2
			timer = 0
			playedFoxySound = false
		}
	}
}

if(!audio_is_playing(snd_doorknock) && (phase = -2))
{
	phase = 0
}

if(strt_attack = true)
{
	atTi++
	if((atTi >= 20*global.framerate))
	{		
		if(playedFoxySound = false)
		{
			audio_play_sound(snd_footsteps,10,false)
			playedFoxySound = true
			strt_attack = false
			end_attack = true
			phase = -1
			phase = 0
		}
	}
}



if(audio_is_playing(snd_doorknock) and (global.frontDoor = false))
{
	var _js = instance_create_layer(0,0,"js",obj_jumpscare)
	_js.aiID = 4
}

//show_debug_message("phase" + string(phase))