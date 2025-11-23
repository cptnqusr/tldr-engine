var inst = actor_create(o_actor_rizon, 175, 315)
inst.s_override = false

trigger_code = function() {
    
    cutscene_create()
    cutscene_player_canmove(false)
    cutscene_party_follow(false)
    cutscene_set_variable(o_camera, "target", noone)
    
	cutscene_camera_pan(175, 300, 30, true)
	cutscene_sleep(30)
	
	cutscene_animate(party_get_inst("sponge").y,party_get_inst("sponge").y-100,200,,party_get_inst("sponge"),"y")
	cutscene_set_variable(party_get_inst("sponge"), "s_override", true)
	cutscene_set_variable(party_get_inst("sponge"), "sprite_index", spr_sponge_up_levitate)
	cutscene_set_variable(o_actor_rizon, "s_override",true)
	cutscene_set_variable(o_actor_rizon, "sprite_index", spr_rizon_down_armout)
	cutscene_sleep(200)
	
    
    cutscene_party_follow(true)
    cutscene_party_interpolate()
    cutscene_player_canmove(true)
    cutscene_play()
}