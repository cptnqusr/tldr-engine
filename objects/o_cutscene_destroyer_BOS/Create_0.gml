/// @description Insert description here
// You can write your code in this editor

_cutscene_destroy = function() {
	cutscene_create()
	cutscene_player_canmove(true)
	cutscene_func(function() {
		camera_unpan(get_leader(), 0)
	})
	cutscene_func(function() {if instance_exists(o_ui_dialogue){
		instance_destroy(o_ui_dialogue)
	}})
	cutscene_play()
}