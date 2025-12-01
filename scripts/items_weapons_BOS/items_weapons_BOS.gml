function item_w_masamune() : item_weapon() constructor {
	name = ["Masamune"]
	desc = ["Legendary blade. Is actually just two gremlins in a trenchcoat.", "--"]
	
	stats = {
		attack: 10,
	}
	icon = spr_ui_menu_icon_sword
	weapon_whitelist = ["frog"]
	
	weapon_fatal = true
	
	reactions = {
		susie: "(I want a sword now.)",
		ralsei: "It's beautiful!",
        noelle: "(Like a fairy tale...)",
		frog: "Nought but you remain.",
		scoot: "[It's fancy!]",
		bowie: "What a little wonder."
	}  
}
function item_w_depressionedge() : item_weapon() constructor {
	name = ["DepressionEdge"]
	desc = ["Sadness as a weapon. Does more damage the more TP you have.", "--"]
	
	stats = {
		attack: 3,
	}
	icon = spr_ui_menu_icon_sword
	weapon_whitelist = ["sponge"]
	
	weapon_fatal = true
	
	reactions = {
		susie: "(I want a sword now.)",
		ralsei: "It's beautiful!",
        noelle: "(Like a fairy tale...)",
		frog: "Nought but you remain.",
		scoot: "[It's fancy!]",
		bowie: "What a little wonder."
	}  
}