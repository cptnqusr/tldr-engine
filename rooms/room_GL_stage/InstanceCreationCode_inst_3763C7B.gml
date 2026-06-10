var inst = actor_create(o_actor_greyleno, 241, 152)
inst.s_override = true
inst.sprite_index = spr_greyleno_saiyan

trigger_code = function() {
    
    cutscene_create()
    cutscene_player_canmove(false)
    cutscene_party_follow(false)
    cutscene_set_variable(o_camera, "target", noone)
    
	cutscene_sleep(10)
	cutscene_set_variable(o_actor_greyleno,"sprite_index",spr_greyleno_saiyan)
	cutscene_actor_move_old(o_actor_greyleno, new actor_movement(
	193,
	81,
	15,
	,,DIR.DOWN,true),,true)
	cutscene_audio_play(snd_locker,,0.5)
	cutscene_func(screen_shake,[4,20])
	cutscene_set_variable(o_actor_greyleno,"s_override",true)
	cutscene_set_variable(o_actor_greyleno,"sprite_index",spr_greyleno_saiyan)
	cutscene_sleep(50)
    
    cutscene_party_follow(true)
    cutscene_party_interpolate()
    cutscene_player_canmove(true)
    cutscene_play()
}