
//global.scale = 1.5

//I believe this object controls the actual render properties of the window


instance_create_layer(0,0,layer,obj_touchscreen) //creates touchscreen (again, for insurance)

global.scale = window_get_width()/960  //yeah this is fucking stupid. Whou woulda thunk that people dont all use 16:9. Its like, not a standard. 

global.xscale = window_get_width()/960 //finds how horizontally scaled the game is
global.yscale = window_get_height()/540 //that but vertically


_s = global.scale //unused for fucking obvious reasons

//_w = 960//*_s
//_h = 540//*_s

_w = window_get_width()/global.xscale 
_h = window_get_height()/global.yscale


window_set_size(_w,_h) //scaling
display_set_gui_size(_w,_h)

if(room = room_menu)
{
	window_center(); //centers the window for crazy face
}

window_set_fullscreen(true) //Max is a winey bitch. "Wahhh I cant play this well on my 4k monitor" rich boy mf ass wahh wahhh wahhh. I coulda had the window move and be silly. But noooo, you HAD TO WINE.