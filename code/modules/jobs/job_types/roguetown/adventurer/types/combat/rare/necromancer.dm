/datum/advclass/necromancer
	name = "Necromancer"
	tutorial = "Ostracized and hunted by society for their mastery over death magicks in most realms; Necromancers have been known to summon ghosts, ghouls, and zombies; A rare few using their powers to fight undeath from a different side."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/necromancer
	traits_applied = list(TRAIT_ZOMBIE_IMMUNE)
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/necromancer
	allowed_patrons = list(/datum/patron/inhumen/zizo,/datum/patron/divine/necra,/datum/patron/divine/pestra)

/datum/outfit/job/roguetown/adventurer/necromancer/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_spellpoints(3)
	head = /obj/item/clothing/head/roguetown/necromhood
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/necromancer
	belt = /obj/item/storage/belt/rogue/leather/rope
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	beltl = /obj/item/rogueweapon/huntingknife
	r_hand = /obj/item/rogueweapon/woodstaff
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE) //sussy autopsy things probably
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/magic/blood, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
	H.change_stat("intelligence", 3)
	H.change_stat("speed", 1)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/strengthen_undead)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/chilltouch5e)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_undead)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/bloodlightning)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lifesteal)
	H.faction |= "undead"
