/// @description Insert description here
// You can write your code in this editor
draw_self()

if (global.count = 17)
{
	draw_text(room_width/2,room_height/2,"congrads you prmote")
	y -= 2
	finished = true
}

if(finished = true)
{
	timer++
	
	if timer > 4*global.framerate
	{
		room = room_game
	}
}