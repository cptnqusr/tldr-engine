function enemy_rizonbot() : enemy() constructor {
	// base info
	name = "Rizon Bot"
	
	obj = o_actor_e_rizonbot

	// stats
	hp =		70
	max_hp =	70
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
	
	
	// sprites
	s_idle = spr_e_rizonbot
	s_spare = spr_e_rizonbot
	s_hurt = spr_e_rizonbot
	
	
	// text
	dialogue =				function(slot) { return array_shuffle(["YOUR CALL IS VERY IMPORTANT TO US","ert2"])[0]} // can be a function (can accept slot argument as arg0)
	dia_bubble_offset =		[-5, 0, 0] // x, y, relative to (1 for enemy and 0 for default box pos)
	dia_bubble_sprites =	[spr_ui_enc_dialogue_box, spr_ui_enc_dialogue_spike]
	
	turn_object = o_turn_rizonbot
	
    // misc
    freezable = false
	run_away = false
	
	//recruit
	recruit = new enemy_recruit()
}
function enemy_meatdummy() : enemy() constructor {
	// base info
	name = "Meat Dummy"
	
	obj = o_actor_e_meatdummy

	// stats
	hp =		120
	max_hp =	120
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
				encounter_scene_dialogue("Meat Dummy - Yow.")
			}
		},
	]
	acts_special = {
	}
	acts_special_desc = loc("enc_ui_label_standard")
	
	
	
	// text
	dialogue =				"Yow"
	dia_bubble_offset =		[-5, 0, 0] // x, y, relative to (1 for enemy and 0 for default box pos)
	dia_bubble_sprites =	[spr_ui_enc_dialogue_box, spr_ui_enc_dialogue_spike]
	
	turn_object = o_turn_meatdummy
	
    // misc
    freezable = false
	
	//recruit
	recruit = new enemy_recruit()
}

function enemy_frog() : enemy() constructor {
	// base info
	name = "Frog"
	
	obj = o_actor_e_frog

	// stats
	hp =		180
	max_hp =	180
	attack =	6
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
				encounter_scene_dialogue("Frog - Is a frog. Has a sword. Will kick thine ass.")
			}
		},
	]
	acts_special = {
	}
	acts_special_desc = loc("enc_ui_label_standard")
	
	
	
	// text
	dialogue =				undefined
	dia_bubble_offset =		[-5, 0, 0] // x, y, relative to (1 for enemy and 0 for default box pos)
	dia_bubble_sprites =	[spr_ui_enc_dialogue_box, spr_ui_enc_dialogue_spike]
	
	turn_object = o_turn_frog
	
    // misc
    freezable = false
	
	//recruit
	recruit = new enemy_recruit()
}

