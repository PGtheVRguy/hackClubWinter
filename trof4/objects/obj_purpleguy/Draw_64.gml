if(credits = true)
{
	if credTimer > 2*60
	{
		draw_rectangle_color(0,0,windowWidth(),windowHeight(),c_black,c_black,c_black,c_black,false)
	}
	credTimer++
	if(credTimer > 3*60)
	{
		endAl += 0.05
	}
	if(credTimer > 5*60)
	{
		postAl += 0.05
	}
	if(credTimer > 7*60)
	{
		realCredAl += 0.05
	}
	if(credTimer > 15*60)
	{
		room = room_menu
	}
	
	if((realCredAl >= 1) and (input_check_pressed("shoot")))
	{
		room = room_menu
	}
	

	draw_text_scribble(windowWidth()/2,windowHeight()/2,"[scale,0.5][fa_fnaf][fa_center][alpha,"+ string(endAl) + "]The End?")

	#region ini cake

	ini_open(global.sf)
	var _c1 = ini_read_real("cake","1",0)
	var _c2 = ini_read_real("cake","2",0)
	var _c3 = ini_read_real("cake","3",0)
	var _c4 = ini_read_real("cake","4",0)
	cake = _c1+_c2+_c3+_c4


	#endregion

	if(cake >= 4)
	{
		finalText = "[rainbow]You have unlocked the True Nights"
		ini_open(global.sf)
		ini_write_real("data","true",1)
		ini_close();
	}
	else
	{
		finalText = "To end the full story, find all\nthe cake slices in the hidden minigames"
	}

	draw_text_scribble(windowWidth()/2,(windowHeight()/2)+32,"[fa_center][scale,0.15][fa_fnaf][alpha,"+ string(postAl) + "]" + string(finalText))

	ini_open(global.sf)
	ini_write_real("data","6th",1)
	ini_close();	


	credText = "Programming and 3D Modeling by PGtheVRguy, concepts creating by Mr. Malencholy, Co-Programmed by YurtleLord\nMusic by Kevin Macleod, sfx from freesound.org\nFurniture from Renafox on Sketchfad, monitors from Glitch5970 on Sketchad\nInspired by Five Nights at Freddys by Scott Cawthon"

	draw_text_scribble(windowWidth()/2,windowHeight()-64,"[fa_center][scale,0.15][alpha," + string(realCredAl) + "]" + string(credText))
}