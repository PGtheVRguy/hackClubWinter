var _audioArray = [snd_voice_d0]
draw_self()
xscale = 1
yscale = 1
//ty = window_get_height()-300
//draw_sprite_ext(spr_chatbox,0,0,ty,1,1,0,-1,1)

t = scribble("[scale,0.75][c_white]" + text)


//t.scale(2)

if input_check_pressed("accept")
{
	if(credits = false)
	{
	    cPage++
	    t.page(cPage)
	
	    if(t.get_page_count() < cPage+1)
	    {
	        credits = true
	    }
	}
}
var _c = c_black
if(credits = false)
{
	draw_rectangle_color(32,windowHeight()-256,windowWidth()-32,windowHeight()-16,_c,_c,_c,_c,false)

	t.wrap(windowWidth()-64, 256-15)
	typist.sound_per_char(_audioArray,1,1.5,0.5)
	t.draw(48,windowHeight()-256,typist)
}