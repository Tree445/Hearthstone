/datum/job/roguetown/steward
	title = "Guild Appraiser"
	flag = STEWARD
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_ALL_KINDSPLUS
	allowed_sexes = list(MALE, FEMALE)
	display_order = JDO_STEWARD
	tutorial = "Coin, Coin, Coin! Oh beautiful coin: The Magi's Trading Union put you here as an appraiser so you might -actually- fund this operation. You're the closest thing this place has to a banker that works with the Guild Captain and these adventurers-- and it's up to you to fund public projects from the hordes of wealth these ludicrous murder-hobos seem to pull in from literally thin air. You work for the Guild captain, but most of the time youre batting off adventurers from raiding your vault which contains the Neuromancer and some fascinating treasure. Don't forget the magic password you enchanted the wall with, either.."
	outfit = /datum/outfit/job/roguetown/steward
	give_bank_account = 17
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/steward/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		H.virginity = TRUE
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/green
		cloak = /obj/item/clothing/cloak/tabard/knight
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random	//Added Silk Stockings for the female nobles
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
		pants = /obj/item/clothing/under/roguetown/tights/random
		armor = /obj/item/clothing/cloak/tabard/knight
	ADD_TRAIT(H, TRAIT_SEEPRICES, type)
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	head = /obj/item/clothing/head/roguetown/chaperon/greyscale
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltr = /obj/item/storage/keyring/steward
	beltl = /obj/item/storage/keyring/merchant
	backl = /obj/item/storage/backpack/rogue/satchel

	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.change_stat("intelligence", 2)
		H.change_stat("perception", 2)
		H.change_stat("speed", -1)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	if(isseelie(H))
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/strip)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/seelie_kiss)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)
