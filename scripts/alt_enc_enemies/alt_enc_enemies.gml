function enemy_watercooler() : enemy() constructor{
	name = "Watercooler"
	obj = o_actor_e_watercooler
	turn_object = o_turn_watercooler
	
	//stats
	hp =		     1879
	max_hp =	     1879
	attack =	     8
	defense =	     0
    carrying_money = 200
    
    can_spare = true
    mercy_add_pity_percent = 25
    
    // sprites
    s_idle = spr_e_watercooler_idle
    s_hurt = spr_e_watercooler_idle
    s_spare = spr_e_watercooler_spare
	
	//acts
	acts = [
		{
			name: "Check",
			party: [],
			desc: "Useless analysis",
			exec: function() {
				encounter_scene_dialogue("* You CHECKed the watercooler...{br}{resetx}* The water was confirmed to be {col(b)}cool{reset_col}.")
			}
		},
		{
			name: "BegForMercy",
			party: [],
			desc: -1,
			exec: function() {
				encounter_scene_dialogue(
                    [
                        "* You begged for mercy...{br}{resetx}* ... but the watercooler showed none.",
                        "* You thought of some better, different ACTs to try next, instead."
                    ]
                )
			}
		},
	]
	acts_special = {
		susie: {
			exec: function(enemy_slot){
				enc_enemy_add_spare(enemy_slot, 6)
				cutscene_dialogue(
                    choose(
                        "* Susie face-crushes a cup!!",
                        "* Susie puts cups on Ralsei!",
                        "* Susie puts cups on Kris's eyes!",
                    )
                )
			},
		},
		ralsei: {
			exec: function(enemy_slot){
				enc_enemy_add_spare(enemy_slot, 6)
				cutscene_dialogue(
                    choose(
                        "* Ralsei absorbs trace calcium!",
                        "* Ralsei cleans Susie's spill!!",
                        "* Ralsei labels everyone's cups!!",
                    )
                )
			},
		},
	}
    
	//text
	dialogue = function(slot){
        return "B"+choose("a","e","i","o","u","u","oo")+"b"+choose("l","i")+"e"
	}
}