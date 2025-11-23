function enemy_rizonbot() : enemy() constructor {
	// base info
	name = "Rizon Bot"
	
	obj = {
        obj: o_actor_e_rizonbot,
        var_struct: {
            s_hurt: spr_e_rizon_bot,
            s_spared: spr_e_killercar_hurt,
        }
    }
	
	// stats
	hp =		170
	max_hp =	170
	attack =	3
	defense =	5
	status_effect = ""
	
	mercy =	0
	tired =	false
    can_spare = false
	
	// acts
	acts = [
		{
			name:	loc("enc_act_check"),
			party:	[],
			desc:	"Cool",
			exec:	function(enemy_slot, user_index){
				encounter_scene_dialogue("*Rizon Bot - Robot salesman.")
			}
		},
	]
	acts_special = {
	}
	acts_special_desc = loc("enc_ui_label_standard")
	
	
	
	// text
	dialogue =				"YOUR CALL IS VERY IMPORTANT TO US" // can be a function (can accept slot argument as arg0)
	dia_bubble_offset =		[0, 0, 0] // x, y, relative to (1 for enemy and 0 for default box pos)
	dia_bubble_sprites =	[spr_ui_enc_dialogue_box, spr_ui_enc_dialogue_spike]
	
	turn_object = o_turn_rizonbot
	
    // misc
    freezable = false
    defeat_marker = 0 // marker id
	
	//recruit
	recruit = new enemy_recruit()
}