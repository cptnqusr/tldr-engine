/// @description Cutscene function
// You can write your code in this editor

function cutscene_bowieMono() {
	cutscene_create()
	
	cutscene_player_canmove(false)
	cutscene_party_follow(false)
	
	
	
	
	cutscene_party_follow(true)
	cutscene_party_interpolate()
	cutscene_player_canmove(true)
	cutscene_play()
}