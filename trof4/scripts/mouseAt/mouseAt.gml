// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function mouseX()
{
	var _mx = mouse_x
	return _mx
}
function mouseY()
{
	var _my = mouse_y
	return _my
}


function mouseAt(x,y,radx,rady) 
{
	var mx = mouseX()
	var my = mouseY()
	//draw_rectangle(x-radx,y-rady,x+radx,y+rady, true)
	if (mx < x+radx) and (mx > x-radx) and (my > y-rady) and (my < y+rady)
	{
		return true
	}
	else{return false}
}

function windowWidth()
{
	return window_get_width()/global.xscale
}
function windowHeight()
{
	return window_get_height()/global.yscale
}


