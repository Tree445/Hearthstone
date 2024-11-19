/datum/reagent/medicine/minorhealthpot
	name = "Minor Health Potion"
	description = "Gradually regenerates all types of damage."
	reagent_state = LIQUID
	color = "#ff9494"
	taste_description = "tangy sweetness"
	overdose_threshold = 0
	metabolization_rate = 1 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/minorhealthpot/on_mob_life(mob/living/carbon/M) // Heals half as much as health potion, but not wounds.
	M.adjustBruteLoss(-0.5*REM, 0) // 20u = 25 points of healing
	M.adjustFireLoss(-0.5*REM, 0)
	M.adjustOxyLoss(-1, 0)
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_TONGUE, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_EARS, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_EYES, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_APPENDIX, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -1*REM)
	M.adjustCloneLoss(-1*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/healthpot
	name = "Health Potion"
	description = "Regenerates all types of damage."
	reagent_state = LIQUID
	color = "#ff5151"
	taste_description = "warm oil and flesh"
	overdose_threshold = 0
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/healthpot/on_mob_life(mob/living/carbon/M)
	var/list/wCount = M.get_wounds()
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(M.blood_volume+50, BLOOD_VOLUME_MAXIMUM)
	else
		//can overfill you with blood, but at a slower rate
		M.blood_volume = min(M.blood_volume+10, BLOOD_VOLUME_MAXIMUM)
	if(wCount.len > 0)
		//some peeps dislike the church, this allows an alternative thats not a doctor or sleep.
		M.heal_wounds(1)
		M.update_damage_overlays()
		to_chat(M, span_nicegreen("I feel one of my wounds mend."))
	M.adjustBruteLoss(-0.5*REM, 0) // 20u = 50 points of healing
	M.adjustFireLoss(-0.5*REM, 0)
	M.adjustOxyLoss(-1*REM, 0)
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_TONGUE, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_EARS, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_EYES, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_APPENDIX, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH, -1*REM)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -1*REM)
	for(var/obj/item/organ/filling_organ/forgan in M.internal_organs) //auto detected heal of filling organs
		M.adjustOrganLoss(forgan.slot, -1*REM)
	M.adjustCloneLoss(-1*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/majorhealthpot
	name = "Major Health Potion"
	description = "Quickly regenerates all types of damage."
	reagent_state = LIQUID
	color = "#ff4800"
	taste_description = "red"
	overdose_threshold = 20 // Means you'll end up in critical condition and need outside help if you over do it.
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/majorhealthpot/on_mob_life(mob/living/carbon/M) // Triple the healing of regular health pots.
	var/list/wCount = M.get_wounds()
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(M.blood_volume+100, BLOOD_VOLUME_MAXIMUM)
	else
		M.blood_volume = min(M.blood_volume+20, BLOOD_VOLUME_MAXIMUM)
	if(wCount.len > 0)
		M.heal_wounds(4)
		M.update_damage_overlays()
	M.adjustBruteLoss(-1.5*REM, 0) // 20u = 150 points of healing.
	M.adjustFireLoss(-1.5*REM, 0)
	M.adjustOxyLoss(-3, 0)
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, -3*REM)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, -3*REM)
	M.adjustOrganLoss(ORGAN_SLOT_TONGUE, -3*REM)
	M.adjustOrganLoss(ORGAN_SLOT_EARS, -3*REM)
	M.adjustOrganLoss(ORGAN_SLOT_EYES, -3*REM)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, -3*REM)
	M.adjustOrganLoss(ORGAN_SLOT_APPENDIX, -3*REM)
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH, -3*REM)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -3*REM)
	for(var/obj/item/organ/filling_organ/forgan in M.internal_organs) //auto detected heal of filling organs
		M.adjustOrganLoss(forgan.slot, -1*REM)
	M.adjustCloneLoss(-3*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/majorhealthpot/overdose_process(mob/living/carbon/M) // Savor your supreme healing, or else.
	M.add_nausea(15)
	M.adjustBruteLoss(1*REM, 0)
	M.adjustToxLoss(3, 0)
	M.blood_volume = min(M.blood_volume+100, BLOOD_VOLUME_MAXIMUM) // Full to bursting.

/datum/reagent/medicine/sublimeambrosia
	name = "Sublime Ambrosia"
	description = "Rapidly regenerates all types of damage, and reverses death."
	reagent_state = LIQUID
	color = "#b89c2b"
	taste_description = "magical apoptosis"
	overdose_threshold = 6 // Small doses...
	metabolization_rate = 0.3 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/sublimeambrosia/on_mob_life(mob/living/carbon/M)
	var/list/wCount = M.get_wounds()
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(M.blood_volume+200, BLOOD_VOLUME_MAXIMUM)
	else
		M.blood_volume = min(M.blood_volume+20, BLOOD_VOLUME_MAXIMUM)
	if(wCount.len > 0)
		M.heal_wounds(6)
		M.update_damage_overlays()
	M.adjustBruteLoss(-4.5*REM, 0)
	M.adjustFireLoss(-4.5*REM, 0)
	M.adjustToxLoss(-4.5*REM, 0)
	M.adjustOxyLoss(-9, 0)
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, -9*REM)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, -9*REM)
	M.adjustOrganLoss(ORGAN_SLOT_TONGUE, -9*REM)
	M.adjustOrganLoss(ORGAN_SLOT_EARS, -9*REM)
	M.adjustOrganLoss(ORGAN_SLOT_EYES, -9*REM)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, -9*REM)
	M.adjustOrganLoss(ORGAN_SLOT_APPENDIX, -9*REM)
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH, -9*REM)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -9*REM)
	M.adjustCloneLoss(-9*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/sublimeambrosia/reaction_mob(mob/living/M, method=TOUCH, reac_volume)
	if(iscarbon(M) && M.stat == DEAD)
		if(M.mob_biotypes & MOB_UNDEAD)//cure rot first
			return FALSE
		if(!M.revive(full_heal = FALSE))
			M.visible_message(span_notice("[M]'s body does not seem to react to the ambrosia..."))
			return FALSE
		if(method == INGEST)
			var/mob/living/carbon/spirit/underworld_spirit = M.get_spirit()
			if(underworld_spirit)
				var/mob/dead/observer/ghost = underworld_spirit.ghostize()
				qdel(underworld_spirit)
				ghost.mind.transfer_to(M, TRUE)
			M.grab_ghost(force = TRUE) // even suicides
			M.emote("breathgasp")
			M.Jitter(100)
			M.update_body()
			M.visible_message(span_notice("[M]'s body convulses as they're ripped from death's embrace by ambrosia!"), span_green("I awake from the void."))
			if(M.mind)
				if(!HAS_TRAIT(M, TRAIT_IWASREVIVED))
					ADD_TRAIT(M, TRAIT_IWASREVIVED, "[type]")
		return TRUE
	..()

/datum/reagent/medicine/sublimeambrosia/overdose_process(mob/living/carbon/M) // This is meant for the dead, or near dead. Imbibe at own risk.
	M.add_nausea(25)
	M.adjustBruteLoss(3*REM, 0)
	M.dizziness += 2
	M.confused += 2
	M.adjustToxLoss(15, 0)
	M.blood_volume = min(M.blood_volume+100, BLOOD_VOLUME_MAXIMUM)

/datum/reagent/medicine/shroomt
	name = "Shroom Tea"
	description = "Extremely slowly regenerates all types of damage. long lasting."
	reagent_state = LIQUID
	color = "#476e4d"
	taste_description = "dirt"
	overdose_threshold = 25 // cups hold 24 so even one sip more from tanakrd is OD
	metabolization_rate = 0.2 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/shroomt/on_mob_life(mob/living/carbon/M)
	var/list/wCount = M.get_wounds()
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(M.blood_volume+50, BLOOD_VOLUME_MAXIMUM)
	else
		M.blood_volume = min(M.blood_volume+2, BLOOD_VOLUME_MAXIMUM)
	if(wCount.len > 0)
		M.heal_wounds(1)
		M.update_damage_overlays()
	M.adjustBruteLoss(-0.2*REM, 0)
	M.adjustToxLoss(-0.2*REM, 0)
	M.adjustFireLoss(-0.2*REM, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -0.5)
	M.adjustOrganLoss(ORGAN_SLOT_LUNGS, -5)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, -0.5)
	M.adjustOrganLoss(ORGAN_SLOT_TONGUE, -0.5)
	M.adjustOrganLoss(ORGAN_SLOT_EARS, -0.5)
	M.adjustOrganLoss(ORGAN_SLOT_EYES, -0.5)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, -0.5)
	M.adjustOrganLoss(ORGAN_SLOT_APPENDIX, -0.5)
	M.adjustOrganLoss(ORGAN_SLOT_STOMACH, -0.5)
	M.adjustOxyLoss(-1, 0)
	M.rogstam_add(25)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -1*REM)
	M.adjustCloneLoss(-1*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/shroomt/overdose_process(mob/living/carbon/M)
	M.add_nausea(15)

/datum/reagent/medicine/manapot
	name = "Mana Potion"
	description = "Gradually regenerates stamina."
	reagent_state = LIQUID
	color = "#0000ff"
	taste_description = "manna"
	overdose_threshold = 0
	metabolization_rate = 20 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/manapot/on_mob_life(mob/living/carbon/M)
	M.rogstam_add(100)
	..()
	. = 1

/datum/reagent/medicine/antipregnancy
	name = "Pregnancy Removal Potion"
	description = "Fixes mistakes."
	reagent_state = LIQUID
	color = "#a9326a"
	taste_description = "worries"
	overdose_threshold = 60
	metabolization_rate = REAGENTS_METABOLISM
	alpha = 200

/datum/reagent/medicine/antipregnancy/on_mob_life(mob/living/carbon/M)
	if(istype(holder, /obj/item/organ/filling_organ))
		var/obj/item/organ/filling_organ/forgan = holder
		if(forgan.pregnant)
			forgan.undo_preggoness()
	M.add_nausea(0.2)
	..()
	. = 1

/datum/reagent/medicine/antipregnancy/overdose_process(mob/living/carbon/M)
	M.add_nausea(9)
	M.adjustToxLoss(3, 0)

/datum/reagent/medicine/antipoisonpot
	name = "Anti Poison Potion"
	description = "Quickly nullifies toxins."
	reagent_state = LIQUID
	color = "#64bf49"
	taste_description = "ashes"
	overdose_threshold = 60
	metabolization_rate = REAGENTS_METABOLISM
	alpha = 200

/datum/reagent/medicine/antipoisonpot/on_mob_life(mob/living/carbon/M)
	for(var/datum/reagent/toxin/R in M.reagents.reagent_list)
		if(R != src)
			M.reagents.remove_reagent(R.type,0.5)
	M.adjustToxLoss(-0.5*REM, 0)
	if(M.has_status_effect(STATUS_EFFECT_ENDOWED))
		M.remove_status_effect(STATUS_EFFECT_ENDOWED)
	..()
	. = 1

/datum/reagent/medicine/antipoisonpot/overdose_process(mob/living/carbon/M)
	M.add_nausea(9)
	M.adjustToxLoss(3, 0)

/datum/reagent/berrypoison
	name = "Berry Poison"
	description = "Contains a poisonous thick, dark purple liquid."
	reagent_state = LIQUID
	color = "#00B4FF"
	metabolization_rate = 0.1

/datum/reagent/berrypoison/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M, TRAIT_NASTY_EATER || TRAIT_WILD_EATER))
		M.add_nausea(9)
		M.adjustToxLoss(3, 0)
	return ..()

