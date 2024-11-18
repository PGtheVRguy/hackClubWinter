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

if(hsp != 0)
{
	image_xscale = hsp
}


move_and_collide(hsp,vsp,obj_collision)