
if state = "running"
{
	if(ran = 1)
	{
		hsp = -ws	
	}
	if(ran = 2)
	{
		hsp = ws	
	}
	if(ran = 3)
	{
		vsp = -ws	
	}
	if(ran = 4)
	{
		vsp = ws	
	}
	randomTimer++
	if(randomTimer > 5*60)
	{
		ran = irandom_range(0,4)
		randomTimer = 0
		hsp = 0
		vsp = 0
	}
	if(hsp != 0)
	{
		image_xscale = hsp/abs(hsp)
	}
	move_and_collide(hsp,vsp,obj_collision)
	
	if(instance_place(x,y,obj_bullet_n3))
	{
		state = "blood"
		instance_destroy(instance_place(x,y,obj_bullet_n3))
	}
}
