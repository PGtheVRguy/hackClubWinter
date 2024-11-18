//N3 - 53sec
//N4 - 202sec

if((global.night = 3) && (audio_is_playing(snd_ph_3)) && (ammo = false))
{
	timer++
	
	if timer > (53*global.framerate)
	{
		audio_play_sound(snd_gun_load,10,false)
		ammo = true
	}
}
if((global.night = 4) && (audio_is_playing(snd_ph_4)) && (money = false))
{
	timer++
	
	if timer > (202*global.framerate)
	{
		audio_play_sound(snd_money_gained,10,false)
		money = true
	}
}
