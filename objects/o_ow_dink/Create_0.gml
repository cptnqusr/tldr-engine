event_inherited()
npc_id = 1

interaction_code = function() {
	
    dinktroduction()
}

dinktroduction = function() {
	cutscene_create()
    cutscene_player_canmove(false)
    cutscene_party_follow(false)
    cutscene_set_variable(o_camera, "target", noone)
	
	cutscene_camera_pan(538, 397, 30, false)
	cutscene_actor_move(party_get_inst("sponge"), new actor_movement(
        488,
        397,
        20,,, DIR.RIGHT, true
    ), 1, false)
	cutscene_actor_move(party_get_inst("frog"), new actor_movement(
        630,
        397,
        20,,, DIR.LEFT, true
    ), 1, false)
	cutscene_sleep(50)
	cutscene_dialogue(["{npc_link(1)}DINK: Welcome to the End of Time, Douglath.", 
	"DINK: Have you come to rot alongside me?", 
	"{choice(`Pay goee may`,`Uh oh`)}{e}",])
	cutscene_dialogue(["{npc_link(1)}DINK: Wait a minute...", "DINK: You're the brat who {speed(3)}BROKE MY GRILL."])
	cutscene_actor_move(party_get_inst("frog"), new actor_movement(
        -30,
        0,
        10,,2, DIR.LEFT, false
    ), 1, true)
	cutscene_audio_play(snd_frog_croak)
	cutscene_dialogue("FROG: Hold thy tongue, impostor! Sponge hath not merited thy aspersions.")
	cutscene_dialogue(["{npc_link(1)}DINK: I'll have you know that the grill this man broke...", 
	"DINK: ...was VERY EXPENSIVE.", 
	"DINK: As much as I want a rematch, there's more pressing matters to discuss.",
	"DINK: I forgo the vengeance of my grill... for now."])
	cutscene_dialogue("FROG: If thou art not Gaspar, then where are my comrades?")
	cutscene_dialogue(["{npc_link(1)}DINK: I don't think the people you're looking for are here.",
	"DINK: Rizon seems pretty choosy about who he wants in Gloom York.",],,true,)
	cutscene_set_variable(party_get_inst("frog"), "dir", DIR.RIGHT)
	cutscene_dialogue("FROG: ...blast.")
	cutscene_dialogue(["{npc_link(1)}DINK: In terms of getting out, there's even less of a chance.", 
	"DINK: Believe me, I tried."],,true)
	cutscene_sleep(20)
	cutscene_set_variable(party_get_inst("sponge"), "dir", DIR.LEFT)
	cutscene_sleep(10)
	cutscene_actor_move(party_get_inst("frog"), new actor_movement(
        0,
        20,
        30,,2, DIR.DOWN, false
    ), 1, true)
	cutscene_set_variable(party_get_inst("frog"), "sprite_index", spr_frog_think_down)
	cutscene_set_variable(party_get_inst("frog"), "s_override", true)
	cutscene_dialogue("FROG: I take it that thou also standest opposed to the fiend?")
	cutscene_dialogue("{npc_link(1)}DINK: I heard knockoff Douglath talking about being locked up.",,true)
	cutscene_set_variable(party_get_inst("frog"), "dir", DIR.LEFT)
	cutscene_set_variable(party_get_inst("frog"), "s_override", false)
	cutscene_set_variable(party_get_inst("sponge"), "dir", DIR.RIGHT)
	cutscene_dialogue("FROG: Aye, we received that vision, too.")
	cutscene_dialogue(["{npc_link(1)}DINK: In fact, I might know who we're trying to spring.", 
	"DINK: They were giving Rizon a run for his money...", 
	"DINK: ...then he pulled out some sort of weapon.",]) 
	cutscene_dialogue(["DINK: They were trying to keep one of them alive until they got captured."],,false)
	cutscene_sleep(30)
	cutscene_set_variable(party_get_inst("frog"), "sprite_index", spr_frog_surprise_left)
	cutscene_set_variable(party_get_inst("frog"), "s_override", true)
	cutscene_set_variable(party_get_inst("sponge"), "sprite_index", spr_sponge_sad_right)
	cutscene_set_variable(party_get_inst("sponge"), "s_override", true)
	cutscene_wait_dialogue_finish()
	cutscene_sleep(20)
	cutscene_set_variable(party_get_inst("frog"), "sprite_index", spr_frog_sad_right)
	cutscene_dialogue(["FROG: So it appears we are not alone in our fight. And yet, he singlehandedly overcame these heroes...", 
	"FROG: Hath we the strength to slay something so monstrous?", 
	"FROG: The mind wills, but I feel the flesh falter."])
	cutscene_func(music_fade, [0, 0])
	cutscene_sleep(30)
	cutscene_dialogue("{npc_link(1)}DINK: The flesh always rots, Frog. {p}Yet the will shall never die.")
	cutscene_set_variable(party_get_inst("sponge"), "s_override", false)
	cutscene_sleep(45)
	cutscene_dialogue(["FROG: ... 'tis a fool's errand.", 
	"FROG: I suppose I shall play the old fool...", 
	"FROG: ...rather than the coward."],,false)
	cutscene_wait_dialogue_boxes(2)
	cutscene_set_variable(party_get_inst("frog"), "dir", DIR.LEFT)
	cutscene_set_variable(party_get_inst("frog"), "s_override", false)
	cutscene_sleep(10)
	cutscene_audio_play(mus_frog_theme,true,2)
	cutscene_wait_dialogue_finish()
	cutscene_dialogue(["{npc_link(1)}DINK: Attafrog. The first key's in Ducklyn.", 
	"DINK: Come back here if you want to talk or get around town."])
	cutscene_audio_play(snd_frog_croak,,1)
	cutscene_dialogue("FROG: Onward, Sponge.")
	
	
	cutscene_func(function() {
		camera_unpan(get_leader(), 10)
	})
	
	cutscene_party_follow(true)
    cutscene_party_interpolate()
    cutscene_player_canmove(true)
    cutscene_play()
}