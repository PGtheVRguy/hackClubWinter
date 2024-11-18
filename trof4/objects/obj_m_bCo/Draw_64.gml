draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,-1,image_alpha)
draw_text_scribble(x+32,y,"[fa_center][fa_pixel][scale,0.69][fa_top]QUIT").wrap(sprite_width)

//draw_sprite(spr_ad,0,x-(sprite_width/2)+32,y)



if((mouseAt(x,y,sprite_width/2,sprite_height/2)) && (input_check_pressed("shoot")))
{
	show_debug_message("button time!")

	
	if((global.enLive  = 3) or (global.enLive < 0))
	{
		ini_open(global.sf)
		ini_write_real("data", "canAd", 1)
		ini_write_real("data", "inf", 1)
		ini_write_real("data", "enLi", 3)
		show_debug_message("you din dun fuckn' died")
		ini_close()
	}
	else
	{
		ini_open(global.sf)
		ini_write_real("data", "enLi", global.enLive)
		ini_close()
		show_debug_message("you din dun fuckn' FINE")
	}
	room = room_menu
	
}