haTi+= aiID

if(haTi > 15*global.framerate)
{
	moveX = random_range(-1,1)
	moveY = random_range(-1,1)
	global.hacker = true
}

if global.hacker = true
{
	if(instance_exists(obj_camera))
	{
		obj_camera.staticTimeMax = 0.3333+(obj_camera.staticTimer/global.framerate);
	}
	popTi++
	// originalScale = global.scale
	
	// scaleMod = sin(popTi)
	
	// global.scale = originalScale+scaleMod
	
	//window_set_position(window_get_x()+moveX,window_get_y()+moveY)
	
	if(popTi >= (popMa*global.framerate))
	{
		popTi = 0
		if(os_get_info() != os_android)
		{
		var _action = irandom_range(0,3)
		if _action = 0
		{
			repeat(irandom_range(1,4))
			{
				url_open(ds_list_find_value(urlList,irandom_range(0,ds_list_size(urlList)-1)))
			}	
		}
		
		//move window
		if _action = 1
		{
			_action = 3
			//url_open(ds_list_find_value(urlList,irandom_range(0,ds_list_size(urlList)-1)))//window_set_position(irandom_range(0,display_get_width()),irandom_range(0,display_get_height()))
		}
		if _action = 2
		{
			_action = 3
			//url_open(ds_list_find_value(urlList,irandom_range(0,ds_list_size(urlList)-1)))
		}
		if _action = 3
		{
			repeat(irandom_range(4,16))
			{
				instance_create_layer(0,0,"js",obj_imgPopup)
			}
		}

		
		
		
	}		
	if(os_get_info() == os_android)
	{
		_action = irandom_range(0,0)
		if(_action = 0)
		{
			repeat(irandom_range(4,16))
			{
				instance_create_layer(0,0,"js",obj_imgPopup)
			}
		}
	}
	}
	
	
}
else
{
	popTi = 0
}