/datum/advclass/bladesinger
	name = "Spelldancer"
	tutorial = "An elven warrior who was taught in the Arts of Spellweaving in agile combat. You wield a dagger and sword; weaving seamlessly between the woods and the wyrds.."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/elf/dark,
		/datum/species/elf/wood,
	)
	maximum_possible_slots = 2
	traits_applied = list(TRAIT_MEDIUMARMOR)
	category_tags = list(CTAG_ADVENTURER)

	outfit = /datum/outfit/job/roguetown/adventurer/bladesinger

/datum/outfit/job/roguetown/adventurer/bladesinger/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	backr = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather
	backpack_contents = list(/obj/item/flashlight/flare/torch/metal = 1, /obj/item/rogueweapon/huntingknife/idagger)
	gloves = /obj/item/clothing/gloves/roguetown/leather
	cloak = /obj/item/clothing/cloak/raincloak/red
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	shoes = /obj/item/clothing/shoes/roguetown/boots
	beltr = /obj/item/rogueweapon/huntingknife/idagger/steel/parrying
	beltl = /obj/item/rogueweapon/sword/silver/sabre/elf
	head = /obj/item/clothing/head/roguetown/helmet/leather
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/butchering, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 1, TRUE)
		H.mind.adjust_spellpoints(4)
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("intelligence", 3)
		H.change_stat("endurance", -1)
		H.change_stat("speed", 3)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/ethereal_jaunt)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/boomingblade5e)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/greenflameblade5e)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/rogue_vanish)
	H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)
