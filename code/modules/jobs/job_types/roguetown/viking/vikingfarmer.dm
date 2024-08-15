
/datum/job/roguetown/vikingfarmer
	title = "Northern Hostage"
	f_title = "Northern Hostage"
	flag = VIKINGFARMER
	department_flag = VIKING
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS

	tutorial = "The fact you haven't been sacrificed to some dark god is proof enough that your captors are not as cruel as those that hail from the Frost Lands, in spite of this, they can be harsh taskmasters. At this point you've given up hope of rescue, do as your captors say, and you might yet live to see another day, and if you are truly lucky, they might even ransom you."
	whitelist_req = FALSE

	
	outfit = /datum/outfit/job/roguetown/farmer
	display_order = JDO_VIKINGFARMER
	min_pq = -10
	max_pq = null

/datum/outfit/job/roguetown/farmer/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, pick(4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)

	if(H.gender == MALE)
		head = /obj/item/clothing/head/roguetown/roguehood/random
		if(prob(50))
			head = /obj/item/clothing/head/roguetown/strawhat
		pants = /obj/item/clothing/under/roguetown/tights/random
		armor = /obj/item/clothing/suit/roguetown/armor/workervest
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		belt = /obj/item/storage/belt/rogue/leather/rope
	else
		head = /obj/item/clothing/head/roguetown/armingcap
//		pants = /obj/item/clothing/under/roguetown/trou
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		belt = /obj/item/storage/belt/rogue/leather/rope


