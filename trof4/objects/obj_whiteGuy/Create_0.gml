/// @description Insert description here
// You can write your code in this editor


global.count = 0





finished = false
timer = 0
walkspd = 10

/*
#region buttons

var _scale = 3
var _butD = 16+8

var _b = instance_create_layer(_butD,windowHeight()-16, "mobile", obj_minigameButton) //l
_b.type = "left"
_b.scale = _scale

_b = instance_create_layer(_butD*3,windowHeight()-16, "mobile", obj_minigameButton) //r
_b.type = "right"
_b.scale = _scale

_b = instance_create_layer(_butD*2,windowHeight()-16-_butD, "mobile", obj_minigameButton) //up
_b.type = "up"
_b.scale = _scale

_b = instance_create_layer(_butD*2,windowHeight()-16, "mobile", obj_minigameButton) //d
_b.type = "down"
_b.scale = _scale

_b = instance_create_layer(windowWidth()-_butD,windowHeight()-16, "mobile", obj_minigameButton) //b
_b.type = "broom"
_b.scale = _scale


#endregion