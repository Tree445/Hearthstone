/datum/job/roguetown/guardsman
	title = "Watchmen"
	flag = GUARDSMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 5
	spawn_positions = 5 // recruit more IC!
	selection_color = JCOLOR_SOLDIER
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = ALL_DIVINE_PATRONS // they should not be antags.
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = tutorial = "You are a member of the now consolidated city watch after the merger with the Bogmen. As such, you have been granted more training and gone through basic purity exercises as well. You are the last stand against whatever is out there in the bog and the town itself. Good luck."
	whitelist_req = TRUE

	outfit = /datum/outfit/job/roguetown/guardsman
		allowed_patrons = ALL_DIVINE_PATRONS
	advclass_cat_rolls = list(CTAG_WATCH = 20)

	give_bank_account = 100
	min_pq = 0
	max_pq = null

	cmode_music = 'sound/music/combat_guard.ogg'

/datum/job/roguetown/guardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/bog))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "watchman tabard ([index])"

//Universal stuff for all guards.
/datum/outfit/job/roguetown/guardsman
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	shoes = /obj/item/clothing/shoes/roguetown/boots
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	cloak = /obj/item/clothing/cloak/stabard/bog
	wrists = /obj/item/clothing/wrists/roguetown/bracers	//Would seperate to leather bracers for archer for dodge but - funnily, armor class doesn't exist on bracers.

/*Design philosophy: Men and women from various areas of life, from hunters to street-brawlers and more 'veteran' levy-men. Know less skills overall than Bog, but far more specialized.
Footsman is basically a regular foots-soldier with gear to combat criminals, specializes in maces, polearms, and decent flail/sword training.
Archer is basically a 'bounty-catcher' in function, less specialized at close-quarters, beyond knives, but very capable of downing a fleeing criminal.*/
/datum/advclass/watchman/footsman
	name = "Watch Footsman"
	tutorial = "You are a footsman of the Town Watch. Well versed in various close-quarters weapons and aprehending street-savy criminals."
	outfit = /datum/outfit/job/roguetown/guardsman/footsman

	category_tags = list(CTAG_WATCH)

/datum/outfit/job/roguetown/guardsman/footsman/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 1)

	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)	//This does medium AND heavy armor training. Don't need both.

	head = /obj/item/clothing/head/roguetown/helmet
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	beltr = /obj/item/rogueweapon/mace/cudgel
	backr = /obj/item/rogueweapon/shield/wood		//Maybe give a buckler? Gave wood because 40 coverage is better than 10 but dunno.
	backr = /obj/item/storage/backpack/rogue/satchel/black
	beltl = /obj/item/storage/keyring/guard
	belt = /obj/item/storage/belt/rogue/leather/black
	gloves = /obj/item/clothing/gloves/roguetown/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/rope/chain = 1, /obj/item/signal_horn = 1, /obj/item/listenstone = 1,) //listen stone might be too op, but not like the sheriff has both

/datum/advclass/watchman/archer
	name = "Watch Archer"
	tutorial = "You are an archer of the Town Watch. Once a hunter, now a man-hunter for your lord. Rooftops, bows, and daggers are your best friend."
	outfit = /datum/outfit/job/roguetown/guardsman/archer

	category_tags = list(CTAG_WATCH)

/datum/outfit/job/roguetown/guardsman/archer/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 5, TRUE)		//Why master? Because all it does is effect draw time, which is strength x skill / 1.2. (Bow is just skill / 1.0). You get poor bonus strength, so you get skill to offset.
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)		//Maybe take away? Leaving for now just as a fall-back for non-lethal ability.
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)	//For basic crafting; you'll need it due to relegated support role.
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)	//Likely hunter background; very crappy basic skill.
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("perception", 2)
	H.change_stat("constitution", 1)
	H.change_stat("speed", 2)

	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)		//Bonus dodging in light armor
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)		//Still can wear medium armor; maybe remove if too strong with stats/skills. They'll live with light armor + speed anyway.

	head = /obj/item/clothing/head/roguetown/roguehood/red		//To-do: Make a guard hood come in kingdom's colors.
	armor = /obj/item/clothing/suit/roguetown/armor/leather		//So they get default-dodge expert usage.
	beltr = /obj/item/quiver/bolts
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	backr = /obj/item/storage/backpack/rogue/satchel/black
	beltl = /obj/item/storage/keyring/guard
	belt = /obj/item/storage/belt/rogue/leather/black
	gloves = /obj/item/clothing/gloves/roguetown/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/rope/chain = 1, /obj/item/signal_horn = 1)

/mob/proc/haltyell()
	set name = "HALT!"
	set category = "Noises"
	emote("haltyell")
