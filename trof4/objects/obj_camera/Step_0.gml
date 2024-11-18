// You can write your code in this editor
blackout--
if !audio_is_playing(snd_cam_amb)
{
	audio_play_sound(snd_cam_amb,true,false)
}

global.mainCam = currentCam