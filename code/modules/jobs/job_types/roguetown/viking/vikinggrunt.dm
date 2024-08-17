
/datum/job/roguetown/vikinggrunt
	title = "Northmen Berserkir"
	f_title = "Northmen Ulfhednar"
	flag = VIKINGGRUNT
	department_flag = VIKING
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = "You are a Berserkir, a clan warrior. Do as your leader says and there may yet be glory to be found."
  show_in_credits = FALSE		//Stops Scom from announcing their arrival.
  whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/vikinggrunt

	display_order = JDO_VIKINGGRUNT
	min_pq = 2
	max_pq = null
	cmode_music = 'sound/music/combat_viking.ogg'

/datum/outfit/job/roguetown/vikinggrunt/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == MALE)
		head = /obj/item/clothing/head/roguetown/helmet/horned
		backr = /obj/item/storage/backpack/rogue/satchel
		beltl = /obj/item/rogueweapon/stoneaxe/battle
		beltr = /obj/item/rogueweapon/sword
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
		pants = /obj/item/clothing/under/roguetown/chainlegs/skirt
		belt = /obj/item/storage/belt/rogue/leather
		neck = /obj/item/storage/belt/rogue/pouch/coins/rich
		armor = /obj/item/clothing/suit/roguetown/armor/plate/half/ironharness
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	else
		head = /obj/item/clothing/head/roguetown/helmet/horned
		backr = /obj/item/storage/backpack/rogue/satchel
		beltl = /obj/item/rogueweapon/stoneaxe/battle
		beltr = /obj/item/rogueweapon/sword
		pants = /obj/item/clothing/under/roguetown/chainlegs/skirt
		belt = /obj/item/storage/belt/rogue/leather
		neck = /obj/item/storage/belt/rogue/pouch/coins/rich
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE) // Chieftess gets nearly same skills as guard.
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2 , TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3 , TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/butchering, 3, TRUE)

		H.change_stat("strength", 3)		//Same as captain.
		H.change_stat("intelligence", -2)
		H.change_stat("constitution", 3)
		H.change_stat("endurance", 3)
		H.change_stat("speed", -2)
