event_inherited()

_body_bullet = noone
timer_end = undefined
_soul_pos = undefined

eFrogAttackCutsceneA = function() {
	var o = enemy_struct.actor_id
	var inst = instance_create(o_enc_frog_body_bullet, o.x, o.y, DEPTH_ENCOUNTER.BULLETS_OUTSIDE)
	o.custom_depth = DEPTH_ENCOUNTER.BULLETS_OUTSIDE
	//o.custom_depth = DEPTH_ENCOUNTER.ACTORS
	
	var originX = o.x
	var originY = o.y
	var newX = undefined
	var newY = undefined
	
	cutscene_func(show_debug_message, o.x)
	
	current_cutscene = cutscene_create()
	
	cutscene_animate(o.x, 180, 10,"linear",o,"x")
	cutscene_animate(o.y, 156, 10,"linear",o,"y")
	cutscene_sleep(30)
	cutscene_animate(156, 300, 30,"linear",o,"y")
	cutscene_sleep(60)
	cutscene_animate(180, 140, 30, "linear",o,"x")
	cutscene_animate(300, 156, 30, "linear",o,"y")
	cutscene_func(method(inst, function() {}))
	cutscene_sleep(30)
	cutscene_animate(156, 300, 30,"linear",o,"y")
	cutscene_sleep(40)
	cutscene_animate(140, originX, 30, "linear",o,"x")
	cutscene_animate(300, originY, 30, "linear",o,"y")
	cutscene_sleep(30)
	//cutscene_func(show_debug_message, o.y)
	
	cutscene_play()
}