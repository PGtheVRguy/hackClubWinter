if((instance_place(x,y,obj_whiteGuy)) or (instance_place(x,y,obj_player_n3)) or (instance_place(x,y,obj_mi_car)))
{
	audio_play_sound(snd_mg_cake,99,false)
	ini_open(global.sf)
	ini_write_real("cake",string(night),true)
	ini_close();
	x = -999999
	found = true
}
