function item_s_starman() : item_spell() constructor {
	name = "PSI Starman";
	desc = ["Deals great amount of damage to all enemies using stars.", "Hits all\nEnemies"];
	use_type = ITEM_USE.EVERYONE;
	tp_cost = 75;
	
    use = method(self, function(spell_user, target, caller = -1) {
        if !enc_enemy_is_fighting(target)
            exit;
       
        
        cutscene_enc_wait(true);
		cutscene_dialogue(loc_string("item_spell_cast", party_getname(spell_user), string_upper(item_get_name(self))),, false);
        cutscene_sleep(20);
        
        
        cutscene_func(instance_destroy, [o_ui_dialogue])
        
		
		for (var i = 0; i < array_length(o_enc.encounter_data.enemies); i ++) {
            if !enc_enemy_is_fighting(i)
                continue;
            
            var __e_obj = o_enc.encounter_data.enemies[i].actor_id;
            cutscene_func(enc_hurt_enemy, [__e_obj, 10, spell_user,noone,true])
            cutscene_sleep(1);
        }
        cutscene_sleep(50)
        
        cutscene_set_partysprite(spell_user, "idle")
		cutscene_enc_wait(false)
    });
    
    //item_localize("item_s_rude_buster");
}
item_register(item_s_starman);