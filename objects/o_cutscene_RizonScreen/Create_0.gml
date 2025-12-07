/// @description Cutscene function
// You can write your code in this editor

function cutscene_rizonScreen() {
	cutscene_create()
	
	cutscene_player_canmove(false)
	cutscene_party_follow(false)
	
	// cutscene_sleep(10)
	cutscene_func(fader_fade,[1,0,20])
	cutscene_sleep(30)
	cutscene_audio_play(snd_undertale_captivity_yes)
	cutscene_sleep(230)
	cutscene_func(fader_fade,[0,1,20])
	cutscene_sleep(50)
	cutscene_dialogue([
	"{char(ralsei_noface)}{speed(2)}????: Please... anyone...", 
	"...my friend, they're...",
	"...he took their...",],,)
	cutscene_sleep(30)
	cutscene_dialogue("{char(none)}{speed(3)}I just need someone to",,false,)
	cutscene_sleep(79)
	cutscene_func(function(){room_goto_next()})
	cutscene_func(fader_fade,[1,0,1]) 
	
	cutscene_party_follow(true)
	cutscene_party_interpolate()
	cutscene_player_canmove(true)
	cutscene_play()
}