/datum/reagent/organpoison
	name = "Organ Poison"
	description = "A viscous black liquid clings to the glass."
	reagent_state = LIQUID
	color = "#ff2f00"
	metabolization_rate = 0.1

/datum/reagent/organpoison/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M, TRAIT_NASTY_EATER) && !HAS_TRAIT(M, TRAIT_ORGAN_EATER))
		M.add_nausea(9)
		M.adjustToxLoss(3, 0)
	return ..()


/datum/reagent/infection
	name = "excess choleric humour"
	description = "Red-yellow pustulence - the carrier of disease, the enemy of all Pestrans."
	reagent_state = LIQUID
	color = "#dfe36f"
	metabolization_rate = 0.1
	var/damage_tick = 0.3
	var/lethal_fever = FALSE
	var/fever_multiplier = 1

/datum/reagent/infection/on_mob_life(mob/living/carbon/M)
	var/heat = (BODYTEMP_AUTORECOVERY_MINIMUM + clamp(volume, 3, 15)) * fever_multiplier
	if(HAS_TRAIT(M, TRAIT_SNEK))
		M.apply_status_effect(/datum/status_effect/buff/healing)
		if(holder.has_reagent(/datum/reagent/infection))
			holder.remove_reagent(/datum/reagent/infection, 9999)
			return
	M.adjustToxLoss(damage_tick, 0)
	if (lethal_fever)
		M.adjust_bodytemperature(heat, 0)
		if (prob(5))
			to_chat(M, span_warning("A wicked heat settles within me... I feel ill. Very ill."))
	else
		M.adjust_bodytemperature(heat, 0, BODYTEMP_HEAT_DAMAGE_LIMIT - 1)
		if (prob(5))
			to_chat(M, span_warning("I feel a horrible chill despite the sweat rolling from my brow..."))
	return ..()

