draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,-1,image_alpha)
draw_text_scribble(x+32,y-32,"[fa_center][fa_pixel][scale,0.69][fa_top]WATCH AD TO RETRY").wrap(sprite_width)

draw_sprite(spr_ad,0,x-(sprite_width/2)+32,y)


if(canAd = true)
{
	
	if((mouseAt(x,y,sprite_width/2,sprite_height/2)) && (input_check_pressed("shoot")))
	{
			
		if(AdMob_RewardedVideo_IsLoaded())
		{
			// Loaded: show rewarded video ad
		    AdMob_RewardedVideo_Show()
		}
		else
		{
			// Not Loaded: load rewarded video ad
		    show_message_async("RewardedVideoAd Still loading, try again soon")
			AdMob_RewardedVideo_Load()
		}

	}
}
else
{
	image_alpha = 0.25
}