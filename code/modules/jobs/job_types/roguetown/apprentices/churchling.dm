/datum/job/roguetown/churchling
	title = "Churchling"
	flag = CHURCHLING
	department_flag = APPRENTICES
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = RACES_ALL_KINDS
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)

	tutorial = "Your family were zealots, they scolded you with a studded belt and prayed like sinners every waking hour of the day they weren’t toiling in the fields. You escaped them by becoming a churchling, and a guaranteed education isnt so bad."

	outfit = /datum/outfit/job/roguetown/churchling
	display_order = JDO_CHURCHLING
	give_bank_account = TRUE
	min_pq = -10
	max_pq = null

/datum/outfit/job/roguetown/churchling/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	neck = /obj/item/clothing/neck/roguetown/psicross
	if(H.gender == MALE)
		armor = /obj/item/clothing/suit/roguetown/shirt/robe
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	else
		head = /obj/item/clothing/head/roguetown/nun
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/nun
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	pants = /obj/item/clothing/under/roguetown/tights
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/roguekey/church
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	backl = /obj/item/storage/backpack/rogue/satchel

	H.change_stat("perception", 1)
	H.change_stat("speed", 2)

	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_churchling(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
