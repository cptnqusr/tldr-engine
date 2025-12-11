/// @description Insert description here
// You can write your code in this editor
rizonCentralParkInst = actor_create(o_actor_rizon, 320, 400)
rizonCentralPath = path_add()

path_set_closed(rizonCentralPath, false)
path_set_kind(rizonCentralPath, 1)

path_add_point(rizonCentralPath,rizonCentralParkInst.x,rizonCentralParkInst.y,100)
path_add_point(rizonCentralPath,rizonCentralParkInst.x+100,rizonCentralParkInst.y+100,100)
path_add_point(rizonCentralPath,rizonCentralParkInst.x,rizonCentralParkInst.y+200,100)


_cutscene_RizonCentralPark = function() {
	
	cutscene_create()
	cutscene_player_canmove(false)
	cutscene_set_variable(o_camera, "target", noone)
	
	cutscene_sleep(60)
	cutscene_dialogue("????: Good evening, wretch.",,true)
	
	//cutscene_func(method(self, function() { 
	//	with o_actor_rizon
	//		path_start(other.rizonCentralPath,10,path_delete(other.rizonCentralPath),true)
	//}))
	
	//cutscene_wait_until(method(self, function() {
	//	with o_actor_rizon
	//		return !path_exists(other.rizonCentralPath)
	//}))
	
	cutscene_actor_move(o_actor_rizon,new actor_movement(
	0,
	50,
	60,,
	100,
	DIR.DOWN,
	false),,false)
	cutscene_set_variable(party_get_inst("sponge"), "dir", DIR.UP)
	cutscene_camera_pan(320,430,70,,"linear") //"expo_out/"expo_in"
	cutscene_sleep(80)
	cutscene_func(function() {
		var music_control = inst_8AF3066_1_1
		music_control.mus = mus_rizon
		music_control.loop_start = 42.78
		music_control.loop_end = 128
		music_control.alarm[0] = 1
	})
	
	
	cutscene_sleep(30)
	
	cutscene_dialogue(
	["RIZON: You have presented quite a problem for me and my shareholders.", 
	"The great Rizon Fortress is now Will Smith's 10th house, all thanks to your meddling.",
	"In exchange for curbing your idiocy, the board and I present a lucrative offer.",
	"This world is one I have created to fit your every desire.",
	"Of course, our data shows that your only desire is to be miserable.",
	"Welcome, Sponge... {p} to GLOOM YORK CITY.",
	"A city built upon the Chudson river of tears, with every citizen endlessly depressed...",
	"And all powered by an infinite resource: darkness.",
	"We can assure you that your lamentations will be of the highest quality.",
	"Should you have any problems adjusting to your new home... {p}{c}feel free to visit the NEO Fortress for support.",
	"...After you've found all 4 of the Support Keys scattered around the city, of course.",
	"Upon presenting the keys, we will put you on the waitlist.",
	"Again, we welcome you to your new home, wretch. Please..."],,true,true)
	
	
	cutscene_sleep(10)
	cutscene_func(music_fade, [0, -300, 20])
	cutscene_set_variable(o_actor_rizon, "dir", DIR.UP)
	cutscene_sleep(30)
	
	cutscene_dialogue("...sample our hospitality.",,true)
	
	cutscene_actor_move(o_actor_rizon,new actor_movement(
	0,
	-200,
	60,,
	100,
	DIR.UP,
	false),,true)
	cutscene_func(function () {
		var inst = o_actor_rizon.id
		instance_destroy(inst)
	})
	
	cutscene_func(function() {
		var music_control = inst_8AF3066_1_1
		music_control.mus = mus_gloom_york_blues
		music_control.loop_start = 11.7
		music_control.loop_end = 168.2
		music_control.alarm[0] = 1
	})
	
	cutscene_func(function() {
		camera_unpan(get_leader(), 20)
	})
	cutscene_player_canmove(true)
	cutscene_play()
}