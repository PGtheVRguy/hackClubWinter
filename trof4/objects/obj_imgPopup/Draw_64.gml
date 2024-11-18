if(drawSprite = true)
{
	alpha -= 0.05
	var _w = 256/sprite_get_width(sprite)
	var _h = 256/sprite_get_height(sprite)
	draw_sprite_ext(sprite,0,x,y,_w,_h,0,-1,alpha)
	draw_text_scribble(x,y,"[fa_top][fa_left][scale,0.25]img from api.tinyfox.dev")
}

if alpha = 0
{
	instance_destroy();
}