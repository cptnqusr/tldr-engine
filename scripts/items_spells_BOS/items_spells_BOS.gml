function item_s_starman() : item_spell() constructor {
	name = "PSI Starman";
	desc = ["Deals great amount of damage to all enemies using stars.", "Hits all\nEnemies"];
	use_type = ITEM_USE.ENEMY;
	tp_cost = 75
	
    use = method(self, function(spell_user, target, caller = -1) {
        if !enc_enemy_is_fighting(target)
            exit;
        var __e_obj = o_enc.encounter_data.enemies[target].actor_id;
        
        cutscene_enc_wait(true);
		cutscene_dialogue(loc_string("item_spell_cast", party_getname(spell_user), string_upper(item_get_name(self))),, false);
        cutscene_sleep(20);
        
        cutscene_set_partysprite(spell_user, "rudebuster");
        cutscene_wait_until(function(__name) {
            return party_get_inst(__name).image_index >= 6
        }, [spell_user])
        
        cutscene_func(instance_destroy, [o_ui_dialogue])
        cutscene_func(function(tgt, m, _slot, name) {
            var inst = instance_create(o_eff_rudebuster, m.x + m.sprite_width/2 - 30, m.s_get_middle_y(), tgt.depth - 50)
            inst.target_x = tgt.x
            inst.target_y = tgt.s_get_middle_y()
            
            inst.enemy_o = tgt
            inst.slot = _slot
            inst.dmg = party_getdata(name, "attack") * 11 + party_getdata(name, "magic") * 5 - o_enc.encounter_data.enemies[_slot].defense * 3
            inst.user = name
            
            inst.image_angle = point_direction(inst.x, inst.y, tgt.x, tgt.s_get_middle_y()) - 20
            inst.speed = 12
            inst.friction = -1.5/2
            inst.direction = inst.image_angle
            
            animate(0, 1, 3, "linear", inst, "image_alpha")
        }, [__e_obj, party_get_inst(spell_user), target, spell_user])
        cutscene_sleep(50)
        
        cutscene_set_partysprite(spell_user, "idle")
		cutscene_enc_wait(false)
    });
    
    item_localize("item_s_rude_buster");
}
item_register(item_s_starman);