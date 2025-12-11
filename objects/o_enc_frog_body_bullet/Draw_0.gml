if inside { // draws on the box surface
	surface_set_target(o_enc_box.bullet_surf)
	event_user(1)
	surface_reset_target()
}
else
	event_user(1)

image_alpha = 0.5
image_xscale = 1.1
image_yscale = 1.1