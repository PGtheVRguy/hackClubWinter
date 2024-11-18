// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createCam(_camX,_camY,_x,_y,_cam,_size, _name){
	var offset = 5
	
	if(global.hacker = true)
	{
		var _hxOf = irandom_range(-5,5);
		var _hyOf = irandom_range(-5,5);
		var _hcam = irandom_range(0,10);
		var _hsize = irandom_range(-0.2,0.2)
	}
	else
	{
		var _hxOf = 0;
		var _hyOf = 0;
		var _hcam = 0;
		var _hsize = 0;
	}
	
	if(os_type = os_android)
	{
		_size += 1
	}
	
	_camSpotX = _camX+_x+offset+_hxOf
	_camSpotY = _camY+_y+offset+_hyOf
	_spriteWidth = sprite_get_width(spr_cameraSpot)
	_spriteHeight = sprite_get_height(spr_cameraSpot)
	var _f = 0
	if(currentCam = _cam)
	{
		_f = 1
	}
	draw_sprite_ext(spr_cameraSpot,_f,_camSpotX,_camSpotY,_size+_hsize,_size+_hsize,0,-1,1)
	draw_text_scribble(_camSpotX,_camSpotY,"[fa_center][fa_middle][scale,0.25]cam " + string(_cam+_hcam))
	if ((input_check_pressed("shoot") and (mouseAt(_camSpotX+_spriteWidth*0,_camSpotY-_spriteHeight/2,_spriteWidth*1.5,_spriteHeight*2))))
	{
		audio_play_sound(snd_cam_change,true,false)
		currentCam = _cam
		currentCamName = _name
		staticTimeMax = 0.3333+(staticTimer/global.framerate);

	}

}