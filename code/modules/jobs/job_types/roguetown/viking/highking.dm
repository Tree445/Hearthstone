
/datum/job/roguetown/highking
	title = "Northmen King"
	f_title = "Northmen Queen"
	flag = HIGHKING
	department_flag = VIKING
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	show_in_credits = FALSE		//Stops Scom from announcing their arrival.
	spells = list(/obj/effect/proc_holder/spell/self/convertrole/viking)
	tutorial = "You and your clan left the Narvali Highlands some time ago, in search of glory. Not nearly as barbaric as your cousins from the Frost Lands, nevertheless you still retain that fire in your heart for pillaging. The Isle of Enigma is a pretty target, and isolated enough so that you won't draw enough attention. But be warned, Rockhill could very well crush your warband if ever tensions were to get out of hand. Will you show these southerners you are not fanatical warriors they make you out to be, or will you prove them right in senseless slaughter?"
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/highking

	display_order = JDO_HIGHKING
	min_pq = 2
	max_pq = null
	cmode_music = 'sound/music/combat_viking.ogg'

/datum/outfit/job/roguetown/highking/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == MALE)
		head = /obj/item/clothing/head/roguetown/helmet/winged
		backr = /obj/item/storage/backpack/rogue/satchel
		beltl = /obj/item/rogueweapon/stoneaxe/battle
		beltr = /obj/item/rogueweapon/sword
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
		pants = /obj/item/clothing/under/roguetown/platelegs/skirt
		belt = /obj/item/storage/belt/rogue/leather
		neck = /obj/item/storage/belt/rogue/pouch/coins/rich
		armor = /obj/item/clothing/suit/roguetown/armor/plate/half/ironharness
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		cloak = /obj/item/clothing/cloak/raincloak/furcloak
	else
		head = /obj/item/clothing/head/roguetown/helmet/winged
		backr = /obj/item/storage/backpack/rogue/satchel
		beltl = /obj/item/rogueweapon/stoneaxe/battle
		beltr = /obj/item/rogueweapon/sword
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
		pants = /obj/item/clothing/under/roguetown/platelegs/skirt
		belt = /obj/item/storage/belt/rogue/leather
		neck = /obj/item/storage/belt/rogue/pouch/coins/rich
		armor = /obj/item/clothing/suit/roguetown/armor/plate/bikini
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		cloak = /obj/item/clothing/cloak/raincloak/furcloak

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE) // Chieftess gets nearly same skills as guard.
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2 , TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3 , TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
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

		H.change_stat("strength", 4)		//Same as heavy royal guard; highest of normal roles in game.
		H.change_stat("intelligence", -2)
		H.change_stat("constitution", 4)	//Fucking strong; maybe consider toning down if too much still.
		H.change_stat("endurance", 3)
		H.change_stat("speed", -2)
	
/obj/effect/proc_holder/spell/self/convertrole/viking
	name = "Recruit Clanshield"
	new_role = "Viking Clanshield"
	recruitment_faction = "Viking"
	recruitment_message = "Serve the clan, %RECRUIT!"
	accept_message = "FOR THE CLAN!"
	refuse_message = "I refuse."

