/// @description Cutscene function
// You can write your code in this editor

function cutscene_greyLenoShow() {
	cutscene_create()
	
	cutscene_player_canmove(false)
	cutscene_party_follow(false)
	
	// cutscene_sleep(10)
	cutscene_dialogue("????: LIVE, from the Rizon Studios in Gloom York City...")
	cutscene_sleep(30)
	cutscene_dialogue("GREY: It's the Grey Leno show!")
	cutscene_sleep(90)
	cutscene_dialogue(["GREY: Hey everybody! We're back for another season!",
	"GREY: I'd like to thank our sponsor for renewing our contract...",
	"GREY: And folks, you'd never guess who it is!"])
	cutscene_sleep(30)
	cutscene_dialogue("FROG: Foul servant...")
	cutscene_dialogue(["GREY: Y'know, folks, I hate to keep you waiting.",
	"GREY: Not to say you aren't patient - our six hour extravaganza had high ratings!",
	"GREY: But I know you folks have been dying to see me interview our guest tonight."])
	cutscene_sleep(30)
	cutscene_dialogue(["GREY: Give it up...", "GREY: ...for Sponge Mario!"])
	cutscene_sleep(120)
	cutscene_dialogue("GREY: And friends!")
	cutscene_sleep(30)
	cutscene_dialogue("FROG: Sponge, let us not humor this fool.")
	cutscene_sleep(30)
	cutscene_dialogue("FROG: Verily? The same dormitory?")
	cutscene_dialogue(["GREY: Yeah, he sang at my wedding.", 
	"GREY: How are you, Sponge? You look like you haven't slept for days!",
	"GREY: And knowing you, that's an improvement, right folks?",
	"{choice(`Fine, thanks`,`Everything hurts`)}{e}"])
	cutscene_dialogue(["GREY: Uh...", 
	"GREY: Need a Lozenge? Your voice sounds funny."])
	cutscene_sleep(30)
	cutscene_dialogue(["BOWIE: (He notices, too.)"])
	cutscene_dialogue(["GREY: And folks, I can hardly believe myself that not only do we have Sponge with us here tonight...", "GREY: We have Mr. Frog back for his second interview!"])
	cutscene_sleep(30)
	cutscene_dialogue(["FROG: Second?! I have only met thee at this very hour!", "GREY: Oh, uh...", "GREY: I must have mixed you up with another frog, right folks?"])
	cutscene_sleep(20)
	cutscene_dialogue(["GREY: Thank you, thank you!"])
	cutscene_sleep(10)
	cutscene_dialogue(["GREY: To top it all off on this star-studded episode...", "GREY: The incomparable David Bowie!"])
	cutscene_dialogue(["GREY: Say folks, we'll come back to our guests here...", "GREY: ...but we've got an incredible segment for you!", "GREY: Hit it!"])
	cutscene_sleep(30)
	cutscene_dialogue("GREY: We've got a little time. Folks, have you already talked with Dink?")
	cutscene_sleep(20)
	cutscene_dialogue(["FROG:...","FROG: Indeed."])
	cutscene_dialogue("GREY: Take this.")
	cutscene_dialogue("Support Key received!")
	cutscene_dialogue(["BOWIE: So, why this? Was the opportunity to perform too good to pass up?"])
	cutscene_sleep(15)
	cutscene_dialogue(["GREY: ...", "GREY: Y'know...",]) 
	cutscene_dialogue(["GREY: If you had asked me that two months ago, I would've said yes.", 
	"GREY: It'd make me happy, right?", "GREY: ...",])
	cutscene_sleep(30)
	cutscene_dialogue(["GREY: And then I got on that ferris wheel with a woman I had been getting to know.",
	"GREY: When she told me my show fucking sucked, to my face...",
	"GREY: I knew, right then and there..."])
	cutscene_sleep(30)
	cutscene_dialogue("GREY: ...that I wanted to be with her for the rest of my life.")
	cutscene_sleep(20)
	cutscene_dialogue(["GREY: Sponge, I...", "GREY: I don't think I've really articulated how grateful I am.",
	"GREY: You're the reason Lim and I got together, in a weird way.",
	"GREY: I mean, I can't speak for her, but..."])
	cutscene_dialogue("FROG: Where is she?")
	cutscene_dialogue("GREY: Business trip. Talk about bad timing, right folks?")
	cutscene_sleep(30)
	cutscene_dialogue(["GREY: When we get back on the air, I'm contractually obligated to fight you.", 
	"GREY: He says he'll kill everyone in the Freak Tent if I don't.", 
	"GREY: ...",
	"GREY: Just keep fighting, folks."])
	cutscene_sleep(30)
	cutscene_dialogue(["GREY: Alright, folks, we're at the end of our show!", 
	"GREY: We have a wonderful musical guest tonight...",
	"GREY: ...and it'll be scoring the fight of the century!"])
	cutscene_sleep(20)
	cutscene_dialogue(["GREY: Performing their hit `Talking to Her`, featuring a Chunk of Salmon... ", 
	"GREY: It's Wayne and the Hylics!",])
	cutscene_dialogue("FROG: A chunk of salmon?!")
	cutscene_dialogue("GREY: Hey, that's what it says on my card.")
	
	cutscene_party_follow(true)
	cutscene_party_interpolate()
	cutscene_player_canmove(true)
	cutscene_play()
}

