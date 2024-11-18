
//global.vTouch.destroy();


if(input_check_pressed("up"))
{
	
	if !instance_place(x,y-walkspd,obj_collision)
	{
		y -= walkspd
	}
	else
	{
		audio_play_sound(snd_mg_wall,10,false)
	}
}
if(input_check_pressed("down"))
{
	
	if !instance_place(x,y+walkspd,obj_collision)
	{
		y += walkspd
	}
	else
	{
		audio_play_sound(snd_mg_wall,10,false)
	}
}
if(input_check_pressed("right"))
{
	
	if !instance_place(x+walkspd,y,obj_collision)
	{
		x += walkspd
	}
	else
	{
		audio_play_sound(snd_mg_wall,10,false)
	}
}
if(input_check_pressed("left"))
{
	
	if !instance_place(x-walkspd,y,obj_collision)
	{
		x -= walkspd
	}
	else
	{
		audio_play_sound(snd_mg_wall,10,false)
	}
}