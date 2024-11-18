camHp = false//n1
money = false //n4
sanity = false //n2
ammo = false //n3
aCHP = 100
timer = 0

if(global.night == 1)
{
	camHp = true //n1
	money = false //n4
	sanity = false //n2
	ammo = false //n3
	aCHP = 75
}
if(global.night == 2)
{
	camHp = true //n1
	money = false //n4
	sanity = true //n2
	ammo = false //n3
	aCHP = 65
}
if(global.night == 3)
{
	camHp = true //n1
	money = false //n4
	sanity = true //n2
	ammo = false //n3
	aCHP = 45
}
if(global.night == 4)
{
	camHp = true //n1
	money = false //n4
	sanity = true //n2
	ammo = true //n3
	aCHP = 20
}
if(global.night == 5)
{
	camHp = true //n1
	money = true //n4
	sanity = true //n2
	ammo = true //n3
	aCHP = 10
}
if(global.night == 6)
{
	camHp = true //n1
	money = true //n4
	sanity = true //n2
	ammo = true //n3
	aCHP = 0
}