event_inherited()

_body_bullet = noone
timer_end = undefined
_soul_pos = undefined

eFrogAttackCutsceneA = function() {
	var o = enemy_struct.actor_id
	var inst = instance_create(o_enc_frog_body_bullet, o.x, o.y, DEPTH_ENCOUNTER.BULLETS_OUTSIDE)
	o.custom_depth = DEPTH_ENCOUNTER.BULLETS_OUTSIDE
	
	var originX = o.x
	var originY = o.y
	
	//show_debug_message(o)
	
	current_cutscene = cutscene_create()
	
	cutscene_animate(o.x, o.x - 200, 60,"linear",o,"x")
	cutscene_sleep(60)
	o.custom_depth = DEPTH_ENCOUNTER.ACTORS
	cutscene_animate(o.x, originX, 20, "linear",o,"x")
	cutscene_sleep(20)
	
	cutscene_play()
}