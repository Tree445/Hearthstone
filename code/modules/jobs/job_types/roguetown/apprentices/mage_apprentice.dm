/datum/job/roguetown/wapprentice
	title = "Magicians Apprentice"
	flag = MAGEAPPRENTICE
	department_flag = APPRENTICES
	faction = "Station"
	total_positions = 10
	spawn_positions = 10

	allowed_races = RACES_ALL_KINDSPLUS
	allowed_ages = list(AGE_ADULT)

	tutorial = "Your Teacher still see's much potential in you, something you are uncertain they always do with your recent studies. The path to using magic is something treacherous and untamed, and you are still decades away from calling yourself even a journeyman in the field. Listen and serve, and someday you will earn your hat."

	spells = list(/obj/effect/proc_holder/spell/invoked/projectile/fetch, /obj/effect/proc_holder/spell/invoked/projectile/spitfire, /obj/effect/proc_holder/spell/targeted/forcewall, /obj/effect/proc_holder/spell/targeted/touch/prestidigitation, /obj/effect/proc_holder/spell/aoe_turf/conjure/Wolf)
	outfit = /datum/outfit/job/roguetown/wapprentice

	display_order = JDO_MAGEAPPRENTICE
	give_bank_account = TRUE

	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/wapprentice/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	pants = /obj/item/clothing/under/roguetown/tights/random
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/storage/keyring/mage
	r_hand = /obj/item/rogueweapon/woodstaff
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_spellpoints(3)
	if(H.gender == MALE)
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		armor = /obj/item/clothing/suit/roguetown/armor/workervest
		backr = /obj/item/storage/backpack/rogue/satchel
	else
		pants = /obj/item/clothing/under/roguetown/tights/random
		shoes = /obj/item/clothing/shoes/roguetown/sandals
		armor = /obj/item/clothing/suit/roguetown/armor/workervest
		backr = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fireball)
	H.change_stat("intelligence", 2)
	H.change_stat("speed", -1)
	if(isseelie(H))
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/strip)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/seelie_kiss)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)

	H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)
