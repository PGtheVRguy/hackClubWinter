if((instance_place(x,y,obj_player_n5)) && (input_check_pressed("accept")))
{
	cutscene = true
	frame = 1
}

if cutscene = true
{
	timer++
	
	if(timer > 6*60)
	{
		if(!instance_exists(obj_purpleguy))
		{
			instance_create_layer(448,64,"purpleguy",obj_purpleguy)
		}
	}
}
