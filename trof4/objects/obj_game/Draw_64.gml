
#region moving scene

if(!instance_exists(obj_camera))
{
	if mouse_x < 256 //Decides CHANGEX
	{

		changeX += 0.15

	}

	if mouse_x > windowWidth()-256
	{
		changeX -= 0.15
	}
}
else
{
	global.sideDoorLi = false
	global.frontDoorLi = false
}
if((os_type = os_android) && (!input_check("shoot")))
{
	changeX = 0
}
if(state = "closet")
{
	draw_sprite(spr_office_behind, 0, 0, 0)
}




if (!(mouse_x < 256) and !(mouse_x > windowWidth()-256)) //sets ChangeX to 0
{
	changeX = 0
	//show_debug_message("wawawawawa")
}


changeX = clamp(changeX, -1,  1)
/*
if changeX >= 1 //caps at 1 and -1
{
	changeX = 1
}
if changeX <= -1
{
	changeX = -1
}
*/



moveX = moveX+lerp(0,5,changeX)

/*
if moveX > -128
{
	moveX = -128
}

if moveX < -960
{
	moveX = -960
}
*/


moveX = clamp(moveX, -313, 63)
//show_debug_message(moveX)



#endregion

var realTime = time
if time = 0
{
	var realTime = 12
}


if state = "office"
{
	energy -= 0.05/global.framerate
	if global.frontDoor = false
	{
		var _frontDoor = "false"
	}
	else
	{
		var _frontDoor = "true"
	}
	
	if (global.sideDoor = false)
	{
		var _sideDoor = "false"
	}
	else
	{
		var _sideDoor = "true"
	}
	
	x = moveX
	//shader_set(shd_fnafrp)
	draw_sprite_ext(spr_office_hall_main,0,moveX,0,1,1,0,-1,global.frontDoorLi)
	draw_sprite_ext(spr_office_hall_side,1,moveX,0,1,1,0,-1,global.sideDoorLi)

	if(global.frontDoorLi = true)
	{
		energy -= (0.5)/global.framerate
		if(!audio_is_playing(snd_doorLight))
		{
			audio_play_sound(snd_doorLight,0,false)
		}
		var _num = 0
		repeat(3)
		{
			var _ai = ds_grid_get(global.animatronicList,99,_num)
			_num++
			if _ai = 1
			{
				var _aiID = _num-1
				//show_debug_message("spr_cam_" + string(currentCam) + "_" + string(_aiID))
				if sprite_exists(asset_get_index("spr_officeLF_" + string(_aiID)))
				{
					var _anSprite = asset_get_index("spr_officeLF_" + string(_aiID))
					//show_debug_message(_anSprite)
					draw_sprite_ext(_anSprite,0,moveX,0,1,1,0,-1,1)
				}
			}
		}
	}
	if(global.sideDoorLi = true)
	{
		energy -= (0.5)/global.framerate
		if(!audio_is_playing(snd_doorLight))
		{
			audio_play_sound(snd_doorLight,0,false)
		}
		var _num = 0
		repeat(3)
		{
			var _ai = ds_grid_get(global.animatronicList,98,_num)
			_num++
			if _ai = 1
			{
				var _aiID = _num-1
				//show_debug_message("spr_cam_" + string(currentCam) + "_" + string(_aiID))
				if sprite_exists(asset_get_index("spr_officeLS_" + string(_aiID)))
				{
					var _anSprite = asset_get_index("spr_officeLS_" + string(_aiID))
					//show_debug_message(_anSprite)
					draw_sprite_ext(_anSprite,0,moveX,0,1,1,0,-1,1)
				}
			}
		}
	}
	
	
	if(global.frontDoor = true)
	{
		frontDoorAnim += 0.05
		
	}
	else
	{
		frontDoorAnim -= 0.05
	}
	if(global.sideDoor = true)
	{
		sideDoorAnim += 0.05
		
	}
	else
	{
		sideDoorAnim -= 0.05
	}
	frontDoorAnim = clamp(frontDoorAnim,0,1)
	sideDoorAnim = clamp(sideDoorAnim,0,1)
	
	var _frontDoorPos = lerp(-288,0,frontDoorAnim)
	var _sideDoorPos = lerp(-488,0,sideDoorAnim)
	draw_sprite_ext(spr_office_door_main,0,moveX,_frontDoorPos,1,1,0,-1,1)
	draw_sprite_ext(spr_office_door_side,0,moveX,_sideDoorPos,1,1,0,-1,1)
	//main thing
	draw_sprite_ext(spr_office_main,0,moveX,0,1,1,0,-1,1)
	draw_sprite_ext(spr_office_side,0,moveX,0,1,1,0,-1,1)
}



