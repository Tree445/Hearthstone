/datum/job/roguetown/vampire/vampthrall
	title = "Underdark Peasant"
	flag = VAMPTHRALL
	department_flag = VAMPIRE
	faction = "Station"
	total_positions = 10
	spawn_positions = 10
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	show_in_credits = FALSE		//Stops Scom from announcing their arrival.
	spells = list(/obj/effect/proc_holder/spell/invoked/diagnose/secular, /obj/effect/proc_holder/spell/self/convertrole/vampire,
	/obj/effect/proc_holder/spell/targeted/shapeshift/bat)
	tutorial = "You are one of the fallen, sired by the lord of the underkeep. You are a vampire thrall; and you find yourself within the undercity as one of it's subjects."
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/vampthrall
	/* advclass_cat_rolls = list(CTAG_ADVENTURER = 20)
	PQ_boost_divider = 10 */ //Tried to give them adventure roles, but this doesn't work.

	display_order = JDO_VAMPTHRALL
	min_pq = 4
	max_pq = null
	cmode_music = 'sound/music/combat_vamp.ogg'

/datum/outfit/job/roguetown/vampthrall/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	cloak = /obj/item/clothing/cloak/raincloak/brown
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/storage/backpack/rogue/backpack/surgery
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	armor = /obj/item/clothing/suit/roguetown/armor/workervest
	beltr = /obj/item/flint
	beltl = /obj/item/rogueweapon/huntingknife
	ADD_TRAIT(H, TRAIT_FAITHLESS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STRONGBITE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_VAMPMANSION, TRAIT_GENERIC)
	H.change_stat("strength", 1)
	H.change_stat("speed", 2)
	H.change_stat("intelligence", 2)
	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(H,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/zombie
	eyes.Insert(H)
//	H.verbs |= /mob/living/carbon/human/proc/vampire_telepathy (APPLE EDIT:I think this just enables you to hear vampires, though doesnt let you use it yourself)  */
/*	if(world.time % 5)
		if(GLOB.tod != "night")
			if(isturf(H.loc))
				var/turf/T = H.loc
				if(T.can_see_sky())
					if(T.get_lumcount() > 0.15)
						to_chat(H, span_warning("Astrata spurns me! I must get out of her rays!")) // VLord is more punished for daylight excursions.
						var/turf/N = H.loc
						if(N.can_see_sky())
							if(N.get_lumcount() > 0.15)
								H.fire_act(1)
						to_chat(H, span_warning("That was too close. I must avoid the sun."))
					else
						H.fire_act(1) (APPLE EDIT:I think something along the lines of this is whats used for burning in daylight)*/
	if(H.mind)
		var/datum/antagonist/vampire/new_antag = new /datum/antagonist/vampirelord/lesser()
		H.mind.add_antag_datum(new_antag)


/obj/effect/proc_holder/spell/self/convertrole/vampire
	name = "Recruit Ally"
	new_role = "Vampyre Sympathizer"
	recruitment_faction = "Vampire"
	recruitment_message = "Aid our cause, %RECRUIT!"
	accept_message = "For what is right."
	refuse_message = "I refuse."
k
