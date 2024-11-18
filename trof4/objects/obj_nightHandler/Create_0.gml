I = 1
timer = 0

if(global.night = I)
{
	boAI = 3
	chAI = 3
	frAI = -20
	foAI = 0
	haAI = 0
	arAI = 0
}
if(global.night = 2)
{
	boAI = 4
	chAI = 3
	frAI = -2
	foAI = 0.5
	haAI = 0
	arAI = 0
}
if(global.night = 3)
{
	boAI = 6
	chAI = 6
	frAI = 3
	foAI = 1
	haAI = 0.25
	arAI = 1
}
if(global.night = 4)
{
	boAI = 8
	chAI = 8
	frAI = 4
	foAI = 2
	haAI = 0.5
	arAI = 1
}
if(global.night = 5)
{
	boAI = 10
	chAI = 10
	frAI = 8
	foAI = 3
	haAI = 2
	arAI = 1
}
if(global.night = 6)
{
	boAI = 0
	chAI = 0
	frAI = 20
	foAI = 0
	haAI = 2
	arAI = 1
}
//TRUE NIGHTS
if(global.night = 10)
{
	boAI = 20
	chAI = 20
	frAI = 20
	foAI = 4
	haAI = 99 //hacker
	arAI = 2
}

if(global.night = 20)
{
	var _ai = global.customAiLevels
	boAI = _ai[1]
	chAI = _ai[2]
	frAI = _ai[0]
	foAI = _ai[3]/5
	haAI = 0.5
	arAI = 0.25
}

if(global.infiniteNight = true)
{
	random_set_seed(global.night)
	randomize()
	boAI = irandom_range(-4,20)
	chAI = irandom_range(-4,20)
	frAI = irandom_range(-4,20)
	foAI = irandom_range(0,4)
	haAI = irandom_range(0,2)
	arAI = irandom_range(0,2)
}


instance_create_layer(0,0,"ai",obj_ai_bonnie)
instance_create_layer(0,0,"ai",obj_ai_chica)
instance_create_layer(0,0,"ai",obj_ai_foxy)
instance_create_layer(0,0,"ai",obj_ai_freddy)

instance_create_layer(0,0,"ai",obj_haHandler)


obj_doDeHandler.aggressiveness = arAI
obj_ai_bonnie.aggressiveness = boAI
obj_ai_chica.aggressiveness = chAI
obj_ai_freddy.aggressiveness = frAI
obj_ai_foxy.foAI = foAI
obj_haHandler.aiID = haAI
