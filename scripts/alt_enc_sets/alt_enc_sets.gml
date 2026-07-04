function enc_set_watercooler() : enc_set() constructor {
	debug_name	=	"watercooler"
    
	enemies = [
		new enemy_watercooler(),
	]
	flavor = function() {
        if o_enc.turn_count == 0 
            return "* A strong aura emanated from the Watercooler."
        return choose(
            "* The watercooler shows no mercy.",
            "* The watercooler doesn't do anything in particular.",
            "* The watercooler leaves an icy silence.",
            "* The watercooler cools water, coolly."
        )
    }
    
    bgm = mus_battle_vapor
    bgm_pitch = 1
    bgm_gain = 1
    
    // positions
    enemies_pos = function(i, xx, yy) {
        return [
            xx - i*10,
            yy
        ]
    }
    
    target_calculation = ENC_TARGET.ANY
    enc_var_struct = {}
}