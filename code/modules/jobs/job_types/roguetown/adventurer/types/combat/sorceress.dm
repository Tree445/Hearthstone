/datum/advclass/sorceress
	name = "Witch"
	tutorial = "In some places, women are banned from the study of magic. Those that do even then are afforded the title Sorceress in honor of their resolve."
	allowed_sexes = list(FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/sorceress
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	category_tags = list(CTAG_DISABLED)

/datum/outfit/job/roguetown/adventurer/sorceress
	allowed_patrons = list(/datum/patron/divine/noc)

/datum/outfit/job/roguetown/adventurer/sorceress/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	pants = /obj/item/clothing/under/roguetown/trou/leather
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	beltl = /obj/item/rogueweapon/huntingknife
	neck = /obj/item/clothing/neck/roguetown/psicross/eora
	r_hand = /obj/item/rogueweapon/woodstaff
	backpack_contents = list(/obj/item/scrying =1, /obj/item/rogueweapon/huntingknife/idagger/steel =1, /obj/item/toy/cards/deck/tarot =1, /obj/item/slimepotion/lovepotion =1,)

	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/butchering, 1, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, pick(2,3,3), TRUE)
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 4)
		H.change_stat("speed", 1)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fireball)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcewall)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/invisibility)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/eoracurse)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/enrapture)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/repulse)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)

