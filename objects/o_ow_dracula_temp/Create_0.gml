event_inherited()
link_id = 1

interaction_code = function() {
    draculizing()
}

draculizing = function() {
	cutscene_create()
    cutscene_player_canmove(false)
    
	cutscene_dialogue("DRACULA: Good evenink.",,true)
	
    cutscene_player_canmove(true)
    cutscene_play()
}