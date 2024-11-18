//test man

global.aiGrid = load_csv("AI.csv")
aiTimer = 0
currentCam = 1
aiID = 0
ds_grid_set(global.animatronicList,currentCam,aiID,true)
pushbackCam = 2
aggressiveness = 2
AIcreate()
/*

Alright buddy let me sit you down to explain how the FNAF AI movement mechanics work!


So its quite simple, you get an AI level of 0-20, 0 is easy, 20 is hard.

Essentially, once every x seconds, we run a check if a random number (y) is less than the aggressiveness level.
So w/ that, we can essentially get a simple that is like difficulty, but there is a chance that the player can get
super unlucky or smth but who cares sounds like they gotta git gud. 


*/