/datum/advclass/mercenary/desert_rider
	name = "Desert Rider Mercenary"
	tutorial = "Blood, like the desert sand, stains your hands, a crimson testament to the gold you covet. A desert rider, renowned mercenary of the far east, your scimitar whispers tales of centuries-old tradition. Your loyalty, a fleeting mirage in the shifting sands, will yield to the allure of fortune."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/desert_rider
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 6
	cmode_music = 'sound/music/combat_desertrider.ogg' //GREATEST COMBAT TRACK IN THE GAME SO FAR BESIDES MAYBE MANIAC2.OGG


/datum/outfit/job/roguetown/mercenary/desert_rider/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Sayf Majaaniun","Bunduqiat Majaania")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Sayf Majaaniun")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Sayf Majaaniun, a Free Sword. You can dance with the best of the desert duelists."))
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)
			H.change_stat("perception", 1)
			H.change_stat("speed", 2)
			r_hand = /obj/item/rogueweapon/sword/long/marlin
			backr = /obj/item/rogueweapon/sword/long/rider
			shoes = /obj/item/clothing/shoes/roguetown/shalal
			head = /obj/item/clothing/head/roguetown/swordmanshalal
			gloves = /obj/item/clothing/gloves/roguetown/angle
			belt = /obj/item/storage/belt/rogue/leather/shalal
			armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
			pants = /obj/item/clothing/under/roguetown/chainlegs/iron
			neck = /obj/item/clothing/neck/roguetown/shalal
		if("Bunduqiat Majaania")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Bunduqiat Majaania, a Free Rifle. Use that exotic jezail of yours to earn some real coin, just beware, ammo is not easy to come by in Rockhill!"))
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.change_stat("strength", 1)	//Less strength then sword-role but more speed; trade-off.
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 1)
			H.change_stat("perception", 3)
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/jezail
			beltr = /obj/item/ammopouch/bullets
			shoes = /obj/item/clothing/shoes/roguetown/shalal
			head = /obj/item/clothing/head/roguetown/roguehood/shalal
			gloves = /obj/item/clothing/gloves/roguetown/fingerless
			belt = /obj/item/storage/belt/rogue/leather/shalal
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
			pants = /obj/item/clothing/under/roguetown/trou/shortpants
			neck = /obj/item/clothing/neck/roguetown/shalal

	backpack_contents = list(/obj/item/roguekey/mercenary)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
