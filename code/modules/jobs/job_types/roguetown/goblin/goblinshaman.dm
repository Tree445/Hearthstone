/datum/job/roguetown/goblinshaman
	title = "Tribal Shaman"
	flag = GOBLINSHAMAN
	department_flag = GOBLIN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = "A tribal druidic shaman that works with shaman magic to heal the wounded and bring the dead back. They also take care of the farming on the side."
	display_order = JDO_GOBLINSHAMAN
	outfit = /datum/outfit/job/roguetown/goblinshaman
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/goblinshaman
	name = "Tribal Shaman"
	jobtype = /datum/job/roguetown/goblinshaman
	allowed_patrons = list(/datum/patron/divine/dendor)

/datum/outfit/job/roguetown/goblinshaman/pre_equip(mob/living/carbon/human/H)
	. = ..()
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel
	face = /obj/item/clothing/mask/rogue/facemask
	neck = /obj/item/clothing/neck/roguetown/psicross/dendor
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
	r_hand = /obj/item/rogueweapon/woodstaff
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/druidic, 2, TRUE) //This does nothing, but maybe one day it will.
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/druidic, 1, TRUE)
		H.change_stat("intelligence", 2)
		H.change_stat("endurance", 1)
		H.change_stat("perception", -1)

	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	H.mind.AddSpell(/obj/effect/proc_holder/spell/invoked/lesser_heal)
	H.mind.AddSpell(/obj/effect/proc_holder/spell/invoked/revive)
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
