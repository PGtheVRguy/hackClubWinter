global.vTouch = input_virtual_create() //sets up the virtual touch thingy to convert touchscreen inputs to mouse presses
	.rectangle(-display_get_width(),-display_get_height(),display_get_width(),display_get_height())
	.button("shoot")
	.priority(10)
	
	//rectangle = area 
	//button = what button (duh)
	//priority = the priority over other buttons. I believe this works in a form of intersecting button system thingy or whatever.