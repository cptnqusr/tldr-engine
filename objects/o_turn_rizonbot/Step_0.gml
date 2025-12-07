event_inherited()

if timer > 2 {
	if timer % 30 == 0 {
	
		var o = enemy_struct.actor_id
	     
		o.gun_angle = point_direction(o.x -3, o.y - 16, o_enc_soul.x, o_enc_soul.y) + random_range(0, 10)
		var a = o.gun_angle + 180
		
		var inst = instance_create(o_enc_bullet, o.x-18 + lengthdir_x(3, a), o.y-24 + lengthdir_y(3, a), DEPTH_ENCOUNTER.BULLETS_OUTSIDE)
		inst.direction = o.gun_angle
		inst.image_angle = inst.direction-180
		inst.speed = 2
		
		audio_play(snd_crow)
	}
}
if timer == timer_end {
	show_debug_message(string(am_support))
	instance_destroy()
}
__support_destroy_check()