if input_check_pressed("accept")
{
		/// @description Insert description here
	// You can write your code in this editor
	if (instance_place(x,y,obj_whiteGuy))
	{
		instance_destroy()
		audio_play_sound(snd_mg_trash,10,false)
		global.count++
	}
}