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
	cutscene_set_variable(o_actor_bowie, "s_override", false)
	cutscene_set_variable(o_actor_bowie, "dir", DIR.DOWN)
	cutscene_sleep(25)
	//cutscene_dialogue("FROG: Aye, we received that vision, too.",,true)
	cutscene_set_variable(o_actor_bowie, "dir", DIR.RIGHT)
	cutscene_sleep(50)
	cutscene_set_variable(o_actor_bowie, "s_override", true)
	cutscene_set_variable(o_actor_bowie, "sprite_index", spr_bowie_right_armsout)
	cutscene_animate(5, 0, 10, "linear", o_actor_bowie, "shake")
	cutscene_sleep(50)
    
    cutscene_party_follow(true)
    cutscene_party_interpolate()
    cutscene_player_canmove(true)
    cutscene_play()
}