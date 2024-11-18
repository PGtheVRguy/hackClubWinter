/// @description Insert description here
// You can write your code in this editor


for(var i = 0; i < amountOfChar; i++)
{
	var _x = startPos + startPos*i
	var _y = windowHeight()/2
	draw_sprite(sprite_index, i, _x, _y)
	draw_text_scribble(_x, _y+64, $"[fa_center]{aiLevels[i]}")
	draw_sprite_ext(spr_buttonArrow, 0, _x+48, _y+64, 1, 1, 0, -1, 1)
	draw_sprite_ext(spr_buttonArrow, 0, _x-48, _y+64, -1, 1, 0, -1, 1)
	
	if(input_check_pressed("shoot"))
	{
	
		if(mouseAt(_x+48, _y+96, 16, 32))
		{
			aiLevels[i] += 1
			aiLevels[i] = clamp(aiLevels[i], 0, 20)
		}
		if(mouseAt(_x-48, _y+96, 16, 32))
		{
			aiLevels[i] -= 1
			aiLevels[i] = clamp(aiLevels[i], 0, 20)
		}
	}

}


draw_text_scribble(windowWidth()/2, (windowHeight()/2)+170, "[fa_center][fa_middle]FIRE")

if((input_check_pressed("shoot")) && (mouseAt(windowWidth()/2, (windowHeight()/2)+170, 64, 16)))
{
	global.night = 20
	global.customAiLevels = aiLevels
	room = room_game
}