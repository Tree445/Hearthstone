/datum/job/roguetown/puritan
	title = "Inquisitor"
	flag = PURITAN
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = list(
		/datum/patron/old_god,
		/datum/patron/divine/astrata,
		/datum/patron/divine/noc,
		/datum/patron/divine/dendor,
		/datum/patron/divine/abyssor,
		/datum/patron/divine/ravox,
		/datum/patron/divine/necra,
		/datum/patron/divine/xylix,
		/datum/patron/divine/pestra,
		/datum/patron/divine/malum,
	) //gets set to old god anyways
	tutorial = "You are an Inquisitor, a true puritan. Entrusted with the knowledge of old and ancient ways, you have been sent to the Isle of Enigma to cleanse and remove heretics by the dozen. You are barely tolerated by the Church and might even see them as enemies but remember, evil lurks in the darkest of corners from the nobility all the way to the Terrorbog."
	whitelist_req = TRUE

	outfit = /datum/outfit/job/roguetown/puritan
	display_order = JDO_PURITAN
	give_bank_account = 36
	min_pq = 1
	max_pq = null

/datum/job/roguetown/puritan/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(!L.mind)
		return
	if(L.mind.has_antag_datum(/datum/antagonist))
		return
	var/datum/antagonist/new_antag = new /datum/antagonist/purishep()
	L.mind.add_antag_datum(new_antag)

/datum/outfit/job/roguetown/puritan
	name = "Inquisitor"
	jobtype = /datum/job/roguetown/puritan
	allowed_patrons = list(/datum/patron/old_god)

/datum/outfit/job/roguetown/puritan/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/clothing/neck/roguetown/psicross/silver
	shoes = /obj/item/clothing/shoes/roguetown/boots
	pants = /obj/item/clothing/under/roguetown/tights/black
	cloak = /obj/item/clothing/cloak/cape/puritan
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/black
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	backpack_contents = list(/obj/item/storage/keyring/puritan = 1, /obj/item/rogueweapon/huntingknife/idagger/silver = 1, /obj/item/storage/belt/rogue/pouch/coins/rich)
	beltr =  /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	head = /obj/item/clothing/head/roguetown/puritan
	gloves = /obj/item/clothing/gloves/roguetown/leather
	beltl = /obj/item/quiver/bolts
	beltr = /obj/item/rogueweapon/sword/rapier
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 5, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 3)
		H.change_stat("constitution", 3)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 2)
	H.verbs |= /mob/living/carbon/human/proc/faith_test
	H.verbs |= /mob/living/carbon/human/proc/torture_victim
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.cmode_music = 'sound/music/combat_clergy.ogg'

/mob/living/carbon/human/proc/torture_victim()
	set name = "Extract Confession"
	set category = "Inquisition"

	var/obj/item/grabbing/I = get_active_held_item()
	var/mob/living/carbon/human/H
	if(!istype(I) || !ishuman(I.grabbed))
		return
	H = I.grabbed
	if(H == src)
		to_chat(src, span_warning("I already torture myself."))
		return
	var/painpercent = (H.get_complex_pain() / (H.STAEND * 10)) * 100
	if(H.add_stress(/datum/stressevent/tortured))
		if(!H.stat)
			var/static/list/torture_lines = list(
				"CONFESS!",
				"TELL ME YOUR SECRETS!",
				"SPEAK!",
				"YOU WILL SPEAK!",
				"TELL ME!",
				"THE PAIN HAS ONLY BEGUN, CONFESS!",
			)
			say(pick(torture_lines), spans = list("torture"))
			if(painpercent >= 100)
				H.emote("painscream")
				H.confession_time("antag")
				return
	to_chat(src, span_warning("Not ready to speak yet."))

/mob/living/carbon/human/proc/faith_test()
	set name = "Test Faith"
	set category = "Inquisition"

	var/obj/item/grabbing/I = get_active_held_item()
	var/mob/living/carbon/human/H
	if(!istype(I) || !ishuman(I.grabbed))
		return
	H = I.grabbed
	if(H == src)
		to_chat(src, span_warning("I already torture myself."))
		return
	var/painpercent = (H.get_complex_pain() / (H.STAEND * 10)) * 100
	if(H.add_stress(/datum/stressevent/tortured))
		if(!H.stat)
			var/static/list/faith_lines = list(
				"DO YOU DENY THE TEN?",
				"WHO IS YOUR GOD?",
				"ARE YOU FAITHFUL?",
				"WHO IS YOUR SHEPHERD?",
			)
			say(pick(faith_lines), spans = list("torture"))
			if(painpercent >= 100)
				H.emote("painscream")
				H.confession_time("patron")
				return
	to_chat(src, span_warning("Not ready to speak yet."))

/mob/living/carbon/human/proc/confession_time(confession_type = "antag")
	var/timerid = addtimer(CALLBACK(src, PROC_REF(confess_sins)), 6 SECONDS, TIMER_STOPPABLE)
	var/responsey = alert(src, "Resist torture? (1 TRI)", "TORTURE", "Yes","No")
	if(!responsey)
		responsey = "No"
	if(SStimer.timer_id_dict[timerid])
		deltimer(timerid)
	else
		to_chat(src, span_warning("Too late..."))
		return
	if(responsey == "Yes")
		adjust_triumphs(-1)
		confess_sins(confession_type, resist = TRUE)
	else
		confess_sins(confession_type)

/mob/living/carbon/human/proc/confess_sins(confession_type = "antag", resist)
	var/static/list/innocent_lines = list(
		"I DON'T KNOW!",
		"STOP THE PAIN!!",
		"I DON'T DESERVE THIS!",
		"THE PAIN!",
		"I HAVE NOTHING TO SAY...!",
		"WHY ME?!",
	)
	if(!resist)
		var/list/confessions = list()
		switch(confession_type)
			if("patron")
				if(length(patron?.confess_lines))
					confessions += patron.confess_lines
			if("antag")
				for(var/datum/antagonist/antag in mind?.antag_datums)
					if(!length(antag.confess_lines))
						continue
					confessions += antag.confess_lines
		if(length(confessions))
			say(pick(confessions), spans = list("torture"))
			return
	say(pick(innocent_lines), spans = list("torture"))
