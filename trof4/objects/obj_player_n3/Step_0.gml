/*if(input_check("left"))
{
	hsp = -walk_spd
}
if(input_check("right"))
{
	hsp = walk_spd
}
if(input_check("up"))
{
	vsp = -walk_spd
}
if(input_check("down"))
{
	vsp = walk_spd
}*/

hsp = (input_check("right")-(input_check("left")))
vsp = (input_check("down")-input_check("up"))
shootTimer--
if(hsp != 0)
{
	image_xscale = hsp
}
if((input_check_pressed("accept"))&& (shootTimer < 0))
{
	var _b = instance_create_layer(x,y,layer,obj_bullet_n3)
	_b.hsp = image_xscale
	shootTimer = 2*framerate
	audio_play_sound(snd_mg_trash,10,false)
}

move_and_collide(hsp,vsp,obj_collision)