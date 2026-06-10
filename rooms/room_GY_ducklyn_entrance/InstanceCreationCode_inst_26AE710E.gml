//var inst = actor_create(party_get_obj("bowie"), 101, 733)
//inst.s_override = true
//inst.sprite_index = spr_bowie_down_eyesclosed
//inst.image_speed = 0

trigger_code = function() {
    
    cutscene_create()
    cutscene_player_canmove(false)
    cutscene_party_follow(false)
    cutscene_set_variable(o_camera, "target", noone)
    
	cutscene_sleep(50)
	cutscene_set_variable(o_actor_sponge, "s_override", true)
	cutscene_set_variable(o_actor_sponge, "sprite_index", spr_sponge_duck_speak)
	cutscene_set_variable(o_actor_sponge, "image_speed",14)
	cutscene_audio_play(snd_reasoned_debate)
	cutscene_animate(7, 7, 200, "expo", o_actor_sponge, "shake")
	cutscene_sleep(200)
	cutscene_set_variable(o_actor_sponge, "s_override", false)
	cutscene_animate(0, 0, 10, "expo", o_actor_sponge, "shake")
	
    
    cutscene_party_follow(true)
    cutscene_party_interpolate()
    cutscene_player_canmove(true)
    cutscene_play()
}