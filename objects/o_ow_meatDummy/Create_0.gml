event_inherited()
npc_id = 1

interaction_code = function() {
    meatDummyFight()
}

meatDummyFight = function() {
	cutscene_create()
    cutscene_player_canmove(false)
    
	cutscene_dialogue("Yow.",,true)
	cutscene_func(enc_start, new enc_set_meatDummy())
	
    cutscene_player_canmove(true)
    cutscene_play()
}