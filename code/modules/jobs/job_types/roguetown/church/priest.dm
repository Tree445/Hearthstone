/datum/job/roguetown/priest
	title = "Prophet"
	flag = PRIEST
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	selection_color = JCOLOR_CHURCH
	f_title = "Prophetess"
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_patrons = ALL_DIVINE_PATRONS
	allowed_sexes = list(MALE, FEMALE)
	tutorial = "The Divine is all that matters in a world made in their many images. You are a Prophet of the divinity you have chosen. Maintaining the temple is your primary duty - so that they may find their own divine in time."
	whitelist_req = FALSE

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/templar, /obj/effect/proc_holder/spell/self/convertrole/monk)
	outfit = /datum/outfit/job/roguetown/priest

	display_order = JDO_PRIEST
	give_bank_account = 115
	min_pq = 5
	max_pq = null

/datum/outfit/job/roguetown/priest
	allowed_patrons = ALL_DIVINE_PATRONS

/datum/outfit/job/roguetown/priest/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	neck = /obj/item/clothing/neck/roguetown/psicross/silver
	head = /obj/item/clothing/head/roguetown/priestmask
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	id = /obj/item/clothing/ring/active/nomag
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/priest
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/needle/pestra = 1,
		/obj/item/natural/worms/leech/cheele = 1, //little buddy
		/obj/item/storage/keyring/priest = 1,
	)
	ADD_TRAIT(H, TRAIT_CHOSEN, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 5, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 4)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", -1)
		H.cmode_music = 'sound/music/combat_clergy.ogg'
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/guidance5e)
	var/datum/devotion/C = new /datum/devotion(H, H.patron) // This creates the cleric holder used for devotion spells
	C.grant_spells_priest(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

	H.verbs |= /mob/living/carbon/human/proc/coronate_lord
	H.verbs |= /mob/living/carbon/human/proc/churchexcommunicate
	H.verbs |= /mob/living/carbon/human/proc/churchannouncement
//	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

/mob/living/carbon/human/proc/coronate_lord()
	set name = "Coronate"
	set category = "Prophet"
	if(!mind)
		return
	if(!istype(get_area(src), /area/rogue/indoors/town/church/chapel))
		to_chat(src, span_warning("I need to do this in a temple.. if we even have one."))
		return FALSE
	for(var/mob/living/carbon/human/HU in get_step(src, src.dir))
		if(!HU.mind)
			continue
		if(HU.mind.assigned_role == "Monarch")
			continue
		if(!HU.head)
			continue
		if(!istype(HU.head, /obj/item/clothing/head/roguetown/crown/serpcrown))
			continue

		//Abdicate previous King
		for(var/mob/living/carbon/human/HL in GLOB.human_list)
			if(HL.mind)
				if(HL.mind.assigned_role == "Monarch" || HL.mind.assigned_role == "Consort")
					HL.mind.assigned_role = "Towner" //So they don't get the innate traits of the king
			//would be better to change their title directly, but that's not possible since the title comes from the job datum
			if(HL.job == "Monarch")
				HL.job = "King Emeritus"
			if(HL.job == "Consort")
				HL.job = "Queen Dowager"
			SSjob.type_occupations[/datum/job/roguetown/lord].remove_spells(HL)

		//Coronate new King (or Queen)
		HU.mind.assigned_role = "Monarch"
		HU.job = "Monarch"
		SSjob.type_occupations[/datum/job/roguetown/lord].add_spells(HU)

		switch(HU.gender)
			if("male")
				SSticker.rulertype = "Monarch"
			if("female")
				SSticker.rulertype = "Queen"
		SSticker.rulermob = HU
		var/dispjob = mind.assigned_role
		removeomen(OMEN_NOLORD)
		say("By the authority of the gods, I pronounce you Ruler of all Stone Hedge!")
		priority_announce("[real_name] the [dispjob] has named [HU.real_name] the inheritor of STONEHEDGE!", title = "Long Live [HU.real_name]!", sound = 'sound/misc/bell.ogg')

/mob/living/carbon/human/proc/churchexcommunicate()
	set name = "Curse"
	set category = "Prophet"
	if(stat)
		return
	var/inputty = input("Curse someone... (curse them again to remove it)", "Sinner Name") as text|null
	if(inputty)
		if(!istype(get_area(src), /area/rogue/indoors/town/church/chapel))
			to_chat(src, span_warning("I need to do this from the chapel."))
			return FALSE
		if(inputty in GLOB.excommunicated_players)
			GLOB.excommunicated_players -= inputty
			priority_announce("[real_name] has forgiven [inputty]. Once more walk in the divine!", title = "Hail the Gods!", sound = 'sound/misc/bell.ogg')
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				if(H.real_name == inputty)
					H.remove_stress(/datum/stressevent/psycurse)
			return
		var/found = FALSE
		for(var/mob/living/carbon/human/H in GLOB.player_list)
			if(H == src)
				continue
			if(H.real_name == inputty)
				found = TRUE
				H.add_stress(/datum/stressevent/psycurse)
		if(!found)
			return FALSE
		GLOB.excommunicated_players += inputty
		priority_announce("[real_name] has put a curse of woe on [inputty] for offending the faith! They are to be denied healing and ought to be presented before the divine for penance!", title = "SHAME", sound = 'sound/misc/excomm.ogg')

/mob/living/carbon/human
	COOLDOWN_DECLARE(church_announcement)

/mob/living/carbon/human/proc/churchannouncement()
	set name = "Announcement"
	set category = "Prophet"

	if(!COOLDOWN_FINISHED(src, church_announcement))
		to_chat(src, span_warning("I should wait..."))
		return

	if(stat)
		return FALSE

	var/inputty = input("Make an announcement", "STONEHEDGE") as text|null
	if(!inputty)
		return FALSE

	if(!istype(get_area(src), /area/rogue/indoors/town/church/chapel))
		to_chat(src, span_warning("I need to do this from the Temple or shrine, if I know where those are..."))
		return FALSE

	priority_announce("[inputty]", title = "The Prophet Speaks", sound = 'sound/misc/bell.ogg')
	COOLDOWN_START(src, church_announcement, 30 SECONDS)

/obj/effect/proc_holder/spell/self/convertrole/templar
	name = "Recruit Templar"
	new_role = "Templar"
	recruitment_faction = "Templars"
	recruitment_message = "Serve the ten, %RECRUIT!"
	accept_message = "FOR THE TEN!"
	refuse_message = "I refuse."

/obj/effect/proc_holder/spell/self/convertrole/monk
	name = "Recruit Acolyte"
	new_role = "Priest"
	recruitment_faction = "Church"
	recruitment_message = "Serve the divine, %RECRUIT!"
	accept_message = "FOR THE DIVINE!"
	refuse_message = "I refuse."