/datum/reagent/infection/minor
	name = "disrupted choleric humor"
	description = "Symptomatic of disrupted humours."
	damage_tick = 0.1
	lethal_fever = FALSE

/datum/reagent/infection/minor/on_mob_life(mob/living/carbon/M)
	var/heat = (BODYTEMP_AUTORECOVERY_MINIMUM + clamp(volume, 3, 15)) * fever_multiplier
	if(HAS_TRAIT(M, TRAIT_SNEK))
		M.apply_status_effect(/datum/status_effect/buff/healing)
		if(holder.has_reagent(/datum/reagent/infection/minor))
			holder.remove_reagent(/datum/reagent/infection/minor, 9999)
			return
	M.adjustToxLoss(damage_tick, 0)
	if (lethal_fever)
		M.adjust_bodytemperature(heat, 0)
		if (prob(5))
			to_chat(M, span_warning("A wicked heat settles within me... I feel ill. Very ill."))
	else
		M.adjust_bodytemperature(heat, 0, BODYTEMP_HEAT_DAMAGE_LIMIT - 1)
		if (prob(5))
			to_chat(M, span_warning("I feel a horrible chill despite the sweat rolling from my brow..."))
	return ..()

/datum/reagent/infection/major
	name = "excess melancholic humour"
	description = "Kingsfield's Bane. Excess melancholic has killed thousands, and even Pestra's greatest struggle against its insidious advance."
	damage_tick = 1
	lethal_fever = TRUE
	fever_multiplier = 3

