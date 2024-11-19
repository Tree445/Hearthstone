/datum/job/roguetown/noble
	title = "Noble Guest"
	flag = KNIGHT
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	allowed_patrons = ALL_DIVINE_PATRONS
	tutorial = "A Noble Civilian of the Dreamhold; your family likely served the Wood Elves of this forest many many centuries. Perhaps, you came to this title from Adventuring renown; regarded as one of the newblood. Your status has you respected as an educated dignitary who knows much of the land and it's wisdoms."
	display_order = JDO_NOBLE
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/noble
	give_bank_account = 22
	min_pq = 0
	max_pq = null


/datum/job/roguetown/noble/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
/*	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Lord"
		if(H.gender == FEMALE)
			honorary = "Lady"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]" */

/datum/outfit/job/roguetown/noble/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == MALE)
		head = /obj/item/clothing/head/roguetown/fancyhat
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		shoes = /obj/item/clothing/shoes/roguetown/nobleboot
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/keyring/nobleguest
		beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
		backr = /obj/item/storage/backpack/rogue/satchel
		if(prob(50))
			cloak = /obj/item/clothing/cloak/cape/knight
		else
			cloak = /obj/item/clothing/cloak/half
	else
		head = /obj/item/clothing/head/roguetown/hennin
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/random
		cloak = /obj/item/clothing/cloak/cape/knight
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/roguekey/keep_dungeon
		r_hand = /obj/item/roguekey/manor
		beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
		backr = /obj/item/storage/backpack/rogue/satchel
		if(prob(50))
			cloak = /obj/item/clothing/cloak/cape/knight
		else
			cloak = /obj/item/clothing/cloak/half
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
		H.change_stat("perception", 2)
		H.change_stat("endurance", -1)
		H.change_stat("strength", -1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 2)


	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
