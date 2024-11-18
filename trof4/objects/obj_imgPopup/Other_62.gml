if ds_map_find_value(async_load, "id") == file
{
    var status = ds_map_find_value(async_load, "status");
    if status == 0
    {
        var path = ds_map_find_value(async_load, "result");
        sprite = sprite_add(path,0,0,0,0,0)
        drawSprite = true
		alpha = 5
    }
}