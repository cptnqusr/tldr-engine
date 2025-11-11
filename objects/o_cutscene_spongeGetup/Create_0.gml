/// @description Insert description here
// You can write your code in this editor

cutscene_code = function() {
	
	cutscene_create()
	cutscene_player_canmove(false)
	
	cutscene_set_variable(party_get_inst("sponge"), "sprite_index", spr_sponge_dead)
	cutscene_set_variable(party_get_inst("sponge"), "s_override", true)
	cutscene_sleep(60)
	cutscene_animate(3, 0, 3, "linear", party_get_inst("sponge"), "shake")
	cutscene_audio_play(snd_noise)
	cutscene_sleep(30)
	cutscene_animate(3, 0, 3, "linear", party_get_inst("sponge"), "shake")
	cutscene_audio_play(snd_noise)
	cutscene_sleep(5)
	cutscene_audio_play(snd_noise)
	
	cutscene_set_variable(party_get_inst("sponge"), "s_override", false)
	cutscene_player_canmove(true)
	cutscene_play()
}