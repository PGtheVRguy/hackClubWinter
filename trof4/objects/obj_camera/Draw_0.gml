var camWidth = sprite_get_width(spr_camera)
var camHeight = sprite_get_height(spr_camera)
var scale = 3.5
var camX = (room_width-camWidth*scale)
var camY = (room_height-camHeight*scale)-48

staticTimer++

if sprite_exists(asset_get_index("ispr_cam_" + string(currentCam)))
{
	sprite = asset_get_index("ispr_cam_" + string(currentCam))
}
else
{
	sprite = ispr_cam_0
}


var _dWidth = windowWidth()
//270
//camMove = sin(staticFrame/30)*_sWidth
//draw_sprite_ext(sprite,0,camMove-_sWidth,0,1,1,0,-1,1)
#region moving camera

camMove = lerp(0,sprite_get_width(sprite)-(_dWidth),-((sin(staticFrame/40)+1)/2))
draw_sprite_ext(sprite,0,camMove,0,1,1,0,-1,1)


var _num = 0
repeat(3)
{
	var _ai = ds_grid_get(global.animatronicList,currentCam,_num)
	_num++
	if _ai = 1
	{
		var _aiID = _num-1
		//show_debug_message("spr_cam_" + string(currentCam) + "_" + string(_aiID))
		if sprite_exists(asset_get_index("spr_cam_" + string(currentCam) + "_" + string(_aiID)))
		{
			var _anSprite = asset_get_index("spr_cam_" + string(currentCam) + "_" + string(_aiID))
			//show_debug_message(_anSprite)
			draw_sprite_ext(_anSprite,0,camMove,0,1,1,0,-1,1)
		}
	}
}
if(currentCam = 6)
{
	if(obj_ai_foxy.phase >= 0)
	{
		draw_sprite(spr_cam_6_4,obj_ai_foxy.phase,camMove,0)
	}
}
if(currentCam = 9)
{
	
	sprite = asset_get_index("ispr_cam_9_" + string(global.hacker))
	draw_sprite(sprite,0,camMove,0)
	//draw_sprite(spr_cam_9,global.hacker,camMove,0)
}

if(instance_exists(obj_doDeHandler))
{
	ha_failed = obj_doDeHandler.failed
}

if(currentCam = 11)
{
	if(ha_failed = false)
	{
		draw_sprite(spr_cam_11_d0,global.hacker,camMove,0)
	}
	if(ha_failed = true)
	{
		draw_sprite(spr_cam_11_d1,global.hacker,camMove,0)
	}
}






if(staticTimer <= staticTimeMax*global.framerate)
{
	draw_sprite_ext(spr_vhsCorrupt,staticTimer/10,0,0,1,1,0,-1,1)
}


if(blackout >= 0)
{
	draw_rectangle_color(0,0,windowWidth(),windowHeight(),c_black,c_black,c_black,c_black,false)
}


#endregion

#region floor buttons

draw_sprite_ext(spr_b_floor1, 0, camX-64, camY+150, 1, 1, 0, -1, 1)
draw_sprite_ext(spr_b_floor2, 0, camX-64, camY+200, 1, 1, 0, -1, 1)
if(input_check_pressed("shoot"))
{
	if(mouseAt(camX-64,camY+150, 75, 22))
	{
		currentFloor = 1
	}
	if(mouseAt(camX-64,camY+200, 75, 22))
	{
		currentFloor = 2
	}
}
#endregion


staticFrame += 0.1
draw_sprite_ext(spr_static,staticFrame,0,0,3,1.5,0,-1,0.25)

draw_sprite_ext(spr_camera,currentFloor,camX-32,camY-32,scale,scale,0,-1,1)
draw_text_scribble(20,20,"[fa_left][fa_top]" + string(currentCamName))

if(currentFloor == 2)
{
	createCam(camX, camY, 571-camX, 286-camY, 1, 3, "Stairway")
	createCam(camX, camY, 261, 310, 2, 3, "Back Hall")
}

