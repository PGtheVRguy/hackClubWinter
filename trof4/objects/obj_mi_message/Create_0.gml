timer = 0

msgl = ds_list_create()


ds_list_add(msgl,"KILL")
ds_list_add(msgl,"MURDER")
ds_list_add(msgl,"SHOOT")
ds_list_add(msgl,"STIM")
ds_list_add(msgl,"KILL KILL KILL KILL KILL KILL KILL KILL KILL KILL")

msg = ds_list_find_value(msgl,irandom_range(0,ds_list_size(msgl)-1))