/// @description Cutscene function
// You can write your code in this editor

function cutscene_longBacon() {
	cutscene_create()
	
	cutscene_player_canmove(false)
	cutscene_party_follow(false)
	
	cutscene_dialogue(["* Hey.", "* How are they?", "* ...good. I think.", 
	"* Color's still going away, but...", 
	"* They did this goofy goddamn voice and told me to 'go get 'er'.",])
	cutscene_sleep(15)
	cutscene_dialogue(["* Oh my god.", "* Did they actually say 'go get her'???????", "* YEAH. And, like,", 
	"* I told them that I was going to tell you that they said that.", "* Like, dumbass,"])
	cutscene_sleep(10)
	cutscene_dialogue(["* YOU'RE A DWEEB!!"])
	cutscene_audio_play(snd_suslaugh_ch1)
	cutscene_sleep(10)
	cutscene_audio_play(snd_krislaugh)
	cutscene_sleep(70)
	cutscene_dialogue(["* ...", "* (That laugh...)"])
	cutscene_sleep(130)
	
	cutscene_dialogue(["* Hey, uh...", "* Yeah?", "* ..."])
	cutscene_party_follow(true)
	cutscene_party_interpolate()
	cutscene_player_canmove(true)
	cutscene_play()
}