if state = "camera"
{
	energy -= 1/global.framerate
}
if((state != "intro") && (state != "load") && (state != "win"))
{
	var _visEn = round(lerp(0,100,energy/startEnergy))
	if((buttonPressed = false) && (state != "closet"))
	{
		draw_sprite(spr_cameraButton,0,windowWidth()/2,windowHeight()-32)
	}
	if((closetButtonPressed = false) && (state != "camera"))
	{
		draw_sprite(spr_closetButton,0,0,windowHeight()/2)
	}
	draw_text_scribble(windowWidth()-24,24,"[fa_right]" + string(realTime) + "AM")
	draw_text_scribble(16,windowHeight()-16-64,"[fa_left][fa_bottom][scale,0.75]ENERGY: " + string(_visEn) + "%")
	if(instance_exists(obj_jokeUI))
	{
		if(obj_jokeUI.sanity = true)
		{
			draw_sprite(spr_sanity,0,windowWidth()-24,100)
		}
		if(obj_jokeUI.ammo = true)
		{
			draw_text_scribble(16,windowHeight()-16-64-32,"[fa_left][fa_bottom][scale,0.75]0/10")
		}
		if(obj_jokeUI.money = true)
		{
			draw_text_scribble(windowWidth()-16,windowHeight()-16-64-32,"[fa_right][fa_bottom][scale,0.75]$0.01")
		}
	}
	
	if global.doorDestroyerTimer < 5
	{
		draw_sprite_ext(spr_warning,0,(windowWidth()/2)-(576/2)-18,windowHeight()-48,1,1,0,-1,abs(round(sin(framePass/60))))
	}//576
	
	
	
	maxFill = sprite_get_width(spr_sanityFill)*(sanity/100)
	
	draw_sprite_part(spr_sanityFill, 0, 0, 0, maxFill, sprite_get_height(spr_sanityFill), 60, 100)
	draw_sprite(spr_sanityBase, 0, 60, 100)
	
}
//show_debug_message(moveX)





if state = "intro"
{
	introTimer += 1
	
	if introTimer = 1
	{
		audio_play_sound(snd_cam_change,true,false)
	}
	
	if introTimer > 4*60
	{
		introAlpha -= 0.05
	}
	var _infTxt = ""
	if global.night = 1{var introNight = "FIRST"}
	if global.night = 2{var introNight = "SECOND"}
	if global.night = 3{var introNight = "THIRD"}
	if global.night = 4{var introNight = "FOURTH"}
	if global.night = 5{var introNight = "FIFTH"}
	if global.night = 6{var introNight = "SIXTH"}
	if global.night = 7{var introNight = "CUSTOM"}
	if global.night = 10{var introNight = "TRUE"}
	if global.night = 11{var introNight = "TRUE FIRST"}
	if global.night = 12{var introNight = "TRUE SECOND"}
	if global.night = 13{var introNight = "TRUE THIRD"}
	if global.night = 14{var introNight = "TRUE FOURTH"}
	if global.night = 15{var introNight = "TRUE FIFTH"}
	if global.night = 20{var introNight = "CUSTOM NIGHT"}
	if(global.infiniteNight = true){
		var introNight = "ENDLESS"
		var _infTxt = "\nNight " + string(global.night)

		draw_text_scribble(windowWidth()/2,(windowHeight()/2)+128,"[fa_center][alpha," + string(introAlpha) +"]" + "[spr_lives][scale,0.5]" + string(global.enLive))
	
	}
	
	draw_text_scribble(windowWidth()/2,windowHeight()/2,"[fa_center][fa_middle][alpha," + string(introAlpha) +"]" + "12:00 AM\n"+ string(introNight) + " NIGHT" + _infTxt)
	if introAlpha < -2
	{
		state = "load"
	}
}

