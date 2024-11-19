/datum/job/roguetown/prisonerd
	title = "Public Servant"
	flag = PRISONERD
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 15
	spawn_positions = 15

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	tutorial = "Though the title 'public servant' may sound like you are not a slave, matter of fact you are. Stripped of your rights to even your own body, you must work to try to pay off your debt you made previously so you may reclaim your freedom."

	outfit = /datum/outfit/job/roguetown/prisonerd
	display_order = JDO_PRISONERD
	give_bank_account = 10
	min_pq = -14
	max_pq = null
	can_random = FALSE

	cmode_music = 'sound/music/combat_bum.ogg'

/datum/outfit/job/roguetown/prisonerd/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/gorget/prisoner/servant
	if(H.gender == FEMALE)
		pants = /obj/item/clothing/under/roguetown/tights/stockings
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/rags
		pants = /obj/item/clothing/under/roguetown/loincloth/brown
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/mining, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/music, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("fortune", 2)
		H.change_stat("strength", 1)
		H.change_stat("constitution", -1)
		ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_NASTY_EATER, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
