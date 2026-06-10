event_inherited()

if timer == 20 {
	eFrogAttackCutsceneA()
	audio_play(snd_crow)
}
if timer == timer_end {
	show_debug_message(string(am_support))
	instance_destroy()
}