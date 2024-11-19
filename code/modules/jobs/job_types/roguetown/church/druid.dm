/datum/job/roguetown/druid
	title = "Druid"
	f_title = "Druidess"
	flag = DRUID
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 10
	spawn_positions = 10

	allowed_sexes = list(MALE, FEMALE)
	spells = list (/obj/effect/proc_holder/spell/targeted/shapeshift,/obj/effect/proc_holder/spell/aoe_turf/conjure/Wolf,/obj/effect/proc_holder/spell/invoked/infestation5e,/obj/effect/proc_holder/spell/self/primalsavagery5e,)
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_patrons = ALL_DIVINE_PATRONS //gets set to dendor on the outfit anyways lol
	outfit = /datum/outfit/job/roguetown/druid
	tutorial = "You have always been drawn to the wild, and the wild drawn to you. When your calling came, it was from Sylvarn. Your patron claims dominion over all of nature and promises bounty to those who act in his name to bring balance to His domain. The Wilds are the most comfortable place for you, toiling alongside soilsons and soilbrides although sometimes what lies beyond the gates fills your soul with a feral yearning."

	display_order = JDO_DRUID
	give_bank_account = FALSE
	min_pq = 10
	max_pq = null

/datum/outfit/job/roguetown/druid
	name = "Druid"
	jobtype = /datum/job/roguetown/druid
	allowed_patrons = list(/datum/patron/divine/dendor)

/datum/outfit/job/roguetown/druid/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/forestershoes
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/rogueweapon/sickle
	beltr = /obj/item/flashlight/flare/torch/lantern
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/woodstaff/wise
	head = /obj/item/clothing/head/roguetown/helmet/foresterhelmet
	neck = /obj/item/clothing/neck/roguetown/psicross/dendor
	gloves = /obj/item/clothing/gloves/roguetown/forestergauntlets
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
	cloak = /obj/item/clothing/cloak/raincloak/green
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	backpack_contents = list(
		/obj/item/seeds/wheat = 1,
		/obj/item/seeds/apple = 1,
		/obj/item/seeds/shroom = 1,
		/obj/item/seeds/sweetleaf = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/majorhealthpot = 1,
	)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/druidic, 4, TRUE) //Allows you to craft briarmasks. Otherwise this does nothing, but maybe one day it will.
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)//wildman can ungah bungah better now
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/druidic, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)
		H.change_stat("intelligence", 4)
		H.change_stat("endurance", 2)
		H.change_stat("perception", 2)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
	if(isseelie(H))
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/conjure_vines)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/seelie_kiss)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)

	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
