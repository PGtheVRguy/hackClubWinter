global.xscale = display_get_width()/960
global.yscale = display_get_height()/540
/*


_w = 960//*global.scale
_h = 540//*global.scale


//window_set_size(_w,_h)
//display_set_gui_size(960,540)




if(!window_get_fullscreen())
{
	window_set_showborder(true);
	global.scale = 1
	window_set_size(960,540)
	//window_set_max_width(960)
	//window_set_max_height(540)
	display_set_gui_size(960,540)
}
else
{
	global.scale = window_get_width()/960
}

/*
if(keyboard_check_pressed(vk_f11))
{
	if(window_get_fullscreen())
	{
		window_set_fullscreen(false)
	}
	else
	{
		window_set_fullscreen(true)
	}
}


//global.scale = window_get_width()/960
show_debug_message(window_get_fullscreen())