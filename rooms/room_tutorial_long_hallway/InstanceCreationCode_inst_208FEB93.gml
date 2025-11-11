
trigger_code = function() {
	
	
	cutscene_create()
	cutscene_player_canmove(false)
	
	cutscene_sleep(10)
	cutscene_func(music_play, [mus_cymbal,0,false])
	cutscene_func(fader_fade_white,[0,1,150])
	cutscene_sleep(180)
	cutscene_func(fader_fade_white,[1,0,20])
	cutscene_func(music_play, [mus_somethingorange,0])
	cutscene_sleep(10)
	
	cutscene_party_follow(true)
	cutscene_party_interpolate()
	cutscene_player_canmove(true)
	cutscene_play()
}