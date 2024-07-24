/datum/job/roguetown/guardsman
	title = "Watchman"
	flag = GUARDSMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 9
	spawn_positions = 9
	selection_color = JCOLOR_SOLDIER
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = "Responsible for the safety of the town and the enforcement of the King's law, you are the vanguard of the city faced with punishing those who defy his Royal Majesty. Though you've many lords to obey, as both the Church and the Bailiff have great sway over your life."
	display_order = JDO_TOWNGUARD
	whitelist_req = TRUE

	outfit = /datum/outfit/job/roguetown/guardsman
	give_bank_account = 16
	min_pq = 0
	max_pq = null

	cmode_music = 'sound/music/combat_guard.ogg'

/datum/job/roguetown/guardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "watchman tabard ([index])"

/datum/outfit/job/roguetown/guardsman/pre_equip(mob/living/carbon/human/H)
	. = ..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Footsman","Archer")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Footsman")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a footsman of the guard. Well versed in various close-quarters weapons and aprehending street-savy criminals."))
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE) 
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE) 
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 1)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 1)

			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)	//This does medium AND heavy armor training. Don't need both.

			head = /obj/item/clothing/head/roguetown/helmet
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail
			beltr = /obj/item/rogueweapon/mace/cudgel
			backr = /obj/item/rogueweapon/shield/wood		//Maybe give a buckler? Gave wood because 40 coverage is better than 10 but dunno.

		if("Archer")
			H.set_blindness(0)
			to_chat(H, span_warning("You are an archer of the guard. Not as strong as footmen, but nimble as a Rogue. Rooftops, bows, and daggers are your best friend."))
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 5, TRUE)		//Why master? Because all it does is effect draw time, which is strength x skill / 1.2. (Bow is just skill / 1.0). You get poor bonus strength, so you get skill to offset.
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE) 
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)	//For basic crafting; you'll need it due to relegated support role.
			H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)	//Likely hunter background; very crappy basic skill.
			H.change_stat("strength", 1)
			H.change_stat("perception", 2)
			H.change_stat("constitution", 1)
			H.change_stat("speed", 2)

			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)		//Bonus dodging in light armor
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)		//Still can wear medium armor

			head = /obj/item/clothing/head/roguetown/roguehood/red		//To-do: Make a guard hood come in kingdom's colors.
			armor = /obj/item/clothing/suit/roguetown/armor/leather		//So they get default-dodge expert
			beltr = /obj/item/quiver/bolts
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow

	//Universal stuff for all guards below.
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/storage/backpack/rogue/satchel/black
	beltl = /obj/item/keyring/guard
	belt = /obj/item/storage/belt/rogue/leather/black
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	cloak = /obj/item/clothing/cloak/stabard/guard
	wrists = /obj/item/clothing/wrists/roguetown/bracers	//Would seperate to leather bracers for archer for dodge but - funnily, armor class doesn't exist on bracers.
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/rope/chain = 1)

/mob/proc/haltyell()
	set name = "HALT!"
	set category = "Noises"
	emote("haltyell")
