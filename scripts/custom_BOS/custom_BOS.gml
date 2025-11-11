// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fader_fade_white(a, b, time){
	if instance_exists(o_fader_white) 
        do_animate(a, b, time, "linear", o_fader_white, "image_alpha")
}