/* 
createCam(camX,camY,333,225,13,3, "Pool") //pool
createCam(camX,camY,177,22,1,3, "Stage") //stage
createCam(camX,camY,173,108,2,3, "Main Party Room") //main party room
//255 10
//x: 672y: 154

571, 286



createCam(camX,camY,175,142,3,3, "P.P 1") //P.P. 1
createCam(camX,camY,250,142,4,3, "P.P 2") //P.P. 2
createCam(camX,camY,100,190,5,3, "Kitchen") //Kitchen
createCam(camX,camY,110,287,6,3, "B.K.C.") //Boy Kisser Central

createCam(camX,camY,200,319,7,3, "Main Party Room 2") //Main Party Room 2
createCam(camX,camY,234,381,8,3, "Storage") //Storage

createCam(camX,camY,313,386,9,3, "Computer Room") //Computer Room

createCam(camX,camY,20,318,10,3, "Murder Room") //Murder Room
createCam(camX,camY,20,394,11,3, "Generator") //Generator
createCam(camX,camY,120,394,12,3, "Parts and Service") //Parts and Services

//createCam(camX,camY,149,358,14,3, "Hallway") //Hallway

createCam(camX,camY,384,308,15,3, "Closet") //Hallway*/

//Door breaker and hacker are likely deprecated and will be removed

#region doorbreaker

if(currentCam = 11)
{
	audio_group_set_gain(ag_musicbox,1,0)
	
	var _scale = 2
	if((mouseAt(camX-148,camY+354,(75*_scale)/2,(22*_scale)/2)) && (input_check("shoot")))
	{
		var _p = 1
	}
	else
	{
		_p = 0
	}
	draw_sprite_ext(spr_b_doorshut,_p,camX-148,camY+354,_scale,_scale,0,-1,1)
	draw_sprite_ext(spr_pizza,lerp(0,8,global.doorDestroyerTimer/10),camX-148-75-32,camY+354,0.25,0.25,0,-1,1)
	//draw_text(camX-148-32, camY+354, global.doorDestroyerTimer)
	if _p = 1
	{
		if(instance_exists(obj_doDeHandler))
		{
			obj_doDeHandler.decrementTimer = false
		}
		dbAT++
		
		if((dbAT > global.framerate) && (global.doorDestroyerTimer < 10))
		{
			global.doorDestroyerTimer++
			dbAT = 0
		}
	}
	
	
	if _p = 0
	{
		if(instance_exists(obj_doDeHandler))
		{
			obj_doDeHandler.decrementTimer = true
		}
	}
}
else
{
	audio_group_set_gain(ag_musicbox,0,0)
}
#endregion

#region hacker

if(currentCam = 9)
{
	
	var _scale = 2
	if((mouseAt(camX-148,camY+354,(75*_scale)/2,(22*_scale)/2)) && (input_check("shoot")))
	{
		var _p = 1
	}
	else
	{
		_p = 0
	}
	draw_sprite_ext(spr_b_blinds,_p,camX-148,camY+354,_scale,_scale,0,-1,1)
	if((_p = 1) && (global.hacker = true))
	{
		global.hacker = false
		global.scale = obj_haHandler.origScale
		window_set_fullscreen(true)
		window_center();
		obj_haHandler.haTi = 0
	}
}

#endregion







#region CHEATS


//draw_text_scribble(20,20,"[scale,0.5]" + string(currentCam))
//draw_text_scribble(20,40,"[scale,0.5]" + string(mouse_x-camX))
//draw_text_scribble(20,60,"[scale,0.5]" + string(mouse_y-camY))

if mouse_check_button(mb_right)
{
	draw_sprite_ext(spr_cameraSpot,0,mouse_x,mouse_y,3,3,0,-1,1)
	show_debug_message($"{mouse_x-camX}, {mouse_y-camY}")
}




/*

//draw_text_scribble(20,100,"[scale,0.5]CURRENT ANIMATRONICS")
repeat(20)
{
	var sucFound = 0
	for(var i = 0; i < 20; i++;)
	{
		var sel = ds_grid_get(global.animatronicList,currentCam,i)
		if sel != undefined
		{
			sucFound += 1
			//draw_text_scribble(20,100+(20*sucFound),ds_grid_get(global.aiGrid,16,sel))
		}
	}
}
*/#endregion