
/datum/advclass/puritan
	name = "Wytcher"
	tutorial = "Wytchers hunt the various supernatural threats to the World of Astralith; and it's denizens who are supernaturally dangerous. They find frequent work in Stone Hedge, given it's closeness to magickal phenomena."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/puritan
	maximum_possible_slots = 2
	traits_applied = list(TRAIT_MEDIUMARMOR, TRAIT_PERFECT_TRACKER)
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/puritan
	allowed_patrons = list(/datum/patron/old_god)

/datum/outfit/job/roguetown/adventurer/puritan/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/clothing/neck/roguetown/psicross/silver
	shoes = /obj/item/clothing/shoes/roguetown/boots
	pants = /obj/item/clothing/under/roguetown/tights/black
	cloak = /obj/item/clothing/cloak/cape/puritan
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	head = /obj/item/clothing/head/roguetown/puritan
	gloves = /obj/item/clothing/gloves/roguetown/leather
	beltr = /obj/item/rogueweapon/sword/rapier
	beltl = /obj/item/rogueweapon/huntingknife/idagger/silver
	backl = /obj/item/rogueweapon/sword/long

	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/butchering, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 4, TRUE) //Hearthstone change.
		H.change_stat("intelligence", 1)
		H.change_stat("strength", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
		H.change_stat("constitution", 1)
		H.change_stat("perception", 2)
	H.verbs |= /mob/living/carbon/human/proc/torture_victim
	H.verbs |= /mob/living/carbon/human/proc/faith_test
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
