/// @description Insert description here
// You can write your code in this editor

if !state_get("progress", "spongeTutorialWakeUp")
	cutscene_code()
	state_add("progress", "spongeTutorialWakeUp")

show_debug_message(global.items)
show_debug_message(global.key_items)