var inst = actor_create(party_get_obj("frog"), 160, 200)
inst.dir = DIR.UP
//inst.s_override = true
//inst.image_speed

if state_get("progress", "frogIntroduction") {
	instance_destroy(inst)
	instance_destroy(id)
}

trigger_code = function() {
	cutscene_create()
    cutscene_player_canmove(false)
    cutscene_party_follow(false)
    cutscene_set_variable(o_camera, "target", noone)
    cutscene_func(music_fade, [0, 0, 40])
	
	
	cutscene_sleep(20)
	cutscene_dialogue("????: Halt, knave.",,true)
	
	cutscene_sleep(10)
	cutscene_func(music_pause, 0)
	cutscene_func(instance_destroy, [o_ui_dialogue])
	cutscene_func(enc_start, new enc_set_frog())
	cutscene_sleep(100)
	cutscene_wait_until(function() {
		return !instance_exists(o_enc)
	})
	cutscene_sleep(20)
	
	cutscene_dialogue("Oh damn!",,true)
	
	cutscene_func(function() {
        music_resume(0)
        music_fade(0, 1, 30)
		camera_unpan(get_leader(), 10)
		var inst = o_actor_frog.id
        
        array_push(global.party_names, "frog")
        party_member_create("frog", true, inst.x, inst.y)
        instance_destroy(inst)
    })
	
	cutscene_func(function() {
		state_add("progress", "frogIntroduction")
	})
    
    cutscene_party_follow(true)
    cutscene_party_interpolate()
    cutscene_player_canmove(true)
    cutscene_play()
}