/datum/reagent/infection/major/on_mob_life(mob/living/carbon/M)
	if(HAS_TRAIT(M, TRAIT_SNEK))
		M.apply_status_effect(/datum/status_effect/buff/healing)
		if(holder.has_reagent(/datum/reagent/infection/major))
			holder.remove_reagent(/datum/reagent/infection/major, 9999)
			return
	if (M.badluck(1))
		M.reagents.add_reagent(src, rand(1,3))
		to_chat(M, span_small("I feel even worse..."))
	return ..()

/datum/reagent/medicine/caffeine
	name = "caffeine"
	description = "No Sleep"
	reagent_state = LIQUID
	color = "#D2FFFA"
	metabolization_rate = 20 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/medicine/caffeine/on_mob_life(mob/living/carbon/M)
	M.rogstam_add(800)
	..()
	. = 1
	if(M.has_status_effect(/datum/status_effect/debuff/sleepytime))
		M.remove_status_effect(/datum/status_effect/debuff/sleepytime)
		M.remove_stress(/datum/stressevent/sleepytime)
		M.mind.sleep_adv.advance_cycle()

/datum/reagent/medicine/stimu
	name = "Stimu"
	description = "crit stabalizer and blood restorer painkiller"
	reagent_state = LIQUID
	color = "#D2FFFA"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/medicine/stimu/on_mob_metabolize(mob/living/carbon/M)
	..()
	ADD_TRAIT(M, TRAIT_NOCRITDAMAGE, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_NOPAIN, TRAIT_GENERIC)

/datum/reagent/medicine/stimu/on_mob_end_metabolize(mob/living/carbon/M)
	REMOVE_TRAIT(M, TRAIT_NOCRITDAMAGE, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_NOPAIN, TRAIT_GENERIC)
	..()