if state = "load"
{
	draw_sprite_ext(spr_loading,0,windowWidth()-16,windowHeight()-16,0.25,0.25,0,-1,1)
	//draw_text_scribble(250,250,"loading")
	loadWait++
	
	if loadWait > 5
	{
		var val = 0
		repeat(14)
		{
			sprite_prefetch(asset_get_index("spr_cam_" + string(val)))
			val++
		}
		val = 0
		repeat(3)
		{
			sprite_prefetch(asset_get_index("spr_jump_" + string(val)))
			val++
			
		}
		state = "office"
	}
}









#region front door
if((mouseAt(917+moveX,84,32,32)) && (state = "office"))
{
	if mouse_check_button_pressed(mb_left)
	{
		if (global.frontDoor=false)
		{
			global.frontDoor = true
			audio_play_sound(snd_doorShut,0,false)
		}
		else
		{
			global.frontDoor = false
		}
		show_debug_message(global.frontDoor)
	}
}
#endregion
#region side door
if((mouseAt(1607.5+moveX,142.5,32*1.390625,32*1.453125)) && (state = "office"))
{
	if (mouse_check_button_pressed(mb_left))
	{
		if(global.sideDoor=false)
		{
			global.sideDoor = true
			audio_play_sound(snd_doorShut,0,false)
			show_debug_message("side door closed")
		}
		else
		{
			global.sideDoor = false
		}
	}
}
#endregion
#region light front
if((mouseAt(985+moveX,84,32,32)) && (state = "office"))
{
	if (mouse_check_button_pressed(mb_left))
	{
		if(global.frontDoorLi=false)
		{
			global.frontDoorLi = true
			show_debug_message("front door light on")
		}
		else
		{
			global.frontDoorLi = false
			audio_stop_sound(snd_doorLight)
		}
	}
}
#endregion
#region light side
if((mouseAt(1600+moveX,257,32*1.2,32*1.375)) && (state = "office"))
{
	if (mouse_check_button_pressed(mb_left))
	{
		if(global.sideDoorLi=false)
		{
			global.sideDoorLi = true
			show_debug_message("side door light on")
		}
		else
		{
			global.sideDoorLi = false
			audio_stop_sound(snd_doorLight)
		}
	}
}
#endregion



#region winstate
if(state = "win")
{
	draw_text_scribble(windowWidth()/2,windowHeight()/2,"[fa_center]6AM")
	winTimer++
	
	
	if winTimer > 4*global.framerate
	{
		if(global.infiniteNight = false)
		{
			if(global.night = 5)
			{
				ini_open(global.sf)
				ini_write_real("wins","gameBeat", true)
				ini_close();
			}
			if(global.night = 6)
			{
				ini_open(global.sf)
				ini_write_real("wins","extraBeat", true)
				ini_close();
			}
		
		
		
			global.night++
			ini_open(global.sf)
			ini_write_real("data","night",global.night)
			ini_close()
		
		
		
		
		
			if(room_exists(asset_get_index("room_mini_night" + string(global.night-1)))) //plz rewrite
			{
				if(1 = 1) /*os_type != os_android /*
					Re-add this if you want to try and remove the minigames
					from the android port of the game.
				*/
				{
					room = (asset_get_index("room_mini_night" + string(global.night-1)))
				}
				else
				{
					if((global.night != 5) && (global.night != 6))
					{
						room_restart();
					}
				}
			}
		
			else
			{
				if((global.night = 5) or (global.night = 6))
				{
					if(global.night = 5)
					{
						ini_open(global.sf)
						ini_write_real("data","6th",1)
						ini_close();
					}
					room_restart();
				}
				else
				{
					room = room_menu
				}
		}
		}
		else
		{
			global.night++
			ini_open(global.sf)
			ini_write_real("wins","inf", global.night)
			ini_close();
			room = room_game
			
			
		}
	}
}
#endregion

