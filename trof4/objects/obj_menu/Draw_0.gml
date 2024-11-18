
if(state = "menu") //For the normal menu state
{

	if(!audio_is_playing(snd_menu))
	{
		audio_play_sound(snd_menu,0,true,1.5) //play menu theme
	}

	//title = "[fa_fnaf]The\nRevival\nOf\n" + string(realTitle) +" 3\nredux" //title draw
	title = "[fa_fnaf]PROJECT\nF.R.E.D.E.R.I.C.K."
	draw_set_font(fa_fnaf)
	staticFrame += 0.1
	draw_sprite_ext(spr_static,staticFrame,0,0,3,1.5,0,-1,0.25) //vhs effects so retro
	draw_sprite_ext(spr_vhsCorrupt,staticFrame,0,0,3,1.5,0,-1,0.25)




	draw_text_scribble(15,15,$"[fa_fnaf][fa_top][scale,0.75][fa_left]{title}") //title actual draw (ignore last that guy was a dumbass)

	var _ngIcon = ""; //this is a bad way to do this
	var _cgIcon = "";
	var _skIcon = "";
	var _trIcon = "";
	var _stIcon = "";
	var _ifIcon = "";
	var _cuIcon = "";
	/*
	if(mouseAt(windowWidth()-150,windowHeight()-100+25,125,40)) //we do one of these for each button (it'd be better to fit these in a custom script but im dumb and stupid)
	{
		var _stIcon = ">>"
		if input_check_pressed("shoot")
		{
			instance_create_layer(0,0,layer,obj_ad_rewardLife)
			audio_play_sound(snd_cam_change,10,false)
			state = "store"
			audio_stop_sound(snd_menu)
			audio_play_sound(snd_store, 10, true)
		}
	}
	
	
	
	
	draw_text_scribble(windowWidth()-150,windowHeight()-100,"[scale,1.25][fa_center]" + _stIcon +"STORE")
	*/
	if(mouseAt(100,344+bO,100,20))
	{
		var _ngIcon = ">>"
		if input_check_pressed("shoot")
		{
			audio_play_sound(snd_cam_change,10,false)
			global.newgame = true
			global.night = 1
			room = room_game
		}
	}
//holy shit when I get home im cleaning this up

	draw_text_scribble(15,320+bO,"[fa_fnaf][fa_top][scale,0.75][fa_left]" + string(_ngIcon) + "New Game")

	if(mouseAt(100,394+bO,100,20))
	{
		var _cgIcon = ">>"
		if input_check_pressed("shoot")
		{
			if(file_exists(global.sf))
			{
				ini_open(global.sf)
				global.night = ini_read_real("data","night",1)
				ini_close();
				global.night = clamp(global.night,1,5)
			}
			else
			{
				global.night = 1;
			}
			room = room_game
		}
	}
	draw_text_scribble(15,370+bO,"[fa_fnaf][fa_top][scale,0.75][fa_left]" + string(_cgIcon) + "Continue")
	/*
	
	if(unlExtraNight = 1)
	{
		if(mouseAt(100,444+bO,100,20))
		{
			var _skIcon = ">>"
			if input_check_pressed("shoot")
			{
				global.night = 6
				room = room_game
			}
		}
		draw_text_scribble(15,420+bO,"[fa_fnaf][fa_top][scale,0.75][fa_left]" + string(_skIcon) + "6th Night")
	}
	if(unlTrueNight = 1)
	{
		if(mouseAt(100,494+bO,100,20))
		{
			var _trIcon = ">>"
			if input_check_pressed("shoot")
			{
				global.night = 10
				room = room_game
			}
		}
		draw_text_scribble(15,470+bO,"[fa_fnaf][fa_top][scale,0.75][fa_left]" + string(_trIcon) + "True Night")
	}



	if(mouseAt(100,544+bO,100,20))
	{
		var _ifIcon = ">>"
		if input_check_pressed("shoot")
		{
			global.infiniteNight = true
			ini_open(global.sf)
			global.night = ini_read_real("data","inf", 1)
			global.enLive = ini_read_real("data","enLi", 3)
			ini_close();
			room = room_game
		}
	}
	draw_text_scribble(15,520+bO,"[fa_fnaf][fa_top][scale,0.75][fa_left]" + string(_ifIcon) + "Endless Night")
	*/
	if(mouseAt(700,423+bO,50,20))
	{
		var _cuIcon = ">>"
		if input_check_pressed("shoot")
		{
			instance_create_layer(0,0,layer,obj_customNightManagement)
			state = "customnight"
			audio_play_sound(snd_cam_change,10,false)
			//global.infiniteNight = true
			//ini_open(global.sf)
			//global.night = ini_read_real("data","inf", 1)
			//global.enLive = ini_read_real("data","enLi", 3)
			//ini_close();
			//room = room_game
		}
	}
	draw_text_scribble(642,401+bO,$"[fa_fnaf][fa_top][scale,0.75][fa_left]{_cuIcon}Custom")






	if input_check_pressed("shoot") //debug
	{
		show_debug_message("x: " + string(mouse_x))
		show_debug_message("y: " + string(mouse_y))
	}

	draw_text_scribble(windowWidth()-5,windowHeight()-25,"[fa_right][fa_bottom][scale,0.25]Inspired by Scott Cawthon's Five Nights at Freddy's")
	draw_text_scribble(windowWidth()-5,windowHeight()-5,"[fa_right][fa_bottom][scale,0.25]v0.0a") //version number
}


if(state = "warning") //on boot, we do waring screen
{
	if(global.warn = true)
	{
		state = "menu"
	}
	var _col = c_black
	draw_rectangle_color(-windowWidth(),-windowHeight(),windowWidth(),windowHeight(),_col,_col,_col,_col,false)
	draw_text_scribble(windowWidth()/2,windowHeight()/2,"[fa_center][alpha," + string(al) + "]WARNING\nThis game contains loud noises, flashing lights,\n and lots of jumpscares.")
	warnTimer++
	
	if(warnTimer > 5*60)
	{
		al -= 0.05
	}
	if(al = -2)
	{
		global.warn = true
		state = "menu"
	}

}


if(state = "store") //store stuff
{
	draw_sprite(spr_store,0,0,0)  //store bg
	draw_text_scribble(windowWidth()/2,25,"[fa_center][wave]STORE")
	var _yLoop = 0
	repeat(ds_list_size(storeList))
	{
		var _i = ds_list_find_value(storeList,_yLoop)
		storeItem(_i,64,128+(((32*3)+16)*_yLoop))
		
		
		_yLoop++
	}
	
	
	
	if(mouseAt(50,20,100,35)) //go back to menu 
	{
		if input_check_pressed("shoot")
		{
			audio_play_sound(snd_cam_change,10,false)
			state = "menu"
			audio_stop_sound(snd_store)
			audio_play_sound(snd_menu, 10, true)
		}
	}
	
	
	
	
	draw_text_scribble(75,20,"[scale,1][fa_center]" +"BACK")
	
	
	
	
	
}

