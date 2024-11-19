/datum/job/roguetown/alchemist
	title = "Alchemist"
	flag = ALCHEMIST
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0

	allowed_races = RACES_ALL_KINDSPLUS

	tutorial = "You came to stonehedge after hearing that there is a lack of potion-makers outside of the nobility. Stir up potions with your alchemy expertise, of health or death."

	outfit = /datum/outfit/job/roguetown/alchemist
	display_order = 6
	give_bank_account = 25
	min_pq = 5
	max_pq = null

/datum/outfit/job/roguetown/alchemist
	name = "Alchemist"
	jobtype = /datum/job/roguetown/alchemist

/datum/outfit/job/roguetown/alchemist/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, pick(5,6), TRUE)
		else
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 5, TRUE)
//Requires a lot of sprites, so this is just a placeholder
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
		cloak = /obj/item/clothing/cloak/apron/brown
		backl = /obj/item/storage/backpack/rogue/backpack
		backpack_contents = list(
		/obj/item/reagent_containers/glass/alembic = 1,
		/obj/item/storage/fancy/ifak = 1,
		/obj/item/clothing/ring/lantern = 1,
		/obj/item/storage/box/matches = 1,
		)
		H.change_stat("intelligence", 3)
		H.change_stat("speed", -1)
	else
		pants = /obj/item/clothing/under/roguetown/trou
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
		cloak = /obj/item/clothing/cloak/apron/brown
		backl = /obj/item/storage/backpack/rogue/backpack
		backpack_contents = list(
		/obj/item/reagent_containers/glass/alembic = 1,
		/obj/item/storage/fancy/ifak = 1,
		/obj/item/clothing/ring/lantern = 1,
		/obj/item/storage/box/matches = 1,
		)
		H.change_stat("intelligence", 3) // bob I like your code work but you are a sexist prick and I hate wiping your ass of this lil subtle stab shit.
		H.change_stat("speed", -1)
