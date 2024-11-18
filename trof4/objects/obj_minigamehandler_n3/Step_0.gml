timer++
actualTimer++

if timer > 30
{
	repeat(10)
	{
		instance_create_layer(irandom_range(0,room_width+64),-5,"rain",obj_mi_rain)
	}
	timer = 0
}

if actualTimer > 60
{
	realTimer -= 1
	actualTimer = 0
}

if realTimer < 0
{
	room = room_game
}

scizo = irandom_range(0,100)

if scizo = 1
{
	instance_create_layer(0,0,layer,obj_mi_message)
}