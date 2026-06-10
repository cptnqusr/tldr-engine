/// @description Insert description here
// You can write your code in this editor

if !state_get("progress", "rizonCentralParkCutscene"){
	_cutscene_RizonCentralPark()
	state_add("progress", "rizonCentralParkCutscene")
}
else {
	var music_control = inst_8AF3066_1_1
	music_control.mus = mus_gloom_york_blues
	music_control.loop_start = 11.7
	music_control.loop_end = 168.2
	music_control.alarm[0] = 1
	
	instance_destroy(rizonCentralParkInst)
}