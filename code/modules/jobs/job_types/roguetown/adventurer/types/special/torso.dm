/datum/advclass/torso
	name = "Torso"
	tutorial = "Some horrible accident in the forest away all of your limbs!\nSurvival will be a true TRIUMPH."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/torso
	traits_applied = list(TRAIT_HEAVYARMOR, TRAIT_MEDIUMARMOR, TRAIT_STEELHEARTED)
	category_tags = list(CTAG_CHALLENGE)

/datum/outfit/job/roguetown/adventurer/torso/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 4 ,TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 4, TRUE)
	H.change_stat("strength", 3)
	H.change_stat("endurance", 3)
	H.change_stat("constitution", 3)
	H.change_stat("perception", 2)
	H.change_stat("speed", 2)
	pants = /obj/item/clothing/under/roguetown/tights/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/huntingknife

	var/static/list/safe_bodyzones = list(
		BODY_ZONE_HEAD,
		BODY_ZONE_CHEST,
	)
	for(var/obj/item/bodypart/limb in H.bodyparts)
		if(limb.body_zone in safe_bodyzones)
			continue
		limb.drop_limb()
		qdel(limb)
