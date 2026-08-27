var inst = actor_create(party_get_obj("frog"), 2000, 2000)
inst.dir = DIR.UP
//inst.s_override = true
//inst.image_speed

if memory_get("progress", "frogIntroduction") {
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
	cutscene_dialogue(["RIZON: Well, following instructions was never your strong suit."],,true)
	
	//animate sponge looking left, right, down
	cutscene_dialogue(["RIZON: Oh come now, you have heard my voice through an intercom before!", "RIZON: Now."])
	
	//sponge looks forward, Rizonbot drops in front
	cutscene_dialogue(["RIZON: Entertain me."])
	
	cutscene_sleep(10)
	cutscene_func(music_pause, 0)
	cutscene_func(instance_destroy, [o_ui_dialogue])
	cutscene_func(enc_start, new enc_set_rizonbot())
	cutscene_sleep(100)
	cutscene_wait_until(function() {
		return !instance_exists(o_enc)
	})
	cutscene_sleep(20)
	
	cutscene_dialogue(["RIZON: Bravo!", "RIZON: I believe an encore is in order."])
	
	//Four more rizonbots drop
	cutscene_dialogue(["RIZON: Ah, I may have dropped too many.", "RIZON: And we were only getting started...!"])
	
	//rizonbots advance, sponge backs up
	//frog jumps from the top rope and slashes one bot
	
	cutscene_dialogue(["FROG: Lower thine guard... and thou allow the enemy in!", "FROG: Let us dispatch these foul creations."])
	
	//start fight with 3 rizonbots, now with frog in party
	
	cutscene_sleep(10)
	cutscene_func(music_pause, 0)
	cutscene_func(instance_destroy, [o_ui_dialogue])
	cutscene_func(enc_start, new enc_set_rizonbot())
	cutscene_sleep(100)
	cutscene_wait_until(function() {
		return !instance_exists(o_enc)
	})
	cutscene_sleep(30)
	
	//frog and sponge still have swords up
	
	cutscene_dialogue(["RIZON: ...","RIZON: So be it."])
	
	//frog and sponge turn towards each other
	
	cutscene_dialogue(["FROG: Thou'rt well?", "FROG: ...", "FROG: I must commend thy swordsmanship!",])
	
	//frog thinking pose, 
	
	cutscene_dialogue("FROG: (Dare I find some familiarity...?)")
	
	//normal pose looking down
	
	cutscene_dialogue("FROG: (Ah. 'Tis nothing.)")
	
	//look at Sponge, mus_sadlonelyworld
	
	cutscene_dialogue(["FROG: Thou bear a sallow disposition, friend. I hath worn that face myself.",
	"FROG: What is thy name?", "FROG: ...Sponge?", "FROG: 'Tis nothing to be ashamed of! I hath heard far stranger."])
	
	//frog croak and eyes closed
	
	cutscene_dialogue(["FROG: For instance, my own! My name is Frog."])
	
	//wait a bit, frog looks away
	
	cutscene_dialogue(["FROG: (...not yet.)"])
	
	//turns back
	
	cutscene_dialogue(["FROG: Come! We must find an egress to this place.",])
	
	// fanfare, frog joins party
	
	cutscene_dialogue("FROG: And pray we shan't encounter more machines!")
	
	// next cutscene, enter next room filled with Rizonbots
	// FROG: "Oh, damn it all."
	
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
		memory_set("progress", "frogIntroduction")
	})
    
    cutscene_party_follow(true)
    cutscene_party_interpolate()
    cutscene_player_canmove(true)
    cutscene_play()
}