/datum/reagent/medicine/stimu/on_mob_life(mob/living/carbon/M)
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.heal_wounds(2) //same as health pot only heal wounds while bleeding. technically.
		M.blood_volume = min(M.blood_volume+15, BLOOD_VOLUME_NORMAL)
	if(M.health <= M.crit_threshold)
		M.adjustToxLoss(-0.5*REM, 0)
		M.adjustBruteLoss(-0.5*REM, 0)
		M.adjustFireLoss(-0.5*REM, 0)
		M.adjustOxyLoss(-0.5*REM, 0)
	if(M.losebreath >= 4)
		M.losebreath -= 2
	if(M.losebreath < 0)
		M.losebreath = 0
	..()

/datum/reagent/medicine/purify
	name = "PURIFY"
	reagent_state = LIQUID
	color = "#808080"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = null
	description = "A powerful drug that purifies the blood and seals wounds painfully on the body."

/datum/reagent/medicine/purify/on_mob_life(mob/living/carbon/human/M)
	M.adjustFireLoss(0.5*REM, 0)
	M.heal_wounds(3)
	M.reagents.remove_reagent(/datum/reagent/infection, 9999)
	// Iterate through all body parts
	for (var/obj/item/bodypart/B in M.bodyparts)
		// Iterate through wounds on each body part
		for (var/datum/wound/W in B.wounds)
			// Check for and remove zombie infection
			if (W.zombie_infection_timer)
				deltimer(W.zombie_infection_timer)
				W.zombie_infection_timer = null
				to_chat(M, "You feel the drugs burning intensely in [B.name].")
			// Check for and remove werewolf infection
			if (W.werewolf_infection_timer)
				deltimer(W.werewolf_infection_timer)
				W.werewolf_infection_timer = null
				to_chat(M, "You feel the drugs burning intensely in [B.name].")

			// Handle destruction of the wound
			W.Destroy(0)

	M.update_damage_overlays()

/datum/reagent/medicine/mori
	name = "MORIBUND"
	reagent_state = LIQUID
	color = "#808080"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 6
	description = "A powerful drug that drags the moribund back from the grasp of necra."

/datum/reagent/medicine/mori/on_mob_life(mob/living/carbon/M)
	var/list/wCount = M.get_wounds()
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(M.blood_volume+200, BLOOD_VOLUME_MAXIMUM)
	else
		M.blood_volume = min(M.blood_volume+20, BLOOD_VOLUME_MAXIMUM)
	if(wCount.len > 0)	
		M.heal_wounds(6)
		M.update_damage_overlays()
	M.adjustBruteLoss(-4.5*REM, 0)
	M.adjustFireLoss(-4.5*REM, 0)
	M.adjustOxyLoss(-9, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -9*REM)
	M.adjustCloneLoss(-9*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/mori/reaction_mob(mob/living/M, method=TOUCH, reac_volume)
	if(iscarbon(M) && M.stat == DEAD)
		if(M.mob_biotypes & MOB_UNDEAD)
			return FALSE
		if(!M.revive(full_heal = FALSE))
			M.visible_message(span_notice("[M]'s body is too damaged...."))
			return FALSE
		if(method == INJECT)
			var/mob/living/carbon/spirit/underworld_spirit = M.get_spirit()
			if(underworld_spirit)
				var/mob/dead/observer/ghost = underworld_spirit.ghostize()
				qdel(underworld_spirit)
				ghost.mind.transfer_to(M, TRUE)
			M.grab_ghost(force = TRUE)
			M.emote("rage")
			M.Jitter(100)
			M.update_body()
			M.visible_message(span_notice("[M]'s body convulses as they're ripped from death's embrace!"), span_green("I awake from the void."))
			if(M.mind)
				if(!HAS_TRAIT(M, TRAIT_IWASREVIVED))
					ADD_TRAIT(M, TRAIT_IWASREVIVED, "[type]")
		return TRUE
	..()


/datum/reagent/medicine/mori/overdose_process(mob/living/carbon/M) // This is meant for the dead or dieing, not you pot stacking. suffer.
	M.add_nausea(25)
	M.dizziness += 2
	M.confused += 2
	M.adjustToxLoss(15, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5*REM)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 5*REM)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, 5*REM)
	M.adjustOrganLoss(ORGAN_SLOT_EYES, 5*REM)

