state = "default";
maxSpeed = 10;
hp = 3;
global.threats = 0
orMaxSp = maxSpeed
curSD = 0
ammo = 0
curAM = ammo
hpAM = 0
MainSpeed = 0.25
blood = 0

children = instance_number(obj_child_n3)
dead = 0

audio_stop_all()

audio_play_sound(snd_mg_rain,10,true)
