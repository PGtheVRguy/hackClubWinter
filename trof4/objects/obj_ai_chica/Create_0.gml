//test man

global.aiGrid = load_csv("AI.csv")
aiTimer = 0
currentCam = 12
aiID = 1
ds_grid_set(global.animatronicList,currentCam,aiID,true)

pushbackCam = 12
aggressiveness = 1

AIcreate();
