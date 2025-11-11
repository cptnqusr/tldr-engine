if audio_exists(mus) 
	music_play(mus, slot, loop, gain, pitch, loop_start, loop_end)
if mus == noone
	music_stop(slot)