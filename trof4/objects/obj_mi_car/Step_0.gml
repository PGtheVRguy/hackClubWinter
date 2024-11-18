/// @description per step
// You can write your code in this editor
if state != "dead"
{
    /*if instance_place(x,y,obj_tileEffect){speedMod = instance_place(x,y,obj_tileEffect).changeRate} //I think this sets IDs
    else{speedMod = 1}*/
	speedMod = 1

    //--
    //DRIVING FORWARD/BACKWARDS
    //--
    if input_check("up"){ //drive forward
        speed = lerp(speed,maxSpeed*speedMod,MainSpeed/4)
    }
    if input_check("down"){ //reverse
        speed = (lerp(speed,-maxSpeed*speedMod/2,(MainSpeed)/8))
    }

    //LOWERING SPEEDS
    if (!input_check("down") and !input_check("up")) //lower speed
    {
        if speed > 0{speed -= MainSpeed*speedMod*2}
        if speed < 0{speed += MainSpeed*speedMod*2}
        if ((speed < 0.40) and (speed > -0.40)){speed = 0}
    }


    //TURNING
    if input_check("left")
    {
        direction += ((speed/5)*2)*tRate 
    }

    if input_check("right")
    {
        direction -= ((speed/5)*2)*tRate
    }
    if ((input_check("right") or input_check("left")) and input_check("special"))
    {
        state = "drift"
    }
    else
    {
        state = "default"

    }

    if speed > maxSpeed{speed = maxSpeed} //keeps speed to never exceed max speed
    image_angle = direction
    //10:51

    //TIRE TRACKS
    if ((speed != 0) and (speedMod != 1)){
		//makeTireTrack()
    }



    //
    if state = "drift"
    {
        maxSpeed = 8
        speedMod = 0.8
        tRate = 1.5
        //makeTireTrack()

    
        if input_check("left")
        {
            image_angle = direction + 20
        }
        if input_check("right")
        {
            image_angle = direction - 20
        }
    }
}
if state = "default"
{
    maxSpeed = 10
    tRate = 1
}
//shooting

if instance_place(x,y,obj_child_n3)
{
    var deadB = instance_place(x,y,obj_child_n3)
	if deadB.state != "blood"
	{
		dead++
	}
	deadB.state = "blood"
}
if speed > 3
{
    
    if blood > 0
    {
        blood -= 0.3
    }
}


if hp < 1
{
    state = "dead";
}
if state = "dead"
{
    speed = lerp(speed,0,0.1)
}

if(children = dead)
{
	var _cake = instance_create_layer(room_width/2,room_height/2,layer,obj_mg_cakeslice)
	_cake.night = 2
	dead++

}


