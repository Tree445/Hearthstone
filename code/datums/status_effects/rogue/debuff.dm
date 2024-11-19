/datum/status_effect/debuff
	status_type = STATUS_EFFECT_REFRESH

///////////////////////////

/datum/status_effect/debuff/hungryt1
	id = "hungryt1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt1
	effectedstats = list("constitution" = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt1
	name = "Hungry"
	desc = "Hunger weakens this living body."
	icon_state = "hunger1"

/datum/status_effect/debuff/hungryt2
	id = "hungryt2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt2
	effectedstats = list("strength" = -2, "constitution" = -2, "endurance" = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt2
	name = "Hungry"
	desc = "This living body suffers heavily from hunger."
	icon_state = "hunger2"

/datum/status_effect/debuff/hungryt3
	id = "hungryt3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt3
	effectedstats = list("strength" = -5, "constitution" = -3, "endurance" = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt3
	name = "Hungry"
	desc = "My body can barely hold it!"
	icon_state = "hunger3"

//ARMOR WEARING STRAIN

/datum/status_effect/debuff/armorfail
	id = "armorfail1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/mediumfail
	effectedstats = list("strength" = -3, "constitution" = -2, "endurance" = -2, "speed" = -4)

/atom/movable/screen/alert/status_effect/debuff/mediumfail
	name = "Armor Strain"
	desc = "This armor is too heavy to move in.. I have no training in this!"
	icon_state = "muscles"		//Placeholder

//SILVER DAGGER EFFECT

/datum/status_effect/debuff/silver_curse
	id = "silver_curse"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/silver_curse
	duration = 5 SECONDS

/atom/movable/screen/alert/status_effect/debuff/silver_curse
	name = "Silver Curse"
	desc = "My BANE!"
	icon_state = "hunger3"

//STEALTH COOLDOWN

/datum/status_effect/debuff/stealthcd
	id = "stealth_cd"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/stealthcd
	duration = 12 SECONDS

/atom/movable/screen/alert/status_effect/debuff/stealthcd
	name = "Stealth Broken"
	desc = "I've recently dealt a sneak attack and can't sneak again for a short while"
	icon = 'modular_stonehedge/icons/mob/screen_alert.dmi'
	icon_state = "stealthcd"

/datum/status_effect/debuff/stealthcd/on_apply()
	if(owner.mind)
		duration = duration - (owner.mind.get_skill_level(/datum/skill/misc/sneaking))
	if(owner.m_intent == MOVE_INTENT_SNEAK)
		owner.toggle_rogmove_intent(MOVE_INTENT_WALK)
		owner.update_sneak_invis()
	return ..()

////////////////////

/datum/status_effect/debuff/moondust_crash
	id = "moondust_crash"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/moondust_crash
	effectedstats = list("speed" = -3, "endurance" = -3)
	duration = 20 SECONDS

/atom/movable/screen/alert/status_effect/debuff/moondust_crash
	name = "Moondust Crash"
	desc = "My body feels sluggish and strained."
	icon_state = "muscles"


/datum/status_effect/debuff/thirstyt1
	id = "thirsty1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt1
	effectedstats = list("endurance" = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt1
	name = "Thirsty"
	desc = "I need water."
	icon_state = "thirst1"

/datum/status_effect/debuff/thirstyt2
	id = "thirsty2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt2
	effectedstats = list("speed" = -1, "endurance" = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt2
	name = "Thirsty"
	desc = "My mouth feels much drier."
	icon_state = "thirst2"

/datum/status_effect/debuff/thirstyt3
	id = "thirsty3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt3
	effectedstats = list("strength" = -1, "speed" = -2, "endurance" = -3)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt3
	name = "Thirsty"
	desc = "I urgently need water!"
	icon_state = "thirst3"

/////////

/datum/status_effect/debuff/uncookedfood
	id = "uncookedfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/uncookedfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER) || HAS_TRAIT(owner, TRAIT_ORGAN_EATER) || HAS_TRAIT(owner, TRAIT_WILD_EATER))
		return ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(100)
	return ..()

/datum/status_effect/debuff/badmeal
	id = "badmeal"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/badmeal/on_apply()
	owner.add_stress(/datum/stressevent/badmeal)
	return ..()

/datum/status_effect/debuff/burnedfood
	id = "burnedfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/burnedfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER))
		return ..()
	owner.add_stress(/datum/stressevent/burntmeal)
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(100)
	return ..()

/datum/status_effect/debuff/rotfood
	id = "rotfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/rotfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER) || HAS_TRAIT(owner, TRAIT_ROT_EATER))
		return ..()
	owner.add_stress(/datum/stressevent/rotfood)
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(200)
	return ..()

/datum/status_effect/debuff/bleeding
	id = "bleedingt1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt1
	effectedstats = list("speed" = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt1
	name = "Dizzy"
	desc = ""
	icon_state = "bleed1"

/datum/status_effect/debuff/bleedingworse
	id = "bleedingt2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt2
	effectedstats = list("strength" = -1, "speed" = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt2
	name = "Faint"
	desc = ""
	icon_state = "bleed2"

/datum/status_effect/debuff/bleedingworst
	id = "bleedingt3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt3
	effectedstats = list("strength" = -3, "speed" = -4)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt3
	name = "Drained"
	desc = ""
	icon_state = "bleed3"

/datum/status_effect/debuff/sleepytime
	id = "sleepytime"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/sleepytime
	effectedstats = list("speed" = -1, "endurance" = -1)

/atom/movable/screen/alert/status_effect/debuff/sleepytime
	name = "Tired"
	desc = "I should get some rest."
	icon_state = "sleepy"

/datum/status_effect/debuff/trainsleep
	id = "trainsleep"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/trainsleep
	effectedstats = list("strength" = -1, "endurance" = -1)

/atom/movable/screen/alert/status_effect/debuff/trainsleep
	name = "Muscle Soreness"
	desc = "My muscles need some sleep to recover."
	icon_state = "muscles"

/datum/status_effect/debuff/devitalised
	id = "devitalised"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/devitalised
	effectedstats = list("fortune" = -3)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/debuff/devitalised
	name = "Devitalised"
	desc = "Something has been taken from me, and it will take time to recover."

/datum/status_effect/debuff/goblingas
	id = "goblingas"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/goblingas
	effectedstats = list("intelligence" = -3, "endurance" = -3)
	duration = 40 SECONDS

/atom/movable/screen/alert/status_effect/debuff/goblingas
	name = "Goblin Brained"
	desc = "My entire body's going numb..."
	icon_state = "fentanyl"

/datum/status_effect/debuff/vamp_dreams
	id = "sleepytime"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/vamp_dreams

/atom/movable/screen/alert/status_effect/debuff/vamp_dreams
	name = "Insight"
	desc = "With some sleep in a coffin I feel like I could become better."
	icon_state = "sleepy"

/datum/status_effect/debuff/cumbrained
	id = "cumbrained"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/cumbrained
	effectedstats = list("intelligence" = -10, "strength" = -6, "speed" = -6)
	duration = 60 SECONDS

/atom/movable/screen/alert/status_effect/debuff/cumbrained
	name = "Cum Brained"
	desc = "It's hard to think..."
	icon_state = "fentanyl"

//Death debuff

/datum/status_effect/debuff/death_weaken
	id = "death_weaken"
	alert_type = null
	status_type = STATUS_EFFECT_UNIQUE
	examine_text = span_notice("They appear not entirely whole, as if some part of them was left behind.")
	effectedstats = list("strength" = -2, "perception" = -2, "intelligence" = -2, "constitution" = -2, "endurance" = -2, "speed" = -2)
	duration = 10 MINUTES

/// SURRENDERING DEBUFFS

/datum/status_effect/debuff/breedable
	id = "breedable"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/breedable
	duration = 30 SECONDS

/datum/status_effect/debuff/breedable/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_CRITICAL_RESISTANCE, id)

/datum/status_effect/debuff/breedable/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_CRITICAL_RESISTANCE, id)

/atom/movable/screen/alert/status_effect/debuff/breedable
	name = "Breedable"

/datum/status_effect/debuff/submissive
	id = "submissive"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/submissive
	duration = 60 SECONDS

/datum/status_effect/debuff/submissive/on_apply()
	. = ..()
	owner.add_movespeed_modifier("SUBMISSIVE", multiplicative_slowdown = 4)

/datum/status_effect/debuff/submissive/on_remove()
	. = ..()
	owner.remove_movespeed_modifier("SUBMISSIVE")

/atom/movable/screen/alert/status_effect/debuff/submissive
	name = "Submissive"

/// SEELIE DEBUFFS

/datum/status_effect/buff/seelie/sad
	id = "Seelie Curse"
	alert_type = /atom/movable/screen/alert/status_effect/buff/seelie/sad
	effectedstats = list("fortune" = -2)
	duration = 60 SECONDS

/atom/movable/screen/alert/status_effect/buff/seelie/sad
	name = "Seelie Curse"
	desc = "A nearby Seelie has spread their poor mood unto me."
	icon_state = "stressb"

/datum/status_effect/debuff/seelie_wing_curse
	id = "seelie_wing_curse"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/seelie_wing_curse
	effectedstats = list("fortune" = -2)
	duration = 4 MINUTES

/atom/movable/screen/alert/status_effect/debuff/seelie_wing_curse
	name = "Curse of the Seelie"
	desc = "I've been cursed for my horrific deed..."
	icon_state = "stressb"

/datum/status_effect/debuff/bigboobs
	id = "bigboobs"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bigboobs
	examine_text = span_notice("They have massive GOODS!")
	effectedstats = list("constitution" = 3,"endurance" = -2, "speed" = -1)
	duration = 10 MINUTES
	var/initialpenis
	var/initialbutt
	var/initialball
	var/initialbreasts

/atom/movable/screen/alert/status_effect/debuff/bigboobs
	name = "Enchanted Endowment" //was gonna name it a curse but it isn't a technically one.
	desc = "They feel as heavy as gold and are massive... My back hurts."
	icon = 'modular_stonehedge/icons/mob/screen_alert.dmi'
	icon_state = "bigboobs"

/datum/status_effect/debuff/bigboobs/on_apply()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	ADD_TRAIT(user, TRAIT_ENDOWMENT, id)
	to_chat(user, span_warning("Gah! my [user.gender == FEMALE ? "TITS" : "JUNK"] expand to impossible sizes!"))
	//max them out.
	for(var/obj/item/organ/forgan as anything in user.internal_organs) //as anything cause i either do this or use for() twice which is i guess worse.
		if(istype(forgan, /obj/item/organ/penis))
			initialpenis = forgan.organ_size
			forgan.organ_size = TOTAL_PENIS_SIZE
			continue
		if(istype(forgan, /obj/item/organ/butt))
			initialbutt = forgan.organ_size
			forgan.organ_size = TOTAL_BUTT_SIZE
			continue
		if(istype(forgan, /obj/item/organ/filling_organ/testicles))
			initialball = forgan.organ_size
			forgan.organ_size = TOTAL_TESTICLES_SIZE
			continue
		if(istype(forgan, /obj/item/organ/filling_organ/breasts))
			initialbreasts = forgan.organ_size
			forgan.organ_size = TOTAL_BREASTS_SIZE
			continue
		continue
	user.update_body_parts(TRUE)
	//drop our unwearable equipment to the floor.
	if(user.gender == MALE)
		var/obj/item/clothing/thepants = user.wear_pants
		if(thepants && !thepants?.can_hold_endowed)
			user.dropItemToGround(thepants)
	else
		var/obj/item/clothing/theshirt = user.wear_shirt
		var/obj/item/clothing/thearmor = user.wear_armor
		if(theshirt && !theshirt?.can_hold_endowed)
			user.dropItemToGround(theshirt)
		if(thearmor && !thearmor?.can_hold_endowed)
			user.dropItemToGround(thearmor)

/datum/status_effect/debuff/bigboobs/on_remove()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	REMOVE_TRAIT(user, TRAIT_ENDOWMENT, id)
	to_chat(user, span_notice("Phew, My bits shrunk back to the way they were."))
	//return to pref sizes.
	for(var/obj/item/organ/forgan as anything in user.internal_organs)
		if(istype(forgan, /obj/item/organ/penis))
			forgan.organ_size = initialpenis
			continue
		if(istype(forgan, /obj/item/organ/butt))
			forgan.organ_size = initialbutt
			continue
		if(istype(forgan, /obj/item/organ/filling_organ/testicles))
			forgan.organ_size = initialball
			continue
		if(istype(forgan, /obj/item/organ/filling_organ/breasts))
			forgan.organ_size = initialbreasts
			continue
		continue
	user.update_body_parts(TRUE)