#region no power state

if energy <= 0
{
	draw_sprite_ext(spr_debug,0,0,0,200,200,0,-1,0.75)
	
}

#endregion



#region gameover

if(state = "gameover")
{
	instance_destroy(obj_camera)
	instance_destroy(obj_ai_foxy)
	instance_destroy(obj_ai_freddy)
	instance_destroy(obj_ai_chica)
	instance_destroy(obj_ai_bonnie)
	instance_destroy(obj_doDeHandler)
	instance_destroy(obj_haHandler)
	
	if(didAd = false)
	{
		//AdMob_Interstitial_Show();
		if(AdMob_Interstitial_IsLoaded())
		{
			// Loaded: show interstitial ad
			show_debug_message("Ad loaded!")
		    AdMob_Interstitial_Show();
			didAd = true
		}	
		else
		{
			// Not Loaded: load interstitial ad
			AdMob_Interstitial_Load();
			show_debug_message("failed to load ad :(")
		    //show_message_async("Interstitial Still loading, try again soon");
		}


	}
	
	global.hacker = false
	gvFrame++
	
	if(gvFrame > 4*global.framerate)
	{
		audio_stop_sound(snd_static)
		draw_sprite_ext(spr_gameover,0,0,0,1,1,0,-1,1)
		draw_text_scribble(windowWidth()/2,windowHeight()/2,"[fa_center]GAMEOVER")
	}
	else
	{
		draw_sprite_ext(spr_static,gvFrame,0,0,3,3,0,-1,1)
	}
	
	if(global.infiniteNight = true)
	{
		if(gvFrame > 5*global.framerate)
		{
			var _l = "[spr_lives][scale,0.5]" + string(global.enLive)
			if global.enLive = 3{_l = "[scale,0.5] YOU RAN OUT OF LIVES"}
			draw_text_scribble(windowWidth()/2,(windowHeight()/2)+48,"[fa_center]" + string(_l))

		}
		if(gvFrame > 10*global.framerate)
		{
			if(!instance_exists(obj_m_bAd))
			{
				instance_create_layer(0,999,"js",obj_m_bCo)
				instance_create_layer(0,999,"js",obj_m_bAd)
				
			}
		}
	}
	
	if(global.infiniteNight = false)
	{
		if(gvFrame > 10*global.framerate)
		{
			room_goto(room_menu)
		}
	}

}


#endregion


if(state = "newspaper")
{
	if(global.newgame = true)
	{
		audio_play_sound(snd_cam_change,10,false)
	}
	global.newgame = false
	draw_sprite_ext(spr_newspaper,0,0,0,1,1,0,-1,npal);
	if(newspaperTimer > 10*global.framerate)
	{
		npal-= 0.05
	}
	
	if npal = 0
	{
		state = "intro"
	}
	newspaperTimer++
	
}

#region borders 
//borders are used to keep the 16:9 look on non 16:9 devices (like android)
//this is helpful to ensure that nothing clips outside the screen
draw_sprite_ext(spr_borderLeft,0,0,0,display_get_height()/64,display_get_width()/2,0,-1,1)
draw_sprite_ext(spr_borderRight,0,windowWidth(),0,display_get_height()/64,display_get_width()/2,0,-1,1)

#endregion




/*



if mouse_check_button(mb_middle)
{
	draw_rectangle(debugOriX,debugOriY,mouse_x,mouse_y,true)
	//var _cx = debugOriX - mouse_x
}
else
{
	debugOriX = mouse_x
	debugOriY = mouse_y
}

if mouse_check_button_pressed(mb_right)
{
	var _debugCenterX = (mouse_x-debugOriX)
	var _debugCenterY = (mouse_y-debugOriY)
	show_debug_message("x: " + string(mouse_x) + "y: " + string(mouse_y))
	show_debug_message("centerx: " + string(_debugCenterX) + " centery: " + string(_debugCenterY))
}