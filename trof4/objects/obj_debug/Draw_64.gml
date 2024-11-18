/*if(input_check("shoot"))
{
	color = c_blue	
}
else
{
	color = -1
}


//draw_sprite_ext(spr_de_mouse,0,display_mouse_get_x(),display_mouse_get_y(),1,1,0,color,0.25)


draw_sprite_ext(spr_de_mouse,0,mouseX(),mouseY(),0.15,0.15,0,color,0.25)


if(input_check("shoot"))
{
	var _leftd = true
}
else
{
	var _leftd = false	
}
draw_text_scribble(mouseX(),mouseY()+16,"[fa_fnaf][scale,0.35]left down: " + string(_leftd))
draw_text_scribble(mouseX(),mouseY()+32,"[fa_fnaf][scale,0.35]OS: " + string(os_get_info()))
/*
//draw_sprite_ext(spr_de_mouse,0,tx/global.xscale,ty/global.yscale,1,1,0,color,0.25)

draw_text_scribble(mouseX(),mouseY()+16,"[fa_fnaf][scale,0.15]x: " + string(mouseX()) + " y: " + string(mouseY()))
draw_text_scribble(mouseX(),mouseY()+32,"[fa_fnaf][scale,0.15]xscale: " + string(global.xscale) + " yscale: " + string(global.yscale))
draw_text_scribble(mouseX(),mouseY()+48,"[fa_fnaf][scale,0.15]guiwidth: " + string(display_get_gui_width()) + " guiheight: " + string(display_get_gui_height()))
draw_text_scribble(mouseX(),mouseY()+64,"[fa_fnaf][scale,0.15]diswid: " + string(display_get_width()) + " dishei: " + string(display_get_height()))
draw_text_scribble(mouseX(),mouseY()+80,"[fa_fnaf][scale,0.15]winwid: " + string(window_get_width()) + " winhei: " + string(window_get_height()))
draw_text_scribble(mouseX(),mouseY()+96,"[fa_fnaf][scale,0.15]want x: " + string(mouse_x) + " want y: " + string(mouse_y))
draw_text_scribble(mouseX(),mouseY()+96+16,"[fa_fnaf][scale,0.15]guix: " + string(device_mouse_x_to_gui(0)) + " guiy: " + string(device_mouse_y_to_gui(0)))
draw_text_scribble(mouseX(),mouseY()+96+32,"[fa_fnaf][scale,0.15]dmx: " + string(display_mouse_get_x()) + " dmy: " + string(display_mouse_get_y()))