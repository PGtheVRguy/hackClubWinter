// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function runAI(_char,_roomA,_roomB){
	var _ran = irandom_range(0,20)
	if _ran = 20
	{
		if _roomB != noone
		{
			var _roomRan = irandom_range(0,1)
			if _roomRan = 0{chooseRoom = _roomA}
			else{chooseRoom =_roomB}
		}
		else
		{
			chooseRoom = _roomA
		}
		ds_list_set(global.charAI,_char,chooseRoom)
	}
	
}


function AIscript(){
	aiTimer++

	if aiTimer > 6*60 
	{
		var _diceroll = irandom_range(0,20)
		show_debug_message(string(_diceroll) + " <= " + string(aggressiveness))
		if(_diceroll <= aggressiveness) //THIS CHECKS MOVEMENT
		{
			show_debug_message("SUCCESS!!")
			
			
			
			
			if((currentCam!= "MainHall") and (currentCam != "RightHall") && (currentCam != global.mainCam))//Every other cam
			{
				ds_grid_set(global.animatronicList,currentCam,aiID,false) //Says "ayo no longer at this cam"

			
				var _aiY = 7*aiID
			
				var _aiCCam = ds_grid_value_x(global.aiGrid,1,_aiY,10,_aiY,currentCam) //Gets the current cam
				var _aiACam = (ds_grid_value_y(global.aiGrid,_aiCCam,1,_aiCCam,6,"e"))-1 //gets amount of possible cams
				//show_debug_message(string(aiID) + ": x: " + string(_aiCCam) + " y: " + string(_aiACam)) //debug
				//show_debug_message(string(aiID) + " old: " + string(currentCam))//debug
			
				var _aiY = irandom_range(1,_aiACam-1)+(aiID*7)
				if(global.mainCam = currentCam)
				{
					if(instance_exists(obj_camera)){obj_camera.blackout = 4*global.framerate}
				}
				currentCam = ds_grid_get(global.aiGrid,_aiCCam,_aiY)//randomly chooses what cam is chosen
			

			
				if currentCam = "e"
				{
					currentCam = ds_grid_get(global.aiGrid,_aiCCam,_aiY-1)
				}
			
				//show_debug_message(string(aiID) + ": " + string(currentCam))//debug
				aiTimer = 0//resets the aiTimer
				if((currentCam != "MainHall") and (currentCam != "RightHall")) //if new pos in NOT MainHall
				{
					if(global.mainCam = currentCam)
					{
						if(instance_exists(obj_camera)){obj_camera.blackout = 4*global.framerate}
					}
					ds_grid_set(global.animatronicList,currentCam,aiID,true) //Tells the rest of aL that bro is here
				}
				else
				{
					if(currentCam = "MainHall")
					{
						audio_play_sound(snd_ntd,50,false)
						ds_grid_set(global.animatronicList,99,aiID,true)
					}
					if(currentCam = "RightHall")
					{
						audio_play_sound(snd_ntd,50,false)
						ds_grid_set(global.animatronicList,98,aiID,true)
					}
				}
			}
			else //At door
			{
				//main door
				if((currentCam = "MainHall"))
				{
					if global.frontDoor = true
					{
						ds_grid_set(global.animatronicList,99,aiID,false)
						aiTimer = 0
						currentCam = pushbackCam
						ds_grid_set(global.animatronicList,currentCam,aiID,true)
					}
					else
					{
						if(global.frontDoorLi = true)
						{
							aiTimer = 0
						}
						else
						{
							if(!instance_exists(obj_jumpscare))
							{
								var _js = instance_create_layer(0,0,"js",obj_jumpscare)
								_js.aiID = aiID
							}
						}
					}
				}
				//side door
				if((currentCam = "RightHall"))
				{
					if global.sideDoor = true
					{
						ds_grid_set(global.animatronicList,98,aiID,false)
						aiTimer = 0
						currentCam = pushbackCam
						ds_grid_set(global.animatronicList,currentCam,aiID,true)
					}
					else
					{
						if(global.sideDoorLi = true)
						{
							aiTimer = 0
						}
						else
						{
							var _js = instance_create_layer(0,0,"js",obj_jumpscare)
							_js.aiID = aiID
						}
					}
				}
			}
			
			//ds_list_set(global.animatronicList,aiID,currentCam)
		}
		else
		{
			show_debug_message("fail 3;")
		}
		aiTimer = 0
	}
	
}
	
	
	
	

	
	
function AIcreate(){
	midCheck1 = false
	midCheck2 = false
}


function midAIcheck(){ //Increments aggressiveness throughout night
	
	if((midCheck1 = false) && (obj_game.time = 2)){
		aggressiveness += 2
		midCheck1 = true	
	}
	if((midCheck2 = false) && (obj_game.time = 4)){
		aggressiveness += 2
		midCheck2 = true	
	}
	
	
}