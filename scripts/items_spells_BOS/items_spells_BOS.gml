function item_s_cyclone() : item_spell() constructor {
name = ["Cyclone"]
	desc = ["Hits all enemies. Speen.", "Spin attack"]
	use_type = ITEM_USE.ENEMY
	
	use = function(index, target, caller = -1) {
		var __name = global.party_names[index]
		user = index
		cutscene_set_variable(o_enc, "waiting", true)
		cutscene_func(enc_hurt_enemy, [target, 10, user])
		cutscene_dialogue(string(loc("spell_cast"), __name, "Cyclone"),, true)
		cutscene_set_variable(o_enc, "waiting", false)
	}
	
	tp_cost = 0
}