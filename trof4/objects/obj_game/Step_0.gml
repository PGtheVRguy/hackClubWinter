
#region handling the camera and closet buttons
buttonCheck = mouseAt(windowWidth()/2,windowHeight()-sprite_get_height(spr_cameraButton)/2,sprite_get_width(spr_cameraButton)/2,sprite_get_height(spr_cameraButton))

closetButtonCheck = mouseAt(sprite_get_width(spr_closetButton)/2,windowHeight()/2,4+sprite_get_width(spr_closetButton)/2,sprite_get_height(spr_closetButton)/2)
#endregion
framePass++
//show_debug_message(buttonCheck)

if((os_type = os_android) && (!input_check("shoot"))) //MOBILE
{
	buttonCheck = false
	closetButtonCheck = false
}

if((instance_exists(obj_jumpscare)) or (state = "gameover"))
{
	buttonCheck = false
	closetButtonCheck = false
}

if((state = "load") or (state = "intro") or (state = "win") or (state = "newspaper"))
{
	global.doorDestroyerTimer = 10
	buttonCheck = false;
	closetButtonCheck = false
}

if(state = "camera")
{
	closetButtonCheck = false
	closetButtonPressed = true
}
if(state = "closet")
{
	buttonCheck = false
	buttonPressed = true
}

if((state != "intro") && (state != "load") && (state != "newspaper"))
{
	if(!audio_is_playing(snd_bgm))
	{
		audio_play_sound(snd_bgm,3,false,8)
	}
}

if(!audio_is_playing(snd_musicbox))
{	
	audio_play_sound(snd_musicbox,10,true)
}



if ((buttonCheck) and (buttonPressed = false))
{
	buttonPressed = true
	if state = "camera"
	{
		audio_group_set_gain(ag_musicbox,0,0)
		state = "office"
		instance_destroy(obj_camera)
		audio_stop_sound(snd_cam_amb)
		audio_play_sound(snd_cam_open,true,false)
	}
	else
	{
		audio_play_sound(snd_cam_open,true,false)
		state = "camera"
	}
	//show_debug_message("BUTTON!!!")
}
if(!buttonCheck)
{
	buttonPressed = false
	//show_debug_message("no button :(")
}



if((closetButtonCheck) and (closetButtonPressed = false))
{
	closetButtonPressed = true
	if(state == "office")
	{
		state = "closet"
	}
	else
	{
		state = "office"
	}
}
if(!closetButtonCheck)
{
	closetButtonPressed = false
}

if ((state = "camera") and !(instance_exists(obj_camera)))
{
	instance_create_layer(0,0,layer,obj_camera)
}

currentTimer += 1*debugSkip
if currentTimer > 89*global.framerate
{
	time += 1
	currentTimer = 0
}

if(!audio_is_playing(snd_musicbox))
{	
	audio_play_sound(snd_musicbox,10,true)
}


if(time >= 6)
{
	state = "win"
}

if energy <= 0
{
	global.frontDoor = false
	global.sideDoor = false
}

if state = "office"
{
	if phonePlayed = false
	{
		
		var _ph = asset_get_index("snd_ph_" + string(global.night))
		audio_play_sound(_ph,9999999,false,1)
		instance_create_layer(30,30,"Instances",obj_mutecall)
		phonePlayed = true
	}
	if(!audio_is_playing(snd_buzz))
	{
		audio_play_sound(snd_buzz,3,true,0.15)
	}
}
else
{
	audio_stop_sound(snd_buzz)
}

#region power

if global.frontDoor = true
{
	energy -= 0.5/global.framerate
}
if global.sideDoor = true
{
	energy -= 0.5/global.framerate
}

#endregion

if(state = "office")
{
	if((keyboard_check(ord("C"))) && (keyboard_check(ord("D")) && (keyboard_check(vk_add))))
	{
		state = "win"
	}
}

if(keyboard_check_pressed(vk_f2))
{
	if(debug = true)
	{
		debug = false
	}
	else
	{
		debug = true
	}
	show_debug_overlay(debug)
}
if(keyboard_check_pressed(vk_f3))
{
	pc = asset_get_index("snd_ph_" + string(global.night))
	audio_stop_sound(pc)
}
if(keyboard_check_pressed(vk_f4))
{
	var _js = instance_create_layer(0,0,"js",obj_jumpscare)
	_js.aiID = 1
}

#region Sanity handling

if(state = "closet")
{
	sanity += 0.2
}
else{
	sanity -= 0.002
}
sanity = clamp(sanity, 0, 100)


#endregion