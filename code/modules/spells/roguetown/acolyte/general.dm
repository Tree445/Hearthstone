/obj/effect/proc_holder/spell/invoked/lesser_heal
	name = "Heal"
	overlay_state = "lesserheal"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 4
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/heal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 10 SECONDS
	miracle = TRUE
	devotion_cost = 10

/obj/effect/proc_holder/spell/invoked/lesser_heal/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(user.patron?.undead_hater && (target.mob_biotypes & MOB_UNDEAD)) //positive energy harms the undead
			target.visible_message(span_danger("[target] is burned by holy light!"), span_userdanger("I'm burned by holy light!"))
			target.adjustFireLoss(10)
			target.fire_act(1,10)
			return TRUE
		var/conditional_buff = FALSE
		var/situational_bonus = 1
		if(HAS_TRAIT(target, TRAIT_ASTRATA_CURSE))
			target.visible_message(span_danger("[target] recoils in pain!"), span_userdanger("Divine healing shuns me!"))
			target.cursed_freak_out()
			return FALSE
		if(HAS_TRAIT(target, TRAIT_ATHEISM_CURSE))
			target.visible_message(span_danger("[target] recoils in disgust!"), span_userdanger("These fools are trying to cure me with religion!!"))
			target.cursed_freak_out()
			return FALSE
		//this if chain is stupid, replace with variables on /datum/patron when possible?
		switch(user.patron.type)
			if(/datum/patron/old_god)
				target.visible_message(span_info("A strange stirring feeling pours from [target]!"), span_notice("Sentimental thoughts drive away my pains!"))
			if(/datum/patron/divine/astrata)
				target.visible_message(span_info("A wreath of gentle light passes over [target]!"), span_notice("I'm bathed in holy light!"))
				// during the day, heal 1 more (basic as fuck)
				if (GLOB.tod == "day")
					conditional_buff = TRUE
			if(/datum/patron/divine/noc)
				target.visible_message(span_info("A shroud of soft moonlight falls upon [target]!"), span_notice("I'm shrouded in gentle moonlight!"))
				// during the night, heal 1 more (i wish this was more interesting but they're twins so whatever)
				if (GLOB.tod == "night")
					conditional_buff = TRUE
			if(/datum/patron/divine/dendor)
				target.visible_message(span_info("A rush of syvlan energy spirals about [target]!"), span_notice("I'm infused with syvlan energies, leaf and strange laughter swirl in my mind.!"))
				var/list/natural_stuff = list(/obj/structure/flora/roguegrass, /obj/structure/flora/roguetree, /obj/structure/flora/rogueshroom, /obj/structure/soil, /turf/open/floor/rogue/dirt)
				situational_bonus = 0
				// the more natural stuff around US, the more we heal
				for (var/obj/O in oview(5, user))
					if (O in natural_stuff)
						situational_bonus = min(situational_bonus + 0.1, 2)
				if (situational_bonus > 0)
					conditional_buff = TRUE
			if(/datum/patron/divine/abyssor)
				target.visible_message(span_info("A mist of salt-scented vapour settles on [target]!"), span_notice("I'm invigorated by healing vapours!"))
				// if our target is standing in water, heal a flat amount extra
				if (istype(get_turf(target), /turf/open/water))
					conditional_buff = TRUE
					situational_bonus = 1.5
			if(/datum/patron/divine/ravox)
				target.visible_message(span_info("An air of righteous revelry and musical winds rises near [target]!"), span_notice("I'm filled with an urge to fight on and joyously!"))
				situational_bonus = 0
				// the bloodier the area around our target is, the more we heal
				for (var/obj/effect/decal/cleanable/blood/O in oview(5, target))
					situational_bonus = min(situational_bonus + 0.1, 2)
				conditional_buff = TRUE
			if(/datum/patron/divine/necra)
				target.visible_message(span_info("A sense of quiet respite radiates from [target]!"), span_notice("I feel the Undermaiden's gaze turn from me for now!"))
				if (iscarbon(target))
					var/mob/living/carbon/C = target
					// if the target is "close to death" (at or below 25% health)
					if (C.health <= (C.maxHealth * 0.25))
						conditional_buff = TRUE
						situational_bonus = 2.5
			if(/datum/patron/divine/xylix)
				target.visible_message(span_info("A fugue seems to manifest briefly across [target]!"), span_notice("My wounds vanish as if they had never been there! "))
				// half of the time, heal a little (or a lot) more - flip the coin
				if (prob(50))
					conditional_buff = TRUE
					situational_bonus = rand(1, 2.5)
			if(/datum/patron/divine/pestra)
				target.visible_message(span_info("A aura of green time-warping magick  encompasses [target]!"), span_notice("I'm sewn back together by sacred time medicine!"))
				// pestra always heals a little more toxin damage and restores a bit more blood
				target.adjustToxLoss(-situational_bonus)
				target.blood_volume += BLOOD_VOLUME_SURVIVE/2
			if(/datum/patron/divine/malum)
				target.visible_message("<span class='info'>A tempering heat is discharged out of [target]!</span>", "<span class='notice'>I feel the heat of a forge soothing my pains!</span>")
				var/list/firey_stuff = list(/obj/machinery/light/rogue/torchholder, /obj/machinery/light/rogue/campfire, /obj/machinery/light/rogue/hearth, /obj/machinery/light/rogue/wallfire, /obj/machinery/light/rogue/wallfire/candle, /obj/machinery/light/rogue/forge)
				// extra healing for every source of fire/light near us
				situational_bonus = 0
				for (var/obj/O in oview(5, user))
					if (O.type in firey_stuff)
						situational_bonus = min(situational_bonus + 0.5, 2.5)
				if (situational_bonus > 0)
					conditional_buff = TRUE
			if(/datum/patron/divine/eora)
				target.visible_message("<span class='info'>An emanance of love blossoms around [target]!</span>", "<span class='notice'>I'm filled with the restorative warmth of love!</span>")
				// if they're wearing an eoran bud (or are a pacifist), pretty much double the healing. if we're also wearing a bud at any point or a pacifist from any other source, apply another +15 bonus
				situational_bonus = 0
				if (HAS_TRAIT(target, TRAIT_PACIFISM))
					conditional_buff = TRUE
					situational_bonus = 2.5
				if (HAS_TRAIT(user, TRAIT_PACIFISM))
					conditional_buff = TRUE
					situational_bonus += 1.5
			if(/datum/patron/godless)
				target.visible_message(span_info("Raw energy in white and dark interwoven hews flow toward [target]."), span_notice("My wounds close without cause."))
			else
				target.visible_message(span_info("A choral sound comes from above and [target] is healed!"), span_notice("I am bathed in healing choral hymns!"))

		var/healing = 2.5
		if (conditional_buff)
			to_chat(user, "Channeling my patron's power is easier in these conditions!")
			healing += situational_bonus

		if(iscarbon(target))
			var/mob/living/carbon/C = target
			var/datum/status_effect/buff/healing/heal_effect = C.apply_status_effect(/datum/status_effect/buff/healing)
			heal_effect.healing_on_tick = healing
		else
			target.adjustBruteLoss(-healing*10)
			target.adjustFireLoss(-healing*10)
		return TRUE
	return FALSE

