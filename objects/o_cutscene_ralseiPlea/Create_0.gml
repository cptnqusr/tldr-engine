/// @description Cutscene function
// You can write your code in this editor

inst_dialogue = noone

function cutscene_RalseiPlea() {
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
	cutscene_audio_play(snd_txtral_trippy)
	cutscene_func(method(id, function(){
		inst_dialogue = text_typer_create("Can anyone h", 160, 140, DEPTH_UI.DIALOGUE_UI, "{can_skip(false)}{speed(3)}{xspace(3)}{yspace(18)}{break_tabulation(false)}{font(`text_DR`)}", "{p}{e}", {
			gui: true,can_superskip: false,caller: id,},)
	}))
	cutscene_sleep(45)
	cutscene_func(function(){room_goto_next()})
	cutscene_func(fader_fade,[1,0,1]) 
	
	cutscene_party_follow(true)
	cutscene_party_interpolate()
	cutscene_player_canmove(true)
	cutscene_play()
}