/datum/advclass/knighterrant
	name = "Cavalryman" // Once called Knight Errant. But Fuck Dat.
	tutorial = "You wandered off from your home seeking adventure, roaming to greener pastures for honor and chilvalry. You became an instrument of war, sitting atop a saiga, weapon and shield in hand! What will await here?"
	allowed_races = RACES_ALL_KINDS
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/adventurer/knighterrant
	maximum_possible_slots = 10 // testing purposes!
	pickprob = 100 // for testing purposes
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/combat_cavalry.ogg' // Spanish guitars fuck, don't @ me


/datum/outfit/job/roguetown/adventurer/knighterrant/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Cataphract","Vanguard","Conqueror") // Each based off Don Quixote, El Cid and Teutonic knights, respectively!
	var/classchoice = input("Choose your path", "Available archetypes","Who are you, really?") as anything in classes

	switch(classchoice)
	
		if("Cataphract")
			H.set_blindness(0)
			to_chat(H, span_warning("Some call you a madman. Others, an idiot. Yet you ride on, with your spear in one hand, and your shield in the other. When life itself seems lunatic, who knows where madness lies?"))
			shoes = /obj/item/clothing/shoes/roguetown/ridingboots
			pants = /obj/item/clothing/under/roguetown/trou/leather
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			gloves = /obj/item/clothing/gloves/roguetown/leather
			wrists = /obj/item/clothing/wrists/roguetown/bracers
			belt = /obj/item/storage/belt/rogue/leather/black
			head = /obj/item/clothing/head/roguetown/helmet/kettle
			backr = /obj/item/rogueweapon/shield/tower
			beltr = /obj/item/flashlight/flare/torch/lantern
			beltl = /obj/item/rogueweapon/sword/iron/short
			if(prob(15))
				r_hand = /obj/item/rogueweapon/eaglebeak/lucerne
			else
				r_hand = /obj/item/rogueweapon/spear/billhook
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 2)
			H.change_stat("intelligence", -1)
			H.change_stat("perception", -1) // The idea here is a knight with good proficiency at spears and shield! He can still learn something, maybe.
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
		if("Vanguard")
			H.set_blindness(0)
			to_chat(H, span_warning("You've seen battle, and you've known victory! Yet here you are- forced to roam for glory. If all men knew that banishment would be like this, we'd have a world of exiles."))
			shoes = /obj/item/clothing/shoes/roguetown/ridingboots
			head = /obj/item/clothing/head/roguetown/helmet
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			belt = /obj/item/storage/belt/rogue/leather
			pants = /obj/item/clothing/under/roguetown/trou/leather
			cloak = /obj/item/clothing/cloak/cape/guard
			backr = /obj/item/rogueweapon/shield/wood
			backl = /obj/item/storage/backpack/rogue/satchel
			beltr = /obj/item/flashlight/flare/torch/lantern
			backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1)
			if(prob(33))
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
				beltl = /obj/item/rogueweapon/sword/short
			else if(prob(33))
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
				beltl = /obj/item/rogueweapon/sword/falchion
			else
				H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
				beltl = /obj/item/rogueweapon/stoneaxe/woodcut/steel
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.change_stat("perception", -1)
			H.change_stat("endurance", 3)
			H.change_stat("intelligence", -1)
			H.change_stat("strength", 2)
			H.change_stat("constitution",2) // Closest to OG knight errant. Ideally, still on saiga. good sword/axe, good wrestling/unarmed, shit otherwise
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
		if("Conqueror")
			H.set_blindness(0)
			to_chat(H, span_warning("You can't quite recall something such as an easy life. Your arms are accustomed to the weight of a tool of war in hand. Gladly you obey and go where duty calls - to confront destiny, weapon in hand."))
			shoes = /obj/item/clothing/shoes/roguetown/ridingboots
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/footmanchestplate
			head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			belt = /obj/item/storage/belt/rogue/leather
			pants = /obj/item/clothing/under/roguetown/chainlegs/iron
			backr = /obj/item/rogueweapon/shield/wood
			cloak = /obj/item/clothing/cloak/tabard
			backl = /obj/item/storage/backpack/rogue/satchel
			beltr = /obj/item/flashlight/flare/torch/lantern
			backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1)
			beltl = /obj/item/rogueweapon/flail
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.change_stat("perception", -2)
			H.change_stat("endurance", 3)
			H.change_stat("intelligence", -2)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 3) // You're the closest to a civilized barbarian. You smash shit. You crush armor. That is it.
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()

/*
	// OLD KNIGHT ERRANT SHIT.
	/datum/outfit/job/roguetown/adventurer/knighterrant/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/knight
	gloves = /obj/item/clothing/gloves/roguetown/plate
	pants = /obj/item/clothing/under/roguetown/platelegs
	cloak = /obj/item/clothing/cloak/tabard
	neck = /obj/item/clothing/neck/roguetown/bervor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	beltr = /obj/item/rogueweapon/sword/long
	belt = /obj/item/storage/belt/rogue/leather/hand
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/rogueweapon/shield/tower
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 1)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 3)
		H.change_stat("endurance", 2)
		H.change_stat("speed", -1)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
