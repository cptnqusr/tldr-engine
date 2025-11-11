/// @description Insert description here
// You can write your code in this editor
image_alpha = 0
alarm[0] = 100;

fade_in_fade_out = function() {
	
	cutscene_create()
	cutscene_func(do_animate, [0, 1, 10, "linear", id, "image_alpha"])
	cutscene_sleep(240)
	cutscene_func(do_animate, [1, 0, 10, "linear", id, "image_alpha"])
	
	cutscene_play()
}

