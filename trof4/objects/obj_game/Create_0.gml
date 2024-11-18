global.mainCam = 0
time = 0
audio_stop_all()
randomize()
moveX = -128
//instance_create_layer(0,0,layer,obj_touchscreen)
changeX = 0
framePass = 0
state = "intro"
buttonPressed = false
introTimer = 0
introAlpha = 1
global.animatronicList = ds_grid_create(100,40)
global.vTouch.active(true);
didAd = false
instance_create_layer(0,0,layer,obj_render)
//instance_create_layer(0,0,layer,obj_jokeUI)

startEnergy = 500
energy = startEnergy
global.framerate = 60
currentTimer = 0
global.frontDoor = false
global.sideDoor = false
global.sideDoorLi = false
global.frontDoorLi = false
frontDoorAnim = 0
sideDoorAnim = 0

sanity = 100

//global.enLive = 0

debug = false

debugSkip = 1

phonePlayed = false
winTimer = 0
gvFrame = 0;

newspaperTimer = 0
npal = 1

if(global.newgame = true)
{
	state = "newspaper"
}

audio_channel_num(50)
//loading
loadWait = 0



if!audio_group_is_loaded(ag_musicbox)
{
	audio_group_load(ag_musicbox)
}


audio_group_set_gain(ag_musicbox,0,0)
instance_create_layer(0,0,layer,obj_doDeHandler)
if(global.infiniteNight = false)
{
	ini_open(global.sf)
	ini_write_real("data","night",global.night)
	ini_close();

	if(global.night = 6)
	{
		repeat(30)
		{
			instance_create_layer(0,0,layer,obj_fakeAd)
		}
	}
}
else
{
	//for endless mode
	phonePlayed = true
}


//The following loads all the camera sprites in the file
//This allows for much lower file sizes (for mobile) and heavily helps decrease file size
sprite_replace(ispr_cam_0, "camera/spr_cam_0.jpg",0,false,true,0,0)
sprite_replace(ispr_cam_1, "camera/spr_cam_1.jpg",0,false,true,0,0)
sprite_replace(ispr_cam_2, "camera/spr_cam_2.jpg",0,false,true,0,0)
sprite_replace(ispr_cam_3, "camera/spr_cam_3.jpg",0,false,true,0,0)
sprite_replace(ispr_cam_4, "camera/spr_cam_4.jpg",0,false,true,0,0)
sprite_replace(ispr_cam_5, "camera/spr_cam_5.jpg",0,false,true,0,0)
sprite_replace(ispr_cam_6, "camera/spr_cam_6.jpg",0,false,true,0,0)
sprite_replace(ispr_cam_7, "camera/spr_cam_7.jpg",0,false,true,0,0)
sprite_replace(ispr_cam_8, "camera/spr_cam_8.jpg",0,false,true,0,0)

sprite_replace(ispr_cam_9_0, "camera/spr_cam_9_0.jpg",0,false,true,1920/2,0) //1920
sprite_replace(ispr_cam_9_1, "camera/spr_cam_9_1.jpg",0,false,true,1920/2,0)

sprite_replace(ispr_cam_10, "camera/spr_cam_10.jpg",0,false,true,0,0)
sprite_replace(ispr_cam_11, "camera/spr_cam_11.jpg",0,false,true,0,0)
sprite_replace(ispr_cam_12, "camera/spr_cam_12.jpg",0,false,true,0,0)
sprite_replace(ispr_cam_13, "camera/spr_cam_13.jpg",0,false,true,0,0)