// Miracle
/obj/effect/proc_holder/spell/invoked/heal
	name = "Fortify"
	overlay_state = "astrata"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 4
	warnie = "sydwarning"
	movement_interrupt = FALSE
//	chargedloop = /datum/looping_sound/invokeholy
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/heal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 20 SECONDS
	miracle = TRUE
	devotion_cost = 20

/obj/effect/proc_holder/spell/invoked/heal/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(user.patron?.undead_hater && (target.mob_biotypes & MOB_UNDEAD)) //positive energy harms the undead
			target.visible_message(span_danger("[target] is burned by holy light!"), span_userdanger("I'm burned by holy light!"))
			target.adjustFireLoss(25)
			target.fire_act(1,10)
			return TRUE
		if(HAS_TRAIT(target, TRAIT_ASTRATA_CURSE))
			target.visible_message(span_danger("[target] recoils in pain!"), span_userdanger("Divine healing shuns me!"))
			target.cursed_freak_out()
			return FALSE
		if(HAS_TRAIT(target, TRAIT_ATHEISM_CURSE))
			target.visible_message(span_danger("[target] recoils in disgust!"), span_userdanger("These fools are trying to cure me with religion!!"))
			target.cursed_freak_out()
			return FALSE
		target.visible_message(span_info("A wreath of gentle light passes over [target]!"), span_notice("I'm bathed in holy light!"))
		if(iscarbon(target))
			var/mob/living/carbon/C = target
			C.apply_status_effect(/datum/status_effect/buff/fortify)
		else
			target.adjustBruteLoss(-50)
			target.adjustFireLoss(-50)
		return TRUE
	return FALSE



