

if(os_type = os_android)
{
	var _jM = "_m"
	var _jmult = 0.5
}
else
{
	var _jM = ""
	var _jmult = 1
}

scale = 960/sprite_get_width(asset_get_index("spr_jump_" + string(aiID) + _jM))



frame += 0.5*_jmult
if(sprite_exists(asset_get_index("spr_jump_" + string(aiID) + _jM)))
{
	var _s = asset_get_index("spr_jump_" + string(aiID) + _jM)
	draw_sprite_ext(_s,frame,0,0,scale,scale,0,-1,1)
}

if(frame > 90)
{
	audio_stop_all()
	obj_game.state = "gameover"
	audio_play_sound(snd_static, 99, false)
	instance_destroy();
	show_debug_message("done jumpscare!")
}
else
{
	obj_game.state = "office" //forces the player to be in the office >:3
}


global.hacker = false
