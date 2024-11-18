if(global.night = 2)
{
	timer++
	
	if(timer >= (2*60)*global.framerate)
	{
		if(instance_exists(obj_haHandler))
		{
			obj_haHandler.aiID = 0.15
		}
	}
	if(timer >= (90*global.framerate))
	{
		if(instance_exists(obj_doDeHandler))
		{
			obj_doDeHandler.aggressiveness = 1
		}
	}
}