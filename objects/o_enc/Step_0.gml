if tp_constrict
    tp_defend = 2
else 
    tp_defend = 16

if battle_state == BATTLE_STATE.MENU {
	var items = __item_sort()
	var spells = array_clone(party_getdata(global.party_names[selection], "spells"))
	for (var i = 0; i < array_length(struct_get(bonus_actions, global.party_names[selection])); ++i) { // add the actions aside from s-action or alike
	    array_insert(spells, i, struct_get(bonus_actions, global.party_names[selection])[i])
	}
	
	var updateglowing_enemy = function(selec = fightselection[selection]) {
		for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
			if !enc_enemy_isfighting(i)
				continue
			if selec == i
				encounter_data.enemies[i].actor_id.flashing = true
			else
				encounter_data.enemies[i].actor_id.flashing = false
		}
	}
	var updateglowing_party = function() {
		for (var i = 0; i < array_length(global.party_names); ++i) {
			if itemuserselection[selection] == i
				party_get_inst(global.party_names[i]).flashing = true
			else
				party_get_inst(global.party_names[i]).flashing = false
		}
	}
	var __defend_tp = 16
    if tp_constrict
        __defend_tp = 2
    
	if state == 0 { // button selector
		if InputPressed(INPUT_VERB.LEFT) {
			bt_selection[selection]--
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.RIGHT) {
			bt_selection[selection]++
			audio_play(snd_ui_move)
		}
		
		// cap the selection
		if bt_selection[selection] < 0 bt_selection[selection]=4
		if bt_selection[selection] > 4 bt_selection[selection]=0
		
		// press the buttons
		if InputPressed(INPUT_VERB.SELECT) && buffer == 0 {
			if bt_selection[selection] == 4 {
				// set the party sprite to defend
				enc_party_set_battle_sprite(global.party_names[selection], "defend", 0, 1)
				
				char_state[selection] = CHAR_STATE.DEFEND
				selection ++
				
				state = 0
				tp += __defend_tp
				
				audio_play(snd_ui_select)
			}
			else if bt_selection[selection] == 2 {
				if array_length(items) > 0 {
					state ++
					buffer = 1
					dialogue_autoskip = true
					
					instance_clean(menutext)
					audio_play(snd_ui_select)
				}
				else 
					audio_play(snd_ui_cant_select)
			}
			else {
				state ++
				buffer = 1
				dialogue_autoskip = true
				if (bt_selection[selection] == 0 
					|| bt_selection[selection] == 3 
					|| (bt_selection[selection] == 1 && can_act[selection])) 
				{
					updateglowing_enemy()
				}
				
				instance_clean(menutext)
				audio_play(snd_ui_select)
			}
		}
		
		// set up skipping characters that should be busy (ignored)
		var iignore = []
		if !array_equals(ignore, []) 
			array_copy(iignore, 0, ignore, 0, array_length(ignore))
		if !array_equals(ignore, []) 
			array_sort(iignore, true)
		if array_equals(ignore,[]) 
			iignore[0] = 0
		
		if InputPressed(INPUT_VERB.CANCEL) && buffer == 0 && selection > 0 {
			selection --
			buffer = 1
			
			while array_contains(ignore, selection) {
				if char_state[selection] != CHAR_STATE.IDLE {
					char_state[selection] = CHAR_STATE.IDLE
					
					// set the sprite back to the idle sprite
					enc_party_set_battle_sprite(global.party_names[selection], "idle", 0, 1)
				}
				array_delete(ignore, array_get_index(ignore, selection), 1)
				selection --
			}
            
			while !party_isup(global.party_names[selection]) && selection > 0 {
				if char_state[selection] != CHAR_STATE.IDLE {
					char_state[selection] = CHAR_STATE.IDLE;
					
					// set the sprite back to the idle sprite
					enc_party_set_battle_sprite(global.party_names[selection], "idle", 0, 1)
				}
				selection --
			}
			
			// if i was together with somebody performing an action, free them as well
			if is_array(together_with[selection]) {
				if !array_equals(together_with[selection], []) {
					for (var i = 0; i < array_length(together_with[selection]); ++i) {
					    char_state[i] = CHAR_STATE.IDLE;
						
						// set the sprite back to the idle one
						enc_party_set_battle_sprite(global.party_names[selection], "idle", 0, 1)
						array_delete(ignore, array_get_index(ignore, together_with[i]), 1)
					}
					together_with[selection] = []
				}
			}
			else {
				var i = together_with[selection]
				char_state[i] = CHAR_STATE.IDLE;
				
				enc_party_set_battle_sprite(global.party_names[selection], "idle", 0, 1)
				array_delete(ignore, array_get_index(ignore, together_with), 1)
				together_with[selection] = []
			}
			
			// if i was selecting an item, make sure it isn't used anymore
			if char_state[selection] == CHAR_STATE.ITEM
				array_pop(items_using)
			// if i was using magic, return the tp i spent
			if char_state[selection] == CHAR_STATE.POWER && !can_act[selection] && tp_upon_spell[selection] != -1 {
				tp = tp_upon_spell[selection]
				array_set(tp_upon_spell, selection, -1)
			}
			// if i was acting and used tp, return the tp i spent
			if char_state[selection] == CHAR_STATE.ACT && can_act[selection] && tp_upon_spell[selection] != -1 {
				tp = tp_upon_spell[selection]
				array_set(tp_upon_spell, selection, -1)
			}
			
			// return the tp if i was defending
			if char_state[selection] == CHAR_STATE.DEFEND
				tp -= __defend_tp
			
			// get back to being idle
			char_state[selection] = CHAR_STATE.IDLE
			enc_party_set_battle_sprite(global.party_names[selection], "idle", 0, 1)
		}
	}
	else if state == 1 // enemy selector
        && (bt_selection[selection] == 0
			|| bt_selection[selection] == 3 
			|| (bt_selection[selection] == 1 && can_act[selection])
		) 
        || (bt_selection[selection] == 2 && state == 3) 
		|| (!can_act[selection] 
			&& bt_selection[selection] == 1 
			&& spells[actselection[selection]].use_type == 2 
			&& state == 3
        )
    {
		var eselectordelta = 1
        var __changed = false
		
		if InputPressed(INPUT_VERB.UP) {
			fightselection[selection] --
			audio_play(snd_ui_move)
			eselectordelta = -1
            __changed = true
		}
		if InputPressed(INPUT_VERB.DOWN) {
			fightselection[selection] ++
			audio_play(snd_ui_move)
			eselectordelta = 1
            __changed = true
		}
		
		// cap this
		if fightselection[selection] > array_length(encounter_data.enemies) - 1
			fightselection[selection] = 0
		if fightselection[selection] < 0 
			fightselection[selection] = array_length(encounter_data.enemies) - 1
		
		// skip to the next enemy if needed
		while !enc_enemy_isfighting(fightselection[selection]){
			fightselection[selection] += eselectordelta
			
			if fightselection[selection] > array_length(encounter_data.enemies) - 1
				fightselection[selection] = 0
			if fightselection[selection] < 0
				fightselection[selection] = array_length(encounter_data.enemies) - 1
		}
		
		if InputPressed(INPUT_VERB.CANCEL) && buffer == 0 {
			state --
			buffer = 1
			
			for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
				if !enc_enemy_isfighting(i)
					continue
			    encounter_data.enemies[i].actor_id.flashing = false
			}
			
			if bt_selection[selection] == 2
				state = 1
			if bt_selection[selection] == 1 && !can_act[selection]
				state = 1
		}
		
		// if we moved, update the enemies flashing
		if __changed {
			for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
				if !enc_enemy_isfighting(i)
					continue
				
			    if fightselection[selection] == i
					encounter_data.enemies[i].actor_id.flashing = true
				else
					encounter_data.enemies[i].actor_id.flashing = false
			}
		}
		
		if InputPressed(INPUT_VERB.SELECT) && buffer == 0 {
			if bt_selection[selection] == 0 { // attack, enemy selected
				char_state[selection] = CHAR_STATE.FIGHT
				state = 0 // continue
				
				for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
					if !enc_enemy_isfighting(i)
						continue
					encounter_data.enemies[i].actor_id.flashing = false
				}
				
				// set the sprite accoredingly
				enc_party_set_battle_sprite(global.party_names[selection], "attackready", 0, 1)
				selection ++
				
				audio_play(snd_ui_select)
			}
			else if bt_selection[selection] == 1 && can_act[selection] { // act, enemy selected. act selection incoming
				state ++ // advance to the next depth of the act menu
				buffer = 1
				
				audio_play(snd_ui_select)
			}
			else if bt_selection[selection] == 1 && !can_act[selection] { // power, spell selected
				enc_party_set_battle_sprite(global.party_names[selection], "spellready", 0, 1)
				
				// save the tp amount we used
				array_set(tp_upon_spell, selection, tp)
				tp = tp_clamp(tp)
				tp -= spells[actselection[selection]].tp_cost
				
				char_state[selection] = CHAR_STATE.POWER
				selection ++
				state = 0
				audio_play(snd_ui_select)
				
				// make the enemies stop flashing
				for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
					if !enc_enemy_isfighting(i)
						continue
					encounter_data.enemies[i].actor_id.flashing = false
				}
			}	
			else if bt_selection[selection] == 3 { // spare, enemy selected
				char_state[selection] = CHAR_STATE.SPARE
				selection ++
				state = 0
				
				audio_play(snd_ui_select)
				
				// make the enemies stop flashing
				for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
					if !enc_enemy_isfighting(i)
						continue
					
					encounter_data.enemies[i].actor_id.flashing = false
				}
			}
			else if bt_selection[selection] == 2 { // items, item selected
				enc_party_set_battle_sprite(global.party_names[selection], "itemready", 0, 1)
				char_state[selection] = CHAR_STATE.ITEM
				
				array_push(items_using, item_get_name(items[itemselection[selection]]))
				
				selection ++
				state = 0
				buffer = 1
				audio_play(snd_ui_select)
				
				// make the highlighted stop flashing
				for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
					if !enc_enemy_isfighting(i)
						continue
					encounter_data.enemies[i].actor_id.flashing = false
				}
			}
		}
	}
	else if !can_act[selection] // power menu
		&& bt_selection[selection] == 1 
		&& spells[actselection[selection]].use_type == 2 
		&& state == 4
	{
		var eselectordelta = 1
        var changed = false
		
		if InputPressed(INPUT_VERB.UP) {
			partyactselection[selection] --; 
			audio_play(snd_ui_move);
			eselectordelta = -1
            changed = true
		}
		if InputPressed(INPUT_VERB.DOWN) {
			partyactselection[selection] ++; 
			audio_play(snd_ui_move);
			eselectordelta = 1
            changed = true
		}
		
		// cap
		if partyactselection[selection] > array_length(encounter_data.enemies) - 1
			partyactselection[selection] = 0
		if partyactselection[selection] < 0
			partyactselection[selection] = array_length(encounter_data.enemies) - 1
		
		// skip the enemies that aren't fighting anymore
		while !enc_enemy_isfighting(partyactselection[selection]) {
			partyactselection[selection] += eselectordelta
			
			if partyactselection[selection] > array_length(encounter_data.enemies) - 1
				partyactselection[selection] = 0
			if partyactselection[selection] < 0
				partyactselection[selection] = array_length(encounter_data.enemies) - 1
		}
		
		if InputPressed(INPUT_VERB.CANCEL) && buffer == 0 {
			state --
			buffer = 1
			for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
				if !enc_enemy_isfighting(i)
					continue
				
			    encounter_data.enemies[i].actor_id.flashing = false
			}
			
			if bt_selection[selection] == 1 && !can_act[selection] 
				state = 1
		}
		
		if changed {
			for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
				if !enc_enemy_isfighting(i)
					continue
					
			    if partyactselection[selection] == i
					encounter_data.enemies[i].actor_id.flashing = true
				else
					encounter_data.enemies[i].actor_id.flashing = false
			}
		}
		
		if InputPressed(INPUT_VERB.SELECT) && buffer == 0 {
            enc_party_set_battle_sprite(global.party_names[selection], "actready", 0, 1)
			
			char_state[selection] = CHAR_STATE.ACT
			selection ++
			state = 0
			buffer = 1
			
			audio_play(snd_ui_select)
			
			for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
				if !enc_enemy_isfighting(i)
					continue
				
				encounter_data.enemies[i].actor_id.flashing = false
			}
		}
	}
	
	if state == 2 && bt_selection[selection] == 1 && can_act[selection] { // act selector
		var acts = __act_sort()
		
		if InputPressed(INPUT_VERB.CANCEL) && buffer == 0 {
			state--
			buffer = 1
			
			updateglowing_enemy()
		}
		
		// movement
		if InputPressed(INPUT_VERB.RIGHT) && actselection[selection] < array_length(acts) - 1 {
			actselection[selection] ++
			if actselection[selection] % 2 == 0
				actselection[selection] -= 2 
			
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.DOWN) && actselection[selection] < array_length(acts) - 2 {
			actselection[selection] += 2;
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.LEFT) && actselection[selection] > 0 {
			actselection[selection] -- 
			if actselection[selection] % 2 == 1
				actselection[selection] += 2
			audio_play(snd_ui_move)
		}
		else if InputPressed(INPUT_VERB.LEFT) && actselection[selection] == 0 && array_length(acts) > 1 {
			actselection[selection] = 1; 
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.UP) && actselection[selection] > 1 {
			actselection[selection] -= 2; 
			audio_play(snd_ui_move)
		}
		
		// cap
		if actselection[selection] < 0
			actselection[selection] = array_length(acts) - 1
		if actselection[selection] > array_length(acts) - 1
			actselection[selection] = 0
		
		if InputPressed(INPUT_VERB.SELECT) && buffer == 0 {
			var cando = true
			
			var ii = actselection[selection]
			if array_length(acts[ii].party) > 0 || acts[ii].party == -1 {
				var add = array_length(acts[ii].party)
				
				if acts[ii].party == -1 {
					together_with[selection] = []
					
					if struct_exists(acts[ii], "tp_cost") && tp < acts[ii].tp_cost 
						cando = false
                    for (var j = 0; j < array_length(global.party_names); ++j) {
                        if !party_isup(global.party_names[j]) 
                            cando = false
                    }
					if cando {
						char_state[selection] = CHAR_STATE.ACT
						
						for (var j = 0; j < array_length(global.party_names); ++j) {
                            if j == selection // if the one being cycled through is calling the act, don't include them
                                continue
                            
							var me = j
							array_push(ignore, me)
							
                            enc_party_set_battle_sprite(global.party_names[me], "actready", 0, 1)
							char_state[me] = CHAR_STATE.ACT
							
							array_push(together_with[selection], me)
						}
					}
				}
				else { 
                    together_with[selection] = []
                    
                    if struct_exists(acts[ii], "tp_cost") && tp < acts[ii].tp_cost 
						cando = false
					for (var j = 0; j < add; ++j) {
						if !party_isup(acts[ii].party[j]) 
							cando = false
					}
					if cando {
						char_state[selection] = CHAR_STATE.ACT
						
						for (var j = 0; j < add; ++j) {
							var me = array_get_index(global.party_names, acts[ii].party[j])
                            if me == selection // if the one being cycled through is calling the act, don't include them
                                continue
                            
						    array_push(ignore, me)
                            
                            enc_party_set_battle_sprite(global.party_names[me], "actready", 0, 1)
							char_state[me] = CHAR_STATE.ACT
							
							array_push(together_with[selection], me)
						}
					}
				}
			}
			
			if struct_exists(acts[ii], "tp_cost") && tp < acts[ii].tp_cost 
				cando = false
			if cando {
				char_state[selection] = CHAR_STATE.ACT
				
				for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
					if !enc_enemy_isfighting(i)
						continue
					
					encounter_data.enemies[i].actor_id.flashing = false
				}
				
				if struct_exists(acts[ii], "tp_cost") && acts[ii].tp_cost > 0 {
					array_set(tp_upon_spell, selection, tp)
					tp = tp_clamp(tp)
					tp -= acts[ii].tp_cost
				}
				else {
					array_set(tp_upon_spell, selection, tp)
				}
				
				enc_party_set_battle_sprite(global.party_names[selection], "actready", 0, 1)
				
				selection ++
				state = 0
				buffer = 1
				
				audio_play(snd_ui_select)
			}
		}
	}
	if state == 1 && bt_selection[selection] == 2 { // item selector
		if InputPressed(INPUT_VERB.CANCEL) && buffer == 0 {
			state --
			buffer=1
		}
		
		if InputPressed(INPUT_VERB.RIGHT) && itemselection[selection] < array_length(items) - 1 {
			itemselection[selection] ++; 
			if itemselection[selection] % 2 == 0
				itemselection[selection]-=2
			
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.DOWN) && itemselection[selection] < array_length(items) - 2 {
			itemselection[selection] += 2; 
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.LEFT) && itemselection[selection] > 0 {
			itemselection[selection] --; 
			if itemselection[selection] % 2 == 1
				itemselection[selection] += 2
			
			audio_play(snd_ui_move)
		}
		else if InputPressed(INPUT_VERB.LEFT) && itemselection[selection] == 0 && array_length(items) > 1 {
			itemselection[selection] = 1; 
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.UP) && itemselection[selection] > 1 {
			itemselection[selection] -= 2; 
			audio_play(snd_ui_move)
		}
		
		// cap
		if itemselection[selection] < 0
			itemselection[selection] = array_length(items) - 1
		if itemselection[selection] > array_length(items)-1
			itemselection[selection] = 0
		if itemselection[selection] > 5
			itempage[selection] = 1
		else
			itempage[selection] = 0
		
		if InputPressed(INPUT_VERB.SELECT) && buffer == 0 {
			if items[itemselection[selection]].use_type == ITEM_USE.INDIVIDUAL {
				state = 2
				buffer = 1
				
				audio_play(snd_ui_select)
				
				updateglowing_party()
			}
			else if items[itemselection[selection]].use_type == ITEM_USE.EVERYONE {
				enc_party_set_battle_sprite(global.party_names[selection], "itemready", 0, 1)
				char_state[selection] = CHAR_STATE.ITEM
				
				array_push(items_using, item_get_name(items[itemselection[selection]]))
				
				selection ++
				state = 0
				buffer = 1
				
				audio_play(snd_ui_select)
			}
			else if items[itemselection[selection]].use_type == ITEM_USE.ENEMY {
				state = 3
				buffer = 1
				
				audio_play(snd_ui_select)
				
				updateglowing_enemy()
			}
		}
	}
	if state == 1 && bt_selection[selection] == 1 && !can_act[selection] { // spell selector
		if InputPressed(INPUT_VERB.CANCEL) && buffer == 0 {
			state --; 
			buffer = 1
		}
		
		var cando = true
		
		// movement
		if InputPressed(INPUT_VERB.RIGHT) && actselection[selection] < array_length(spells) - 1 {
			actselection[selection]++; 
			if actselection[selection] % 2 == 0 {
				actselection[selection] -= 2
			} 
			
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.DOWN) && actselection[selection] < array_length(spells) - 2 {
			actselection[selection] += 2; 
			
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.LEFT) && actselection[selection] > 0 {
			actselection[selection] --; 
			if actselection[selection] % 2 == 1 {
				actselection[selection] += 2
			} 
			
			audio_play(snd_ui_move)
		}
		else if InputPressed(INPUT_VERB.LEFT) && actselection[selection] == 0 && array_length(spells) > 1 {
			actselection[selection] = 1; 
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.UP) && actselection[selection] > 1 {
			actselection[selection] -= 2 
			audio_play(snd_ui_move)
		}
		
		// cap
		if actselection[selection] < 0
			actselection[selection] = array_length(spells) - 1
		if actselection[selection] > array_length(spells) - 1
			actselection[selection] = 0
		if actselection[selection] > 5 
			spellpage[selection] = 1
		else
			spellpage[selection] = 0 
		
		if InputPressed(INPUT_VERB.SELECT) && buffer == 0 && tp >= spells[actselection[selection]].tp_cost { // check who the spell targets
			
			if spells[actselection[selection]].use_type == ITEM_USE.INDIVIDUAL {
				state = 2
				buffer = 1
				
				audio_play(snd_ui_select)
				
				updateglowing_party()
			}
			else if spells[actselection[selection]].use_type == ITEM_USE.EVERYONE {
				enc_party_set_battle_sprite(global.party_names[selection], "spellready", 0, 1)
				
                char_state[selection] = CHAR_STATE.POWER
				
				array_set(tp_upon_spell, selection, tp)
				tp = tp_clamp(tp)
				tp -= spells[actselection[selection]].tp_cost
				
				selection ++
				state = 0
				buffer = 1
				
				audio_play(snd_ui_select)
			}
			else if spells[actselection[selection]].use_type == ITEM_USE.ENEMY {
				
				if spells[actselection[selection]].is_party_act {
					state = 4
				}
				else {
					state = 3
				}
				buffer = 1
				
				audio_play(snd_ui_select)
				updateglowing_enemy(partyactselection[selection])
			}
			
			
		}
	}
	if state == 2 && (bt_selection[selection] == 2 || (!can_act[selection] && bt_selection[selection] == 1 && spells[actselection[selection]].use_type == ITEM_USE.INDIVIDUAL)) { // item/spell target chooser
		var delta = false
		
		if InputPressed(INPUT_VERB.UP){
			itemuserselection[selection] -- 
			audio_play(snd_ui_move)
			delta = 1
		}
		if InputPressed(INPUT_VERB.DOWN){
			itemuserselection[selection] ++;
			audio_play(snd_ui_move)
			delta = 1
		}
		
		if itemuserselection[selection] < 0
			itemuserselection[selection] = array_length(global.party_names) - 1
		if itemuserselection[selection] > array_length(global.party_names) - 1
			itemuserselection[selection] = 0
		
		if delta 
			updateglowing_party()
		
		if InputPressed(INPUT_VERB.CANCEL) && buffer == 0 {
			state -- 
			buffer = 1
			for (var i = 0; i < array_length(global.party_names); ++i) {
				party_get_inst(global.party_names[i]).flashing = false
			}
		}
		if InputPressed(INPUT_VERB.SELECT) && buffer == 0 {
			if bt_selection[selection] == 1 && spells[actselection[selection]].use_type == ITEM_USE.INDIVIDUAL {
				enc_party_set_battle_sprite(global.party_names[selection], "spellready", 0, 1)
				char_state[selection] = CHAR_STATE.POWER
				
				array_set(tp_upon_spell, selection, tp)
				tp = tp_clamp(tp)
				tp -= spells[actselection[selection]].tp_cost
				
				selection ++
				state = 0
				buffer = 1
				
				audio_play(snd_ui_select)
				for (var i = 0; i < array_length(global.party_names); ++i) {
					party_get_inst(global.party_names[i]).flashing = false
				}
			}
			else {
				enc_party_set_battle_sprite(global.party_names[selection], "itemready", 0, 1)
				char_state[selection] = CHAR_STATE.ITEM
				
				array_push(items_using, item_get_name(items[itemselection[selection]]))
				
				selection ++
				state = 0
				buffer = 1
				
				audio_play(snd_ui_select)
				for (var i = 0; i < array_length(global.party_names); ++i) {
					party_get_inst(global.party_names[i]).flashing = false
				}
			}
		}
	}
	
	// skip over the busy members
	if !array_equals(ignore, []) {
		while array_contains(ignore,selection) 
			selection++
	}
	
	if selection <= array_length(global.party_names) - 1 {
		while !party_isup(global.party_names[selection]) {
			selection ++
			
			if selection > array_length(global.party_names) - 1 
				break
		}
	}
	for (var i = 0; i < 3; ++i) {
	    uisticks[i] += .25
		if uisticks[i] > 0 uisticks[i] *= 1.03
		if uisticks[i] > 20 uisticks[i] = 0
	}

	if state == 0 { // create text if not exists
		if !instance_exists(menutext) {
			var pre = "{yspace(14)}"
			
			if dialogue_autoskip 
                pre += "{instant}"
            
			menutext = text_typer_create(flavor, 30, 376, DEPTH_ENCOUNTER.UI, pre,, {
				gui: true, 
				caller: id,
				destroy_caller: true,
                can_superskip: false
			})
		}
	}
	if selection > array_length(global.party_names) - 1 {
		tp = tp_clamp(tp)
		__battle_state_advance()
    if battle_menu == BATTLE_MENU.BUTTON_SELECTION {
        if InputPressed(INPUT_VERB.RIGHT) {
            audio_play(snd_ui_move)
            party_button_selection[party_selection] ++
        }
        else if InputPressed(INPUT_VERB.LEFT) {
            audio_play(snd_ui_move)
            party_button_selection[party_selection] --
        }
        
        // cap navigation
        party_button_selection[party_selection] = cap_wraparound(party_button_selection[party_selection], array_length(party_buttons[party_selection]))
        
        if InputPressed(INPUT_VERB.SELECT) && buffer == 0 {
            party_buttons[party_selection][party_button_selection[party_selection]].press()
            
            if party_selection >= array_length(global.party_names) || party_selection < 0 {
                __battle_state_advance()
                exit
            }
        }
        if InputPressed(INPUT_VERB.CANCEL) && buffer == 0 && party_selection > 0 {
            var __selection = party_selection
            
            party_selection --
            while !(party_isup(global.party_names[party_selection]) 
                && !array_contains(party_busy, global.party_names[party_selection]) 
                && !array_contains(party_busy_internal, global.party_names[party_selection])
            ) {
                party_selection --
                if party_selection < 0 {
                    party_selection = __selection
                    break
                }
            }
            
            if array_length(action_queue) > 0 {
                array_pop(action_queue).cancel() // cancel the last action
            }
        }
        
        if !instance_exists(inst_flavor) {
            inst_flavor = dialogue_start((flavor_seen ? "{instant}" : "") + enc_get_flavor(encounter_data) + "{stop}")
            inst_flavor.die_delay = 0
            flavor_seen = true
        }
    }
    else if battle_menu == BATTLE_MENU.ENEMY_SELECTION {
        var __delta_selection = 1 // set to 1 instead of 0 so the enemies are cycled when the menu is open
        var __moved = false
        var __button = party_buttons[party_selection][party_button_selection[party_selection]]
		
		if InputPressed(INPUT_VERB.UP) {
			audio_play(snd_ui_move)
			party_enemy_selection[party_selection] --
            
			__delta_selection = -1
            __moved = true
		}
		else if InputPressed(INPUT_VERB.DOWN) {
			audio_play(snd_ui_move)
			party_enemy_selection[party_selection] ++
            
			__delta_selection = 1
            __moved = true
		}
		
		// cap navigation
        party_enemy_selection[party_selection] = cap_wraparound(party_enemy_selection[party_selection], array_length(encounter_data.enemies))
		
		// skip to the next enemy if needed
		while !enc_enemy_isfighting(party_enemy_selection[party_selection]){
			party_enemy_selection[party_selection] += __delta_selection
			party_enemy_selection[party_selection] = cap_wraparound(party_enemy_selection[party_selection], array_length(encounter_data.enemies))
		}
		
        if InputPressed(INPUT_VERB.SELECT) && buffer == 0 { 
            battle_menu_enemy_proceed()
            buffer = 1
        }
		if InputPressed(INPUT_VERB.CANCEL) && buffer == 0 {
			battle_menu_enemy_cancel()
			buffer = 1
		}
		
		// if we changed selection, update the enemies flashing
		if __moved
			__enemy_highlight(party_enemy_selection[party_selection])
    }
    else if battle_menu == BATTLE_MENU.INV_SELECTION {
        var __button = party_buttons[party_selection][party_button_selection[party_selection]]
        
        var list = battle_menu_inv_list
        var selection_var_name = battle_menu_inv_var_name
        var selection_operate = battle_menu_inv_var_operate
        
        var selected_item_index = variable_instance_get(self, selection_var_name)[party_selection]
        selected_item_index = clamp(selected_item_index, 0, array_length(list)-1)
        
        // four direction ui movement
        if InputPressed(INPUT_VERB.RIGHT) && selected_item_index < array_length(list) - 1 {
            selected_item_index ++
			if selected_item_index % 2 == 0
				selected_item_index -= 2
			
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.DOWN) && selected_item_index < array_length(list) - 2 {
			selected_item_index += 2
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.LEFT) && selected_item_index > 0 {
			selected_item_index -= 1
			if selected_item_index % 2 == 1
				selected_item_index += 2
			audio_play(snd_ui_move)
		}
		else if InputPressed(INPUT_VERB.LEFT) && selected_item_index == 0 && array_length(list) > 1 {
			selected_item_index -= 1
			audio_play(snd_ui_move)
		}
		if InputPressed(INPUT_VERB.UP) && selected_item_index > 1 {
			selected_item_index -= 2
			audio_play(snd_ui_move)
		}
        if selected_item_index > 5
			array_set(variable_instance_get(self, battle_menu_inv_page_var_name), party_selection, 1)
		else
			array_set(variable_instance_get(self, battle_menu_inv_page_var_name), party_selection, 0)
        
        selection_operate(cap_wraparound(selected_item_index, array_length(list)), true)
        
        if InputPressed(INPUT_VERB.SELECT) && buffer == 0 {
            battle_menu_inv_proceed(list[selected_item_index])
            buffer = 1
        }
        if InputPressed(INPUT_VERB.CANCEL) && buffer == 0 {
            battle_menu_inv_cancel()
            buffer = 1
        }
    }
    else if battle_menu == BATTLE_MENU.PARTY_SELECTION {
        var __moved = true
		if InputPressed(INPUT_VERB.UP) {
			audio_play(snd_ui_move)
			party_ally_selection[party_selection] --
		}
		else if InputPressed(INPUT_VERB.DOWN) {
			audio_play(snd_ui_move)
			party_ally_selection[party_selection] ++
		}
        else
            __moved = false
		
		// cap navigation
        party_ally_selection[party_selection] = cap_wraparound(party_ally_selection[party_selection], array_length(global.party_names))
		
        if InputPressed(INPUT_VERB.SELECT) && buffer == 0 { 
            battle_menu_party_proceed()
            buffer = 1
        }
		if InputPressed(INPUT_VERB.CANCEL) && buffer == 0 {
			battle_menu_party_cancel()
			buffer = 1
		}
		
		// if we changed selection, update the enemies flashing
		if __moved
			__ally_highlight(party_ally_selection[party_selection])
    }
    
    // skip if the party member is busy at the moment
    while (party_selection < array_length(global.party_names) && party_selection >= 0)
        && !(party_isup(global.party_names[party_selection]) 
            && !array_contains(party_busy, global.party_names[party_selection]) 
            && !array_contains(party_busy_internal, global.party_names[party_selection])
        )
    {
        party_selection ++
    }
    if party_selection >= array_length(global.party_names) || party_selection < 0 {
        __battle_state_advance()
        exit
    }
    
    // the sticks in the ui
    for (var i = 0; i < 3; ++i) {
	    ui_party_sticks[i] += .25
		if ui_party_sticks[i] > 0 
            ui_party_sticks[i] *= 1.03
		if ui_party_sticks[i] > 20 
            ui_party_sticks[i] = 0
	}
}}

