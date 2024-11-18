 
/*global.vTouch.active(false)
global.vTouch.destroy();
image_alpha = 0.5
immune = false
kill = false
if(os_type != os_android)
{
	instance_destroy()
}

if type = "left"
{
	image_index = 0
	image_angle = 180
	var _but = type
	var _gmBut = vk_left
}
if type = "up"
{
	image_index = 0
	image_angle = 90
	var _but = type
	var _gmBut = vk_up
}
if type = "right"
{
	image_index = 0
	image_angle = 0
	var _but = type
	var _gmBut = vk_right
}
if type = "down"
{
	image_index = 0
	image_angle = -90
	var _but = type
	var _gmBut = vk_down
}
if type = "shoot"
{
	image_index = 1
	image_angle = 0
	var _but = "accept"
	var _gmBut = vk_space
	immune = true
}
if type = "broom"
{
	image_index = 2
	image_angle = 0
	var _but = "accept"
	var _gmBut = vk_space
	immune = true
}

	
	image_xscale = scale 
	image_yscale = scale
	
	horScale = (sprite_width/2)
	verScale = (sprite_height/2)
	/*
	_ix = x+(sprite_width/2)*scale
	_iy = y+(sprite_height/2)*scale*/
	_ix = x
	_iy = y
	/*
	button = virtual_key_add(x-horScale,y-verScale,sprite_width,sprite_height,_gmBut)
	virtual_key_show(button);*/
	
	/* 
	vbTouch = input_virtual_create()
	.rectangle(_ix-horScale,_iy-verScale,_ix+horScale,_iy+verScale)
	
	.priority(0)
	.button(_but)
	show_debug_message(_ix-horScale)
	
/*

vTouch = input_virtual_create()
	.rectangle(-display_get_width(),-display_get_height(),display_get_width(),display_get_height())
	.button("shoot")