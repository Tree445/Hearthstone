/datum/job/roguetown/butler
	title = "Head Butler"
	f_title = "Head Maid"
	flag = BUTLER
	department_flag = COURTIERS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_ALL_KINDSPLUS
	allowed_ages = ALL_AGES_LIST

	tutorial = "Servitude unto death; That is your motto. Having nurtured royalty for years, you are nothing short of the King's majordomo, commanding over the rest of the house staff."

	outfit = /datum/outfit/job/roguetown/butler
	display_order = JDO_BUTLER
	give_bank_account = 30
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/butler/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 3, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("constitution", -1)
		H.change_stat("intelligence", 2)
		H.change_stat("perception", 2)

	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/storage/keyring/servant
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/black
		backl = /obj/item/storage/backpack/rogue/satchel
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)
	else
		switch(H.patron?.type)
			if(/datum/patron/divine/eora) //Eoran loadouts
				armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy/black
				pants = pick(/obj/item/clothing/under/roguetown/tights/stockings/silk/black, /obj/item/clothing/under/roguetown/tights/stockings/fishnet/black)
				head  = /obj/item/clothing/head/peaceflower
			else
				armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen
				pants = pick(/obj/item/clothing/under/roguetown/tights/stockings/black, /obj/item/clothing/under/roguetown/tights/stockings/white) //Added stockings for the maids

		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		cloak = /obj/item/clothing/cloak/apron/waist
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/storage/keyring/servant
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		pants = /obj/item/clothing/under/roguetown/tights/stockings/black //Added stockings for the maids
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)
	if(isseelie(H))
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/strip)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/seelie_kiss)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)
