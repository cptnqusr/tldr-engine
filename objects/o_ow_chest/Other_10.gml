if image_index == 1 {
    empty_callback()
	exit
}

if is_method(open_override) {
    open_override()
    exit
}

if is_struct(item_inside) && is_instanceof(item_inside, item) {
    image_index = 1
    audio_play(snd_locker)
    
    screen_shake(5)
    
    var txt = loc_string("item_chest_get", item_get_name(item_inside)) + "{p}{c}"
    txt += item_add(item_inside)
	if !state_get("progress","firstChestOpened")
		txt += "{p}{c}Press the C Key or Y button to open the menu."
		state_add("progress","firstChestOpened")
    dialogue_start(txt)
	
}
else {
    image_index = 1
    audio_play(snd_locker)
    
    dialogue_start(loc("item_chest_empty"))
}

memory_flick(state_group, id, true)