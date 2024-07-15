/datum/job/roguetown/merchant
	title = "Merchant"
	flag = MERCHANT
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	selection_color = JCOLOR_YEOMAN
	allowed_races = RACES_ALL_KINDS
	tutorial = "You were born into wealth, learning from before you could talk about the basics of mathematics. Counting coins is a simple pleasure for any person, but you've made it an artform. These people are addicted to your wares and you are the literal beating heart of this economy: Dont let these filthy-covered troglodytes ever forget that."

	display_order = JDO_MERCHANT

	outfit = /datum/outfit/job/roguetown/merchant
	give_bank_account = 22
	min_pq = 1
	max_pq = null
	required = TRUE

	cmode_music = 'sound/music/combat_giza.ogg'

/datum/outfit/job/roguetown/merchant/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, rand(3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, rand(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, rand(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, rand(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, rand(2,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/mathematics, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	ADD_TRAIT(H, TRAIT_SEEPRICES, type)
