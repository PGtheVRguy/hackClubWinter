if(camHp = true)
{
	if(instance_exists(obj_camera))
	{
		draw_text_scribble(20,60,"[fa_left][fa_top]Cam Health: " + string(aCHP) + "%")
	}
}