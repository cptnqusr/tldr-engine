function enc_set_rizonbot() : enc_set() constructor {
	debug_name	=	"rizonbot_single"
	enemies = [
		new enemy_rizonbot(),
	]
	
	bgm = noone
	
	enemies_pos = [
		[0, 0, true],
	]
	flavor = "Enemy Rizonbot!"
}