/////////////////////////////doctor "spells"////////////////////////

/obj/effect/proc_holder/spell/targeted/docheal  /////// miricle on 3x cooldown from normal
	action_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Rapid Treatment"
	overlay_state = "doc"
	range = 1
	include_user = TRUE
	sound = 'sound/gore/flesh_eat_03.ogg'
	associated_skill = /datum/skill/misc/medicine
	antimagic_allowed = TRUE
	charge_max = 60 SECONDS
	miracle = FALSE
	devotion_cost = 0

/obj/effect/proc_holder/spell/targeted/stable // sets ox lose to 0 knocks out some toxin, brings blood levels to safe. epi stabalizes ox lose, antihol purges booze, water and iron slowly restores blood.
	action_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Stabalizing Syringe"
	overlay_state = "stable"
	range = 1
	sound = 'modular/Smoker/sound/inject.ogg'
	associated_skill = /datum/skill/misc/medicine
	antimagic_allowed = TRUE
	include_user = TRUE
	charge_max = 5 MINUTES
	miracle = FALSE
	devotion_cost = 0

/obj/effect/proc_holder/spell/targeted/purge // Purges all reagents and clears all toxin damage while lowering blood levels and hitting with brute
	action_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Purifying Blood Draw"
	overlay_state = "snek"
	range = 1
	include_user = TRUE
	sound = 'sound/combat/newstuck.ogg'
	associated_skill = /datum/skill/misc/medicine
	antimagic_allowed = TRUE
	charge_max = 5 MINUTES
	miracle = FALSE
	devotion_cost = 0

/obj/effect/proc_holder/spell/targeted/docheal/cast(list/targets, mob/living/user)
	. = ..()
	if(iscarbon(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.visible_message(span_green("[user] tends to [target]'s wounds with the focus and purpose."), span_notice("I feel better already."))
		if(iscarbon(target))
			var/mob/living/carbon/C = target
			var/obj/item/bodypart/affecting = C.get_bodypart(check_zone(user.zone_selected))
			if(affecting)
				if(affecting.heal_damage(50, 50))
					C.update_damage_overlays()
				if(affecting.heal_wounds(50))
					C.update_damage_overlays()
		else
			target.adjustBruteLoss(-50)
			target.adjustFireLoss(-50)
		target.adjustToxLoss(-50)
		target.adjustOxyLoss(-50)
		target.blood_volume += BLOOD_VOLUME_SURVIVE
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/targeted/stable/cast(list/targets, mob/user) 
	. = ..()
	if(iscarbon(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/ramount = 10
		var/rid = /datum/reagent/medicine/stimu
		target.reagents.add_reagent(rid, ramount)
		target.visible_message(span_green("[user] stabs [target]'s chest with a syringe, causing there breathing to return to normal."), span_notice("I feel my breathing steady and grip on life tighten."))
		target.setOxyLoss(-100)
		target.adjustToxLoss(-50)
		target.emote("rage")
		target.blood_volume += BLOOD_VOLUME_SURVIVE
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/targeted/purge/cast(list/targets, mob/user) 
	. = ..()
	if(iscarbon(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/obj/item/bodypart/BPA = target.get_bodypart(BODY_ZONE_R_ARM)
		BPA.add_wound(/datum/wound/artery/)
		target.visible_message(span_danger("[user] slashes [target]'s artery open letting the toxins and other impurities bleed and drain from them. they might want to stitch that soon."), span_notice("I've been cut by [user] I feel the toxins leaving my body with each heart beat. im getting light headed...."))
		target.adjustToxLoss(-999)
		target.adjustBruteLoss(30, BRUTE, BPA)
		target.reagents.remove_all_type(/datum/reagent, 9999)
		target.emote("scream")
		return TRUE
	return FALSE
