function enc_set_rizonbot() : enc_set() constructor {
	debug_name	=	"rizonbot_single"
	enemies = [
		new enemy_rizonbot(),
		new enemy_rizonbot(),
	]
	
	bgm = noone
	
	_target_calculation = function() {
        var __targets = []
        
        for (var i = 0; i < array_length(global.party_names); ++i) {
		    if party_getdata(global.party_names[i], "hp") > 0
				array_push(__targets, global.party_names[i])
		}
        
        return [array_shuffle(__targets)[0]]
    }
	
	enemies_pos = [
		[0, 0, true],
		[0, 30, true],
	]
	flavor = "Enemy Rizonbot!"
}

function enc_set_meatDummy() : enc_set() constructor {
	debug_name	=	"meat_dummy"
	enemies = [
		new enemy_meatdummy(),
	]

	bgm = noone
	
	_target_calculation = function() {
        var __targets = []
        
        for (var i = 0; i < array_length(global.party_names); ++i) {
		    if party_getdata(global.party_names[i], "hp") > 0
				array_push(__targets, global.party_names[i])
		}
        
        return [array_shuffle(__targets)[0]]
    }
	
	enemies_pos = [
		[0, 0, true],
		]
	
	flavor = function() {
		var _count = 0
		var _flavor_array = ["Time your attack as close to the end as possible.", "Move Vineshroom to dodge bullets.", "Cast spells with Sadness Points (SP).",]
		var _selected_text = _flavor_array[_count]
		_count++
		if _count > 2
			_count = 0
		return _selected_text
		}
}

function enc_set_frog() : enc_set() constructor {
	debug_name	=	"frog"
	enemies = [
		new enemy_frog(),
	]
	
	bgm = mus_cryos_remote
	
	_target_calculation = function() {
        var __targets = []
        
        for (var i = 0; i < array_length(global.party_names); ++i) {
		    if party_getdata(global.party_names[i], "hp") > 0
				array_push(__targets, global.party_names[i])
		}
        
        return [array_shuffle(__targets)[0]]
    }
	
	enemies_pos = [
		[0, 0, true],
	]
	flavor = "Enemy Rizonbot!"
}
