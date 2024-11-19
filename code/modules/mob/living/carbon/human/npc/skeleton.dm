/mob/living/carbon/human/species/skeleton
	name = "skeleton"

	race = /datum/species/human/northern
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	faction = list("undead")
	var/skel_outfit = /datum/outfit/job/roguetown/npc/skeleton
	var/skel_fragile = FALSE
	ambushable = FALSE
	rot_type = null
	possible_rmb_intents = list()
	cmode_music = 'sound/music/combat_weird.ogg'

/mob/living/carbon/human/species/skeleton/npc
	aggressive = 1
	mode = AI_IDLE
	wander = FALSE
	skel_fragile = TRUE

/mob/living/carbon/human/species/skeleton/npc/ambush
	wander = TRUE

/mob/living/carbon/human/species/skeleton/npc/dungeon/ambush
	wander = TRUE

/mob/living/carbon/human/species/skeleton/Initialize()
	. = ..()
	cut_overlays()
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 10)

/mob/living/carbon/human/species/skeleton/after_creation()
	..()
	if(src.dna && src.dna.species)
		src.dna.species.species_traits |= NOBLOOD
		src.dna.species.soundpack_m = new /datum/voicepack/skeleton()
		src.dna.species.soundpack_f = new /datum/voicepack/skeleton()
	var/obj/item/bodypart/O = src.get_bodypart(BODY_ZONE_R_ARM)
	if(O)
		O.drop_limb()
		qdel(O)
	O = src.get_bodypart(BODY_ZONE_L_ARM)
	if(O)
		O.drop_limb()
		qdel(O)
	src.regenerate_limb(BODY_ZONE_R_ARM)
	src.regenerate_limb(BODY_ZONE_L_ARM)
	// src.remove_all_languages()
	// uncomment this to prohibit skeletons from knowing or speaking any languages. This is commented to allow skeletons to be the main subject of admin events. (eg: skeleton traders, skeletons concealing their bones and blending in with the kingdom society, the underworld bar skeletons, skeletons telling skeleton jokes)
	if(src.charflaw)
		QDEL_NULL(src.charflaw)
	mob_biotypes |= MOB_UNDEAD
	faction = list("undead")
	name = "Skeleton"
	real_name = "Skeleton"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_EASYDISMEMBER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_SHOCKIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_LIMBATTACHMENT, TRAIT_GENERIC)
	if(skel_fragile)
		ADD_TRAIT(src, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	var/obj/item/organ/eyes/eyes = src.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(src,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/zombie
	eyes.Insert(src)

	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	for(var/obj/item/bodypart/B in src.bodyparts)
		B.skeletonize(FALSE)
	update_body()
	if(skel_outfit)
		var/datum/outfit/OU = new skel_outfit
		if(OU)
			equipOutfit(OU)

/datum/outfit/job/roguetown/npc/skeleton/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(90))
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	if(prob(80))
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	if(prob(30))
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	if(prob(30))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
		if(prob(50))
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l
	if(prob(90))
		pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	if(prob(40))
		head = /obj/item/clothing/head/roguetown/helmet/leather
	if(prob(70))
		gloves = /obj/item/clothing/gloves/roguetown/chain
	if(prob(70))
		neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(H.gender == FEMALE)
		H.STASTR = rand(9,12)
	else
		H.STASTR = rand(14,16)
	H.STASPD = 8
	H.STACON = 4
	H.STAEND = 15
	H.STAINT = 1
	if(prob(50))
		r_hand = /obj/item/rogueweapon/sword
	else
		r_hand = /obj/item/rogueweapon/mace

/datum/outfit/job/roguetown/npc/skeleton/dungeon/pre_equip(mob/living/carbon/human/H)
	..()
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	else
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	pants = /obj/item/clothing/under/roguetown/chainlegs
	head = /obj/item/clothing/head/roguetown/helmet/skullcap
	neck = /obj/item/clothing/neck/roguetown/coif
	belt = /obj/item/storage/belt/rogue/leather/hand
	if(prob(30))
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	if(H.gender == FEMALE)
		H.STASTR = rand(10,13)
	else
		H.STASTR = rand(15,17)
	H.STASPD = 11
	H.STACON = 8
	H.STAEND = 17
	H.STAINT = 1
	if(prob(50))
		r_hand = /obj/item/rogueweapon/spear
	else
		r_hand = /obj/item/rogueweapon/sword
		l_hand = /obj/item/rogueweapon/shield/tower

/datum/outfit/job/roguetown/npc/skeleton/dungeon/boss/pre_equip(mob/living/carbon/human/H)
	..()
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	gloves = /obj/item/clothing/gloves/roguetown/plate
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	pants = /obj/item/clothing/under/roguetown/platelegs
	neck = /obj/item/clothing/neck/roguetown/bervor
	head = /obj/item/clothing/head/roguetown/helmet/heavy/knight
	belt = /obj/item/storage/belt/rogue/leather/hand
	beltl = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	if(H.gender == FEMALE)
		H.STASTR = rand(18,20)
	else
		H.STASTR = 20
	H.STASPD = 10
	H.STACON = 20
	H.STAEND = 20
	H.STAINT = 1

	//light labor skills for skeleton manual labor and some warrior-adventurer skills, equipment is still bad probably
	if(H.mind) //npcs dont have a mind.
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)

		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)

	H.set_patron(/datum/patron/inhumen/zizo)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	H.possible_rmb_intents = list(/datum/rmb_intent/feint,\
	/datum/rmb_intent/aimed,\
	/datum/rmb_intent/strong,\
	/datum/rmb_intent/swift,\
	/datum/rmb_intent/riposte,\
	/datum/rmb_intent/weak)
	H.swap_rmb_intent(num=1) //dont want to mess with base NPCs too much out of fear of breaking them so I assigned the intents in the outfit

	if(prob(50))
		r_hand = /obj/item/rogueweapon/eaglebeak/lucerne
		l_hand = null
	else
		r_hand = /obj/item/rogueweapon/greatsword/zwei
		l_hand = null

/mob/living/carbon/human/species/skeleton/npc/no_equipment
    skel_outfit = null

/mob/living/carbon/human/species/skeleton/no_equipment
    skel_outfit = null

/mob/living/carbon/human/species/skeleton/npc/dungeon
	skel_outfit = /datum/outfit/job/roguetown/npc/skeleton/dungeon

/mob/living/carbon/human/species/skeleton/npc/dungeon/boss
	skel_outfit = /datum/outfit/job/roguetown/npc/skeleton/dungeon/boss

/mob/living/carbon/human/species/skeleton/dwarf
	name = "skeleton"
	race = /datum/species/dwarf/mountain
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	faction = list("undead")
	skel_outfit = /datum/outfit/job/roguetown/npc/skeleton
	ambushable = FALSE
	rot_type = null
	possible_rmb_intents = list()


/mob/living/carbon/human/species/skeleton/dwarf/npc
	aggressive = 1
	mode = AI_IDLE
	wander = FALSE

/mob/living/carbon/human/species/skeleton/dwarf/npc/ambush
	wander = TRUE

/mob/living/carbon/human/species/skeleton/dwarf/npc/dungeon
	skel_outfit = /datum/outfit/job/roguetown/npc/skeleton/dungeon
