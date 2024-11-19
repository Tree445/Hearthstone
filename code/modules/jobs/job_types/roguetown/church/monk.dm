/datum/job/roguetown/monk
	title = "Monk"
	flag = MONK
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 10
	spawn_positions = 10

	allowed_races = RACES_ALL_KINDSPLUS
	allowed_patrons = ALL_DIVINE_PATRONS
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/monk
	tutorial = "Chores, some more chores- Even more chores.. Oh how the life of a humble cleric is exhausting! You have faith, but even you know you gave up a life of adventure for that of the security in the Temple. Assist the Prophets in their daily tasks, maybe today will be the day something interesting happens."

	display_order = JDO_MONK
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/monk
	name = "Priest"
	jobtype = /datum/job/roguetown/monk
	allowed_patrons = ALL_DIVINE_PATRONS

/datum/outfit/job/roguetown/monk/pre_equip(mob/living/carbon/human/H)
	H.virginity = TRUE
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/roguekey/church = 1, /obj/item/storage/fancy/skit =1,) // Doktor, HEAL me!
	switch(H.patron?.type)
		if(/datum/patron/divine/astrata)
			head = /obj/item/clothing/head/roguetown/roguehood/astrata
			neck = /obj/item/clothing/neck/roguetown/psicross/astrata
			wrists = /obj/item/clothing/wrists/roguetown/wrappings
			shoes = /obj/item/clothing/shoes/roguetown/sandals
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/astrata
		if(/datum/patron/divine/noc) //Nocalytes are real, don't let them tell you otherwise, we love casting spells. (Hearthstone edit: simply gives Noc Acolytes the love that the Noc Clerics got, access to pick spells)
			head = /obj/item/clothing/head/roguetown/roguehood/nochood
			neck = /obj/item/clothing/neck/roguetown/psicross/noc
			wrists = /obj/item/clothing/wrists/roguetown/nocwrappings
			shoes = /obj/item/clothing/shoes/roguetown/sandals
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/noc
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 1, TRUE) // shouldn't be that bad.
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
			H.mind.adjust_spellpoints(1)
			H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
		if(/datum/patron/divine/dendor) //Dendorites all busted. Play Druid.
			head = /obj/item/clothing/head/roguetown/helmet/dendorculthelm
			neck = /obj/item/clothing/neck/roguetown/psicross/dendor
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
			H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/labor/taming, 3, TRUE)
		if(/datum/patron/divine/necra) //disabled and moved unto gravedigger, but code supports it
			head = /obj/item/clothing/head/roguetown/roguehood/necracolytehood
			neck = /obj/item/clothing/neck/roguetown/psicross/necra
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/trou/leather/mourning
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/necra
		if(/datum/patron/divine/pestra) //PLEASE add leper gear later, this SUCKS dude
			head = /obj/item/clothing/head/roguetown/roguehood
			mask = /obj/item/clothing/mask/rogue/surgmask
			neck = /obj/item/clothing/neck/roguetown/psicross/pestra
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/tights/black
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
		if(/datum/patron/divine/eora) //Eora content from Stonekeep
			head = /obj/item/clothing/head/roguetown/eoramask
			neck = /obj/item/clothing/neck/roguetown/psicross/eora
			shoes = /obj/item/clothing/shoes/roguetown/sandals
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/eora
			ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
		if(/datum/patron/divine/xylix)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/xylixcagehelm
			neck = /obj/item/clothing/neck/roguetown/psicross/xylix
			shoes = /obj/item/clothing/shoes/roguetown/sandals
			pants = /obj/item/clothing/under/roguetown/loincloth
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 4, TRUE) // the eyes and ears of the Church
		if(/datum/patron/divine/malum)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/malumhelm
			neck = /obj/item/clothing/neck/roguetown/psicross/malum
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			armor =	/obj/item/clothing/suit/roguetown/armor/leathervest
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/weaponsmithing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/armorsmithing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/smelting, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/labor/mining, 5, TRUE)
		if(/datum/patron/divine/abyssor)
			head = /obj/item/clothing/head/roguetown/helmet/abyssorhat
			neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
			pants = /obj/item/clothing/under/roguetown/tights/purple
			armor =	/obj/item/clothing/suit/roguetown/shirt/robe/abyssoracorobe
			shoes = /obj/item/clothing/shoes/roguetown/boots
			H.mind.adjust_skillrank_up_to(/datum/skill/labor/fishing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
		if(/datum/patron/divine/ravox)
			head = /obj/item/clothing/head/roguetown/roguehood/flagellanthood
			neck = /obj/item/clothing/neck/roguetown/psicross/ravox
			pants = /obj/item/clothing/under/roguetown/loincloth
			shoes = shoes = /obj/item/clothing/shoes/roguetown/sandals
			shirt =	/obj/item/clothing/suit/roguetown/shirt/undershirt/ravoxrobe
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("intelligence", 4) // dedicated crafters
		H.change_stat("endurance", 3)
		H.change_stat("perception", 2)
		H.cmode_music = 'sound/music/combat_clergy.ogg'
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)

	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
