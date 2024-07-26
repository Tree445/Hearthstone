/datum/job/roguetown/manorguard
	title = "Royal Guard"
	flag = MANATARMS
	department_flag = GARRISON
	faction = "Station"
	total_positions = 3
	spawn_positions = 3

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = "Having proven yourself loyal and capable, you have been knighted to serve the realm as the monarch's personal guard. You listen to your Lord and the Captain of the Guard, defending your Lord and realm."
	display_order = JDO_CASTLEGUARD
	whitelist_req = TRUE

	outfit = /datum/outfit/job/roguetown/manorguard
	give_bank_account = 22
	min_pq = 3
	max_pq = null

	cmode_music = 'sound/music/combat_guard2.ogg'

/datum/job/roguetown/manorguard/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/surcoat/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "knight's tabard ([index])"
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Sir"
		if(H.gender == FEMALE)
			honorary = "Dame"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"

/datum/outfit/job/roguetown/manorguard/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/bascinet
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	gloves = /obj/item/clothing/gloves/roguetown/chain
	neck = /obj/item/clothing/neck/roguetown/gorget
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	beltl = /obj/item/keyring/guardcastle
	belt = /obj/item/storage/belt/rogue/leather/black
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/signal_horn = 1)

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Heavy-knight","Foot-knight")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Heavy-knight")		//Specializes in maces and polearms w/ some extra strength but lower speed
			H.set_blindness(0)
			to_chat(H, span_warning("While other knights may specialize in horse riding and swords, you specialize in two-handed weapons and maces. People may fear the mounted knights, but they should truly fear those who come off their mount.."))
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
			H.change_stat("strength", 4)
			H.change_stat("constitution", 3)
			H.change_stat("endurance", 3)
			H.change_stat("speed", -2)		//Lower speed for more strength and con of other knight, and to off-set endurance. (They need the end-stam for 2 handed.)
			// Decorative helberd, 2-handed
			if(prob(33))
				backl = /obj/item/rogueweapon/halberd/bardiche
			// Great-mace, 2-handed (worse than normal steel but better than iron)
			else if(prob(33))
				backl = /obj/item/rogueweapon/mace/goden/steel
			// Iron mace + tower shield
			else
				beltr = /obj/item/rogueweapon/mace
				backl = /obj/item/rogueweapon/shield/tower

		if("Foot-knight")		//Specializes in swords and whip/flails, slight bonus in shield plus riding skill.
			H.set_blindness(0)
			to_chat(H, span_warning("You are acustomed to traditional knight training, swords, shields, and mounts. You are swifter than some other knights and you know it; it's time to make use of it.."))
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)		//Mildly better shield skill due to less weapon options.
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)			//Mounted knight due to 1-handed weapons specialty.
			H.change_stat("strength", 3)
			H.change_stat("intelligence", 1)
			H.change_stat("perception", 1)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2)
			// Flail + tower shield
			if(prob (33))
				beltr = /obj/item/rogueweapon/halberd/bardiche
				backl = /obj/item/rogueweapon/shield/tower
			// Regular sword + tower shield
			else if(prob (33))
				beltr = /obj/item/rogueweapon/sword
				backl = /obj/item/rogueweapon/shield/tower
			// Bastard sword (traditional knight loadout; can be 1-handed but far better 2-handed. Higher stam drain.)
			else
				backl = /obj/item/rogueweapon/sword/long

	//Shared skills
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, pick(1,2,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, pick(2,3,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(2,2,3), TRUE)

	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()		//For knightly voices; even though I despise them.
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)		//Knights are /technically/ nobles? But they are of the lower-tiers; mainly that a non-blue-blood could become a knight.