else if battle_state == BATTLE_STATE.EXEC {
    if !exec_init {
        action_queue = __order_action_queue()
        exec_init = true
    }
    if !__check_waiting() {
        if buffer == 0 {
            if array_length(action_queue) > 0 {
                var action = action_queue[0]
                array_delete(action_queue, 0, 1) // dequeue the action
                
                action.perform(action_queue)
            }
            else 
                __battle_state_advance()
        }
    }
    else 
        buffer = 2
}
else if battle_state == BATTLE_STATE.DIALOGUE {
    if !pre_dialogue_init {
        __call_enc_event("ev_pre_dialogue")
        pre_dialogue_init = true
        buffer = 2
    }
    if !__check_waiting() && buffer == 0 {
        if !dialogue_init {
            animate(0, .75, 15, "linear", o_eff_bg, "fade")
            turn_objects = array_create(array_length(encounter_data.enemies), noone)
    		for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
    			if !enc_enemy_isfighting(i)
    				continue
    			
    			// create turn objects feed the information to them
    			array_set(turn_objects, i, instance_create(encounter_data.enemies[i].turn_object,,,, {
    				enemy_index: i, 
    				enemy_struct: encounter_data.enemies[i]
    			}))
    			
    			var text = encounter_data.enemies[i].dialogue
    			if is_callable(text)
    				text = text(i)
    			
    			if is_string(text) || is_array(text) {
                    var inst = actor_dialogue_create(text, encounter_data.enemies[i].actor_id,,, {
                        spr: encounter_data.enemies[i].dia_bubble_sprites
                    }, encounter_data.enemies[i].dia_bubble_off_x, encounter_data.enemies[i].dia_bubble_off_y, encounter_data.enemies[i].dia_bubble_off_type) 
    			    array_push(inst_dialogues, inst)
    			}
    		}
            
            __call_enc_event("ev_dialogue")
            
            // choose turn targets
            turn_targets = encounter_data._target_calculation()
    		for (var i = 0; i < array_length(global.party_names); ++i) {
    		    if array_contains(turn_targets, global.party_names[i]) {
                    if encounter_data.display_target {
    				    var o = party_get_inst(global.party_names[i])
                        instance_create(o_enc_target, o.x, o.s_get_middle_y(), o.depth-10)
                    }
    			}
    			else {
    				var o = party_get_inst(global.party_names[i])
    				animate(o.darken, .5, 15, "linear", o, "darken")
    			}
    		}
    		
    		dialogue_init = true
        }
        
        var move_on = true
    	for (var i = 0; i < array_length(inst_dialogues); ++i) {
    	    if instance_exists(inst_dialogues[i]) {
    			move_on = false
    			break
    		}
    	}
        
    	if move_on {
            with o_enc_target
                instance_destroy()
    		__battle_state_advance()
        }
    }
}
else if battle_state == BATTLE_STATE.TURN {
    if !pre_turn_init {
        __call_enc_event("ev_turn")
        buffer = 2
        
        pre_turn_init = true
    }
    else if buffer == 0 && !__check_waiting() {
        if !turn_init {
    		mybox = instance_create(o_enc_box)
    		mysoul = instance_create(o_enc_soul, 
    			get_leader().x, get_leader().s_get_middle_y(), 
    			DEPTH_ENCOUNTER.SOUL
    		)
            
            for (var i = 0; i < array_length(turn_objects); ++i) {
                if instance_exists(turn_objects[i]) {
                    // call the box created event for turn objects
                    with turn_objects[i] {
                        event_user(2)
                    }
                }
            }
            
            if tp_constrict
                o_enc_soul.inst_aura = instance_create(o_enc_soul_aura, 
                    o_enc_soul.x, o_enc_soul.y, 
                    DEPTH_ENCOUNTER.SOUL
                )
    		
    		turn_init = true
    		turn_timer = 0
    	}
    	else if !instance_exists(mybox) {
            __battle_state_advance()
    	}
    	else if !mybox.is_transitioning {
		if turn_timer == 0 {
			for (var i = 0; i < array_length(turn_objects); ++i) {
				if instance_exists(turn_objects[i]) {
					// call the turn start event for the turn objects
					with turn_objects[i] {
						event_user(1)
					}
				}
			}
            __call_enc_event("ev_turn_start")
		}
		turn_timer ++
		
		var move_on = true
		for (var i = 0; i < array_length(turn_objects); ++i) {
			if !enc_enemy_isfighting(i) continue
			if instance_exists(turn_objects[i]) move_on = false
		}
		if move_on {
			mybox.__close()
			mysoul.alarm[0] = 1
            
            animate(o_eff_bg.fade, 0, 20, anime_curve.linear, o_eff_bg, "fade")
		}
	}
    }
}
else if battle_state == BATTLE_STATE.POST_TURN {
    if !post_turn_init {
        __call_enc_event("ev_post_turn")
        post_turn_init = true
        buffer = 2
    }
    if !__check_waiting() && buffer == 0 {
        for (var i = 0; i < array_length(global.party_names); ++i) { // heal party members and un-dim them
            // if defending, or anything else for that matter, just go back to being idle
            enc_party_set_battle_sprite(global.party_names[i], "idle")
            
            party_state[i] = PARTY_STATE.IDLE
            
            if !array_contains(turn_targets, global.party_names[i]) // if i wasn't target, stop being dimmed
                animate(party_get_inst(global.party_names[i]).darken, 0, 15, anime_curve.linear, party_get_inst(global.party_names[i]), "darken")
       	    if !party_isup(global.party_names[i])
                party_heal(global.party_names[i], round(party_getdata(global.party_names[i], "max_hp") * .13))
        }
        
        var flav = encounter_data.flavor
        if is_callable(flav)
            flavor = flav()
        else 
            flavor = flav
       	
        event_user(1)
        __battle_state_advance()
    }
}
else if battle_state == BATTLE_STATE.WIN {
    if !win_screen_init {
        __call_enc_event("win")
        win_screen_init = true
        buffer = 2
    }
    if !win_init && !__check_waiting() && buffer == 0 {
        var __exp = 0
        var __dd = earned_money + global.chapter * tp / 4
        var __dd_mod = 1
        
		for (var i = 0; i < array_length(global.party_names); ++i) {
		    party_state[i] = PARTY_STATE.IDLE
			
			if party_getdata(global.party_names[i], "is_down") {
				party_setdata(global.party_names[i], "hp", round(party_getdata(global.party_names[i], "max_hp") * .12))
                party_setdata(global.party_names[i], "is_down", false)
            }
            
			enc_party_set_battle_sprite(global.party_names[i], "victory", 0, 1)
            
            if !is_undefined(party_getdata(global.party_names[i], "weapon")) && struct_exists(party_getdata(global.party_names[i], "weapon").stats_misc, "money_modifier")
                __dd_mod += party_getdata(global.party_names[i], "weapon").stats_misc.money_modifier
            if !is_undefined(party_getdata(global.party_names[i], "armor1")) && struct_exists(party_getdata(global.party_names[i], "armor1").stats_misc, "money_modifier")
                __dd_mod += party_getdata(global.party_names[i], "armor1").stats_misc.money_modifier
            if !is_undefined(party_getdata(global.party_names[i], "armor2")) && struct_exists(party_getdata(global.party_names[i], "armor2").stats_misc, "money_modifier")
                __dd_mod += party_getdata(global.party_names[i], "armor2").stats_misc.money_modifier
		}
        
        __dd *= __dd_mod
        __dd = round(__dd)
        
        event_user(1)
        party_selection = -1
        
        // move the tp bar out of the way
        animate(0, -80, 10, anime_curve.circ_out, inst_tp_bar, "x_offset")
        
		cutscene_create()
		cutscene_dialogue(string(loc("enc_win"), __exp, __dd) + win_message)
        cutscene_set_variable(self, "win_hide_ui", true)
		cutscene_sleep(5)
        
        global.save.EXP += __exp
        global.save.MONEY += __dd
		
        cutscene_func(instance_destroy, [self])
        cutscene_func(instance_destroy, [inst_tp_bar])
		cutscene_set_variable(o_eff_bg, "destroy", true)
		cutscene_func(music_fade, [1, 0, 15])
        
        // move the party members and the enemies to where they need to be
		for (var i = 0; i < array_length(global.party_names); ++i) {
			var o = party_get_inst(global.party_names[i])
			
            cutscene_animate(o.x, save_pos[i][0], 12, "linear", o, "x")
		    cutscene_animate(o.y, save_pos[i][1], 12, "linear", o, "y")
		}
        for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
            if is_struct(encounter_data.enemies[i]) {
                var o = encounter_data.enemies[i].actor_id
                var a = marker_getpos("enemy_defeated", encounter_data.enemies[i].defeat_marker)
                
                if !is_undefined(a) && instance_exists(o) {
                    cutscene_animate(o.x, a.x, 12, "linear", o, "x")
                    cutscene_animate(o.y, a.y, 12, "linear", o, "y")
                }
            }
		}
		
        cutscene_sleep(12)
        // inform the actors they are no longer in a battle
		for (var i = 0; i < array_length(global.party_names); ++i) {
			var o = party_get_inst(global.party_names[i])
		    cutscene_set_variable(o, "is_in_battle", false)
		}
        for (var i = 0; i < array_length(encounter_data.enemies); ++i) {
            if is_struct(encounter_data.enemies[i]) && instance_exists(encounter_data.enemies[i].actor_id) {
                var o = encounter_data.enemies[i].actor_id
                cutscene_set_variable(o, "is_in_battle", false)
				instance_destroy(o)
            }
		}
		
        cutscene_set_variable(o_camera, "target", get_leader())
		cutscene_set_variable(get_leader(), "moveable_battle", true)
        
        if music_isplaying(0) {
            cutscene_func(music_resume, [0])
            cutscene_func(music_fade, [0, 1])
        }
        
        // make the party follow/not follow again
        for (var i = 0; i < array_length(save_follow); i ++) {
            cutscene_set_variable(party_get_inst(global.party_names[i]), "follow", save_follow[i])
        }
        
        cutscene_func(function() { // reset the battle music slot
            music_slot_reset(1)
        })
		cutscene_play()
        
        win_init = true
    }
}

// destroy flavor text when not in the selection screen
if (battle_state != BATTLE_STATE.MENU || battle_menu != BATTLE_MENU.BUTTON_SELECTION) && instance_exists(inst_flavor)
    instance_destroy(inst_flavor)

if !win_hide_ui
    ui_main_lerp = lerp(ui_main_lerp, 1, .5)
else
    ui_main_lerp = lerp(ui_main_lerp, 0, .5)

// do party ui lerping
for (var i = 0; i < array_length(global.party_names); i ++) {
    if i == party_selection 
        party_ui_lerp[i] = lerp(party_ui_lerp[i], 1, .5)
    else
        party_ui_lerp[i] = lerp(party_ui_lerp[i], 0, .5)
}

if buffer > 0
    buffer --