/// @description turn starts
event_inherited()
o_enc_soul.y-=20
_ex_bullet = instance_create(o_enc_bullet_watercooler, o_enc_box.x, o_enc_box.y, DEPTH_ENCOUNTER.BULLETS_OUTSIDE)
_ex_bullet.image_xscale=0.5
_ex_bullet.image_yscale=0.5
_ex_bullet.type = type