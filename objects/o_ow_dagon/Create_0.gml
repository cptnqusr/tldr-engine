event_inherited()
link_id = 1

interaction_code = function() {
    dagonification()
}

dagonification = function() {
	cutscene_create()
    cutscene_player_canmove(false)
    
	cutscene_dialogue("DAGON TOBOGGAN",,true)
	
    cutscene_player_canmove(true)
    cutscene_play()
}