///////////////////////// alch BS

/datum/reagent/alch/on_mob_metabolize(mob/living/carbon/M)
	if(prob(50))
		M.confused = max(M.confused+3,0)
	M.emote(pick("cough"))

/obj/item/reagent_containers/powder/alch
	name = "essence"
	desc = "powderized and ready to brew"
	gender = PLURAL
	icon_state = "salt"
	can_brew = TRUE
	list_reagents = null
	grind_results = null
	volume = 24

/obj/item/reagent_containers/powder/alch/pur
	name = "essence of purity"
	gender = PLURAL
	icon_state = "salt"
	color = "#61DE2A"
	brew_reagent = /datum/reagent/alch/syrumpur
	brew_amt = 24
	can_brew = TRUE
	list_reagents = null
	grind_results = null
	volume = 24

/obj/item/reagent_containers/powder/alch/life
	name = "essence of life"
	gender = PLURAL
	icon_state = "spice"
	brew_reagent = /datum/reagent/alch/syrumlife
	brew_amt = 24
	can_brew = TRUE
	list_reagents = null
	grind_results = null
	volume = 24

/obj/item/reagent_containers/powder/alch/berry
	name = "essence of berry"
	gender = PLURAL
	icon_state = "salt"
	color = "#4682b4"
	brew_reagent = /datum/reagent/alch/syrumb
	brew_amt = 24
	can_brew = TRUE
	list_reagents = null
	grind_results = null
	volume = 24

/obj/item/reagent_containers/powder/alch/berryp
	name = "essence of poison berry"
	gender = PLURAL
	icon_state = "salt"
	color = "#61DE2A"
	brew_reagent = /datum/reagent/alch/syrump
	brew_amt = 24
	can_brew = TRUE
	list_reagents = list(/datum/reagent/berrypoison = 10)
	grind_results = list(/datum/reagent/berrypoison = 10)
	volume = 10

/obj/item/reagent_containers/powder/alch/mincem
	name = "essence of flesh"
	gender = PLURAL
	icon_state = "salt"
	color = "#ff7f7f"
	can_brew = TRUE
	brew_reagent = /datum/reagent/alch/syrumm
	brew_amt = 24
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	grind_results = null
	volume = 10

/obj/item/reagent_containers/powder/alch/mincef
	name = "essence of fish"
	gender = PLURAL
	icon_state = "salt"
	color = "#ff7f7f"
	brew_reagent = /datum/reagent/alch/syrumf
	brew_amt = 24
	can_brew = TRUE
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	grind_results = null
	volume = 10

/obj/item/reagent_containers/powder/alch/pipe
	name = "essence of addiction"
	gender = PLURAL
	icon_state = "salt"
	brew_reagent = /datum/reagent/alch/syrumpw
	brew_amt = 24
	can_brew = TRUE
	color = "#808080"
	list_reagents = list(/datum/reagent/drug/nicotine = 30)
	grind_results = null
	volume = 10

/obj/item/reagent_containers/powder/alch/swamp
	name = "essence of clarity"
	gender = PLURAL
	icon_state = "salt"
	brew_reagent = /datum/reagent/alch/syrumsw
	brew_amt = 24
	can_brew = TRUE
	color = "#61DE2A"
	list_reagents = list(/datum/reagent/drug/space_drugs = 30)
	grind_results = null
	volume = 10

/datum/reagent/alch
	name = "hmm"
	description = "shouldnt see this"
	reagent_state = LIQUID
	color = "#808080"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syruma
	name = "syrum of fire"
	description = "refined viscous ash"
	reagent_state = LIQUID
	color = "#808080"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syruma/on_mob_metabolize(mob/living/carbon/M)
	M.adjustToxLoss(-1*REM, 0)
	M.adjustFireLoss(0.25*REM, 0)
	M.reagents.remove_all_type(/datum/reagent, 1)
	M.emote(pick("gag"))

