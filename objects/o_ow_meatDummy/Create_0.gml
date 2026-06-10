event_inherited()
link_id = 1

interaction_code = function() {
    meatDummyFight()
}

meatDummyFight = function() {
	cutscene_create()
    cutscene_player_canmove(false)
    
	cutscene_dialogue(["...?", "It's beckoning you to take out your weapon.{p}{c}{choice(`Practice`,`I'm good`)}{e}", ""],,true)
	cutscene_func(function() {
		if global.temp_choice == 0 {
			cutscene_func(instance_destroy, [o_ui_dialogue])
			cutscene_func(enc_start, new enc_set_meatDummy())
			cutscene_sleep(100)
			cutscene_wait_until(function() {
				return !instance_exists(o_enc)
			})
			cutscene_sleep(30)
			cutscene_dialogue("It looks pleased.",,true)
		}
		if global.temp_choice == 1 {
			cutscene_dialogue("It understands.",,true)
		}
	})
	
    cutscene_player_canmove(true)
    cutscene_play()
}