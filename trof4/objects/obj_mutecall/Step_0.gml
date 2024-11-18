pc = asset_get_index("snd_ph_" + string(global.night))

if(!audio_is_playing(pc))
{
	instance_destroy();
}