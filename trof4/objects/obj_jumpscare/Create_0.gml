frame = 0

aiID = 9999

gvFrame = 0

if(obj_game.state = "gameover")
{
	instance_destroy();
}

audio_play_sound(snd_js_4,99999, false)

obj_doDeHandler.aggressiveness = 0
obj_ai_bonnie.aggressiveness = 0
obj_ai_chica.aggressiveness = 0
obj_ai_freddy.aggressiveness = 0
obj_ai_foxy.foAI = 0
obj_haHandler.aiID = 0
if(global.infiniteNight = true)
{
	global.enLive--		
	ini_open(global.sf)
	ini_write_real("data","enLi", global.enLive)
	if(global.enLive < 0)
	{
		global.enLive = 3
		ini_write_real("data","inf", 3)
	}
	ini_close();

}

show_debug_message("Jumpscared!!")