audio_stop_all();

staticFrame = 0
global.newgame = false
state = "warning" //menu state (should be switch but who tf cares at this point)
warnTimer = 0 //a timer for when to end the warning timer
al = 1 //alpha for warning screen
global.infiniteNight = false



ini_open(global.sf) //pulls all necessary save data for menu
unlExtraNight = ini_read_string("data","6th",0)
unlTrueNight = ini_read_string("data","true",0)
infNightSav = ini_read_string("data","inf",0)
unlXmasAlb = ini_read_string("data","xmas",0)


ini_close();

bO = -32

titleNames = ds_list_create() //A list of the different names for the main menu (it le funny josh)


ds_list_add(titleNames,"Fredingles")
ds_list_add(titleNames,"Fredricks")
ds_list_add(titleNames,"Froodies")
ds_list_add(titleNames,"Fasteners")
ds_list_add(titleNames,"Fillip")
ds_list_add(titleNames,"Flowersyd")
ds_list_add(titleNames,"TRTF")
ds_list_add(titleNames,"Freder")
ds_list_add(titleNames, "Frederick: The Movie")
repeat(20) //Drown out the other responses with Frederick just to make it a higher chance
{
	ds_list_add(titleNames,"Fredricks")
}
ds_list_shuffle(titleNames) //shuffles cuz why tf not, Bitch.


realTitle = ds_list_find_value(titleNames,irandom_range(0,ds_list_size(titleNames)-1)) //sets the title


#region store shit

bcDesc = "In your camera menu, you'll be able to see where each and every animatronic is from the map, no need to jump between cams!"
ieDesc = "Tired of your lights going out and getting caught, well for a price, we can upgrade our backup power so you can cheat! (looser)"
frDesc = "Removes the silly goober posters from your office. I'd say I'm mad but $100 is $100 :3"
adDesc = "Removes the ads, 'nough said"
//^Description items, set as seperate variables to make it easier to type
//A smarter person would not put this in code.


STbetterCam = [spr_storeCam, "24/7 Security", "Upgrades your security with trackers on each character", bcDesc, 1.99]
STinfElec = [spr_storeElec, "Infinite Electricity", "Upgrades your powersupply to have INFINITE power", ieDesc, 2.99]
STnoFurry = [spr_storeFur, "Anti Furry", "Removes the furry posters with Anti Furry Flag. Wai- FUCK YOU!", frDesc, 99.99]
STnoAds = [spr_storeAd, "No Ads", "Removes the ads", adDesc, 4.99]
//Array for the store items themselves


storeList = ds_list_create()//throw them on this ds_list for infinite scalability or whatever is "smart"
ds_list_add(storeList, STbetterCam)
ds_list_add(storeList, STinfElec)
ds_list_add(storeList, STnoFurry)
ds_list_add(storeList, STnoAds)

#endregion