/datum/reagent/alch/syrumpw
	name = "west syrum"
	description = "refined west essence"
	reagent_state = LIQUID
	color = "#808080"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrumsw
	name = "swamp syrum"
	description = "refined berry poison"
	reagent_state = LIQUID
	color = "#61DE2A"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrumm
	name = "meaty syrum"
	description = "refined viscous slop"
	reagent_state = LIQUID
	color = "#ff7f7f"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrumf
	name = "fishyy syrum"
	description = "refined viscous fishy smelling gunk"
	reagent_state = LIQUID
	color = "#ff7f7f"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrums
	name = "salty syrum"
	description = "refined liquid state salt"
	reagent_state = LIQUID
	color = "#E2E5DE"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrump
	name = "poison syrum"
	description = "refined berry poison"
	reagent_state = LIQUID
	color = "#61DE2A"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrump/on_mob_metabolize(mob/living/carbon/M)
	M.add_nausea(9)
	M.adjustToxLoss(2, 0)

/datum/reagent/alch/syrumb
	name = "berry syrum"
	description = "refined berry essence"
	reagent_state = LIQUID
	color = "#61DE2A"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syruma
	name = "syrum of fire"
	description = "refined viscous ash"
	reagent_state = LIQUID
	color = "#808080"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syruma/on_mob_metabolize(mob/living/carbon/M)
	M.adjustToxLoss(-1*REM, 0)
	M.adjustFireLoss(0.25*REM, 0)
	M.reagents.remove_all_type(/datum/reagent, 1)
	M.emote(pick("gag"))

/datum/reagent/alch/syrumpur
	name = "purity syrum"
	description = "refined viscous gunk"
	reagent_state = LIQUID
	color = "#61DE2A"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrumlife
	name = "incomplete life syrum"
	description = "refined viscous gunk not quite ready yet"
	reagent_state = LIQUID
	color = "#61DE2A"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = null

////////////////////////////////////////////////////---------------------------------------alch reactions----------------------------------------------//////////////////////////////////////////////////////////

/datum/chemical_reaction/alch/health
	name = "health pot"
	mix_sound = 'sound/items/fillbottle.ogg'
	id = /datum/reagent/medicine/healthpot
	results = list(/datum/reagent/medicine/healthpot = 45)
	required_reagents = list(/datum/reagent/alch/syrumm = 24, /datum/reagent/alch/syruma = 24)

/datum/chemical_reaction/alch/mana
	name = "mana pot"
	id = /datum/reagent/medicine/manapot
	results = list(/datum/reagent/medicine/manapot = 45)
	required_reagents = list(/datum/reagent/alch/syrumf = 24, /datum/reagent/alch/syruma = 24)

/datum/chemical_reaction/alch/salt/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/powder/salt(location)

/datum/chemical_reaction/alch/ozium
	name = "oziumify"
	id = "oziumify"
	required_reagents = list(/datum/reagent/alch/syrump = 24, /datum/reagent/alch/syrumsw = 24)

/datum/chemical_reaction/alch/ozium/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/powder/ozium(location)

/datum/chemical_reaction/alch/moon
	name = "moondustify"
	id = "moondustify"
	required_reagents = list(/datum/reagent/alch/syrump = 24, /datum/reagent/alch/syrumpw = 24)

/datum/chemical_reaction/alch/moon/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/powder/moondust(location)

/datum/chemical_reaction/alch/spice
	name = "spiceify"
	id = "spiceify"
	required_reagents = list(/datum/reagent/alch/syrumsw = 24, /datum/reagent/alch/syrumpw = 24)

/datum/chemical_reaction/alch/spice/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/powder/spice(location)

/datum/chemical_reaction/alch/pure
	name = "clean moondustify"
	id = "clean moondustify"
	required_reagents = list(/datum/reagent/ozium = 15, /datum/reagent/moondust = 15)

/datum/chemical_reaction/alch/pure/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/powder/moondust/purest(location)

/datum/chemical_reaction/alch/purify
	name = "purifyify"
	id = "purifyify"
	required_reagents = list(/datum/reagent/alch/syrumpur = 24)
	required_temp = 374

/datum/chemical_reaction/alch/purify/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/hypospray/medipen/sealbottle/purify(location)

/datum/chemical_reaction/alch/life
	name = "lifeify"
	id = "lifeify"
	required_reagents = list(/datum/reagent/alch/syrumlife = 24)
	required_temp = 374

/datum/chemical_reaction/alch/life/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/hypospray/medipen/sealbottle/mori(location)
