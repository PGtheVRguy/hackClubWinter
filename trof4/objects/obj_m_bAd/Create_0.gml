x = windowWidth()/2
y = windowHeight()+32
image_xscale = 31
image_yscale = 7

ini_open(global.sf)
canAd = ini_read_real("data", "canAd", 1)
ini_close()
if(canAd = false)
{
	image_alpha = 0.25
}