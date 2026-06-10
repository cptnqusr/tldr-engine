function typer_char_BOS() : typer_char() constructor{
	name = "none" // the hash of the typer char
    face_sprite = noone // the face sprite
    
    face_create = function(_x, _y, _depth) {
        if !sprite_exists(face_sprite)
            return noone
        
        var inst = instance_create(o_text_face, _x, _y, _depth)
        inst.f_sprite = face_sprite
        
        return inst
    }
    
    voice = snd_text // the voice sound (can be a callable, is fed the argument of the displayed characters)
    voice_pitch_calc = 1 // the pitch of the voice (could be either a function or a real number)
    voice_interrupt = false // whether to stop the voice sound every time a new blip is played
    voice_skip = 1 // every (how many?) frames to play the sound
	voice_pitchrange = undefined
    
    /// @desc initialize the typer char - add to the typer's char presets
    __initialize = method(self, function(typer) {
        struct_set(global.typer_chars, name, self)
    })
}