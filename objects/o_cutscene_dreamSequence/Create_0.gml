/// @description Insert description here
// You can write your code in this editor

inst_dialogue = noone
global.party_names = ["atlas"]

function cutscene_dreamSequence() {
	cutscene_create()
	cutscene_player_canmove(false)
	cutscene_party_follow(false)
	
	cutscene_func(fader_fade,[0,1,0])
	cutscene_sleep(10)
	cutscene_audio_play(snd_txtsus_trippy)
	cutscene_func(method(id, function(){
		inst_dialogue = text_typer_create("...we just wait?", 160, 140, DEPTH_UI.DIALOGUE_UI, "{can_skip(false)}{speed(3)}{xspace(3)}{yspace(18)}{break_tabulation(false)}{font(`text_DR`)}", "{p}{e}", {
			gui: true,can_superskip: false,caller: id,},)
	}))
	cutscene_sleep(230)
	cutscene_func(music_play, [mus_sadlonelyworld, 0, true, 0])
	cutscene_func(music_fade, [0, 1, 300])
	cutscene_func(fader_fade, [1,0,120])
	cutscene_func(method(id, function(){
		inst_dialogue = noone
	}))
	cutscene_player_canmove(true)
	cutscene_sleep(3000)
	
	
	cutscene_audio_play(snd_txtsus_trippy)
	cutscene_func(method(id, function(){
		inst_dialogue = text_typer_create("Hey.", 160, 140, DEPTH_UI.DIALOGUE_UI, "{can_skip(false)}{speed(3)}{xspace(3)}{yspace(18)}{break_tabulation(false)}{font(`text_DR`)}", "{p}{e}", {
			gui: true,can_superskip: false,caller: id,},)
	}))
	cutscene_sleep(79)
	cutscene_func(method(id, function(){
		inst_dialogue = text_typer_create("On the wheel", 160, 140, DEPTH_UI.DIALOGUE_UI, "{can_skip(false)}{speed(3)}{xspace(3)}{yspace(18)}{break_tabulation(false)}{font(`text_DR`)}", "{p}{e}", {
			gui: true,can_superskip: false,caller: id,},)
	}))
	cutscene_sleep(100)
	cutscene_func(method(id, function(){
		inst_dialogue = text_typer_create("you said you had", 160, 140, DEPTH_UI.DIALOGUE_UI, "{can_skip(false)}{speed(3)}{xspace(3)}{yspace(18)}{break_tabulation(false)}{font(`text_DR`)}", "{p}{e}", {
			gui: true,can_superskip: false,caller: id,},)
	}))
	cutscene_sleep(100)
	cutscene_func(method(id, function(){
		inst_dialogue = text_typer_create("something to tell me.", 160, 140, DEPTH_UI.DIALOGUE_UI, "{can_skip(false)}{speed(3)}{xspace(3)}{yspace(18)}{break_tabulation(false)}{font(`text_DR`)}", "{p}{e}", {
			gui: true,can_superskip: false,caller: id,},)
	}))
	cutscene_sleep(100)
	cutscene_func(method(id, function(){
		inst_dialogue = noone
	}))
	cutscene_sleep(45)
	cutscene_audio_play(snd_txtnoe_trippy)
	cutscene_func(method(id, function(){
		inst_dialogue = text_typer_create("It doesn't matter now.", 160, 140, DEPTH_UI.DIALOGUE_UI, "{can_skip(false)}{speed(3)}{xspace(3)}{yspace(18)}{break_tabulation(false)}{font(`text_DR`)}", "{p}{e}", {
			gui: true,can_superskip: false,caller: id,},)
	}))
	cutscene_sleep(300)
	cutscene_func(method(id, function(){
		inst_dialogue = noone
	}))
	cutscene_sleep(30)
	cutscene_audio_play(snd_txtsus_trippy)
	cutscene_func(method(id, function(){
		inst_dialogue = text_typer_create("No, it...", 160, 140, DEPTH_UI.DIALOGUE_UI, "{can_skip(false)}{speed(3)}{xspace(3)}{yspace(18)}{break_tabulation(false)}{font(`text_DR`)}", "{p}{e}", {
			gui: true,can_superskip: false,caller: id,},)
	}))
	cutscene_sleep(300)
	cutscene_func(fader_fade,[0,1,0])
	cutscene_func(music_stop, [0])
	cutscene_player_canmove(false)
	cutscene_func(method(id, function(){
		inst_dialogue = noone
	}))
	cutscene_sleep(60)
	cutscene_func(method(id, function(){
		inst_dialogue = text_typer_create("It matters a lo", 160, 140, DEPTH_UI.DIALOGUE_UI, "{can_skip(false)}{speed(3)}{xspace(3)}{yspace(18)}{break_tabulation(false)}{font(`text_DR`)}", "{p}{e}", {
			gui: true,can_superskip: false,caller: id,},)
	}))
	cutscene_sleep(60)
	cutscene_func(method(id, function(){
		inst_dialogue = noone
	}))
	cutscene_audio_play(snd_rizon_fountain)
	cutscene_sleep(30)
	cutscene_func(fader_fade_white, [0,1,0])
	cutscene_sleep(15)
	cutscene_func(function(){room_goto_next()})
	cutscene_func(fader_fade,[1,0,1]) 
	cutscene_func(fader_fade_white, [1,0,0])
	
	cutscene_party_follow(true)
	cutscene_party_interpolate()
	cutscene_player_canmove(true)
	cutscene_play()
}