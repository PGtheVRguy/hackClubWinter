// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_store(){

}

//STnoAds = [spr_storeCam, "No Ads", "Removes the ads", adDesc, 4.99]
function storeItem(_itemArray,_x,_y){
	
	var _i = _itemArray
	draw_sprite_ext(_i[0],0,_x,_y,3,3,0,-1,1)
	var _title = "[fa_center][fa_left][scale,0.65]" + string(_i[1] + "[c_green] $" + string(_i[4]))
	var _desc = "[fa_center][fa_left][scale,0.25]" + string(_i[2])
	draw_text_scribble((_x+16*3)+15,_y-16*3,_title)
	draw_text_scribble((_x+16*3)+15,_y,_desc).wrap(312)
	
	draw_sprite_ext(spr_storeBg,0,(_x+(512+32*3)/2), _y+(32*3/2)-32*1.5, (512/2)+(32*2), 32*3/2,0,c_green,0.25)
	
	
	
	draw_rectangle(_x-(32*3)/2,_y-(32*3)/2,_x+512+(32*3),_y+(32*3)/2,true)
	
	
	//if(mouseAt((_x+512+(32*3))/2, _y+(32*3/2)-32*1.5, 512+(32*3)/2, 32*3/2))
	if(mouseAt((_x+(512+(32*3))/2), _y+(32*3/2)-32*1.5, (512/2)+(32*1.5), 32*3/2))
	{
		draw_sprite_ext(_i[0],0,_x,_y,3,3,0,c_black,0.5)
	}
	
}