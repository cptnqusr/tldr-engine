event_inherited()
npc_id = 1

interaction_code = function() {
    meatDummyFight()
}

meatDummyFight = function() {
	cutscene_create()
    cutscene_player_canmove(false)
    
	cutscene_dialogue(["...?", "It's beckoning you to take out your weapon.", "{choice(`Practice`,`I'm good`)}{e}"],,true)
	if global.temp_choice == 0 {
		cutscene_func(instance_destroy, [o_ui_dialogue])
		cutscene_func(enc_start, new enc_set_meatDummy())
	}
	else {
		cutscene_dialogue("It frowns understandingly.",,true)
	}
    cutscene_player_canmove(true)
    cutscene_play()
}