hsp = 1
if((x > room_width) or (x < 0 ))
{
	instance_destroy()
}
if((y > room_height) or (y < 0))
{
	instance_destroy()
}//look at me being performant >:3

x += hsp*5