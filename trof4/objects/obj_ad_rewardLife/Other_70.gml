/*// Early exit if there is no 'type' key defined
if (!ds_map_exists(async_load, "type")) 
{
	show_debug_message("fuck")
exit;

}
// All the events triggered by the AdMob extension have a “type” key
// containing a string that starts with “AdMob_”.
switch(async_load[? "type"])
{
    // AdMob_Initialize() finished initializing the API
    case "AdMob_OnInitialized":

        // Now that we are sure that the API got initialized we can load
        // a new rewarded video ad.(more info: AdMob_RewardedVideo_Load).
        // This function will generate an ASYNC SOCIAL EVENT.
        AdMob_RewardedVideo_Load();
		show_debug_message("time to load an ad!")
        break;

    // AdMob_RewardedVideo_Load() succeeded
    case "AdMob_RewardedVideo_OnLoaded":

        // At this point we should now have the rewarded ad loaded and
        // and we can check that using the ´AdMob_RewardedVideo_IsLoaded´
        // function. We are now ready to show the rewarded video ad to the
        // user (more info: AdMob_RewardedVideo_Show). This function will
        // generate an ASYNC SOCIAL EVENT.
        AdMob_RewardedVideo_Show();
		
		show_debug_message("Loaded!")
        break;

    // AdMob_RewardedVideo_Load() failed
    case "AdMob_RewardedVideo_OnLoadFailed":

        // At this point there was a problem while loading the
        // interstitial ad. Here we can add some code to deal with it.

        // NOTE: Don’t try to reload the interstitial ad here because
        // it can lead to an infinite loop.
		show_debug_message("Load failed 3:")
		AdMob_RewardedVideo_Load();
        break;

    // AdMob_RewardedVideo_Show() succeeded
    case "AdMob_RewardedVideo_OnFullyShown":

		show_debug_message("ad done :)")
        // At this point the rewarded video ad is playing and the user is
        // looking at it. Note that at this point in time your game is
        // paused and will remain paused until the rewarded video ad gets
        // dismissed.
        break;

    // AdMob_RewardedVideo_Show() failed
    case "AdMob_RewardedVideo_OnShowFailed":

		show_debug_message("ad failed :)")
        // At this point the rewarded video ad failed to get shown to the
        // user. You can add code to deal with the problem here.

        // NOTE: Don’t try to reload/show the rewarded video here
        // because it can lead to an infinite loop.
        break;

    // RewardedVideo got dismissed
    case "AdMob_RewardedVideo_OnDismissed":
		show_debug_message("ad dismissed :)")
        // At this point the rewarded video ad got dismissed by the user
        // and the game logic is running again.
        break;

    // RewardedVideo triggered the reward event
    case "AdMob_RewardedVideo_OnReward":
		show_debug_message("ad reward!!! :)")
        // At this point the user watched enough of the rewarded video and
        // can be rewarded for it. Here we can add the reward code.
        show_debug_message("You got 1000 points");
        break;

}