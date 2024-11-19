/obj/effect/proc_holder/spell/invoked/lesser_heal_inhumen
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

/obj/effect/proc_holder/spell/invoked/lesser_heal_inhumen/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/conditional_buff = FALSE
		var/situational_bonus = 1
		switch(user.patron.type)
			if(/datum/patron/inhumen/zizo)
				target.visible_message(span_info("shadow-like interwoven snakes lunge and dispere into [target]!"), span_notice("The shadows leave a chill, blood in my mouth -- yet I feel healed."))
				// set up a ritual pile of bones (or just cast near a stack of bones whatever) around us for massive bonuses, cap at 50 for 75 healing total (wowie)
				situational_bonus = 0
				for (var/obj/item/stack/sheet/bone/O in oview(5, user))
					situational_bonus += (O.amount * 0.5)
				if (situational_bonus > 0)
					conditional_buff = TRUE
					situational_bonus = min(situational_bonus, 5)
			if(/datum/patron/inhumen/graggar)
				target.visible_message(span_info("Blue Phoenix-Fires Envelop [target]!"), span_notice("The life around me pales as manna and the phoenix roar fills me. I am restored!"))
				// if you've got lingering toxin damage, you get healed more, but your bonus healing doesn't affect toxin
				var/toxloss = target.getToxLoss()
				if (toxloss >= 10)
					conditional_buff = TRUE
					situational_bonus = 2.5
					target.adjustToxLoss(situational_bonus) // remember we do a global toxloss adjust down below so this is okay
			if(/datum/patron/inhumen/matthios)
				target.visible_message(span_info("Shadows unfurl outward and across [target] as their form is restored!"), span_notice("I'm bathed in a... strange holy light?"))
				// COMRADES! WE MUST BAND TOGETHER!
				if (HAS_TRAIT(target, TRAIT_COMMIE))
					conditional_buff = TRUE
					situational_bonus = 2.5
			if(/datum/patron/inhumen/baotha)
				target.visible_message(span_info("A wreath of... strange light passes over [target]?"), span_notice("Something feels taken.. but the pain subsides. I am whole again."))
				// i wanted to do something with pain here but it doesn't seem like pain is actually parameterized anywhere so... better necra it is - if they're below 50% health, they get 25 extra healing
				if (iscarbon(target))
					var/mob/living/carbon/C = target
					if (C.health <= (C.maxHealth * 0.5))
						conditional_buff = TRUE
						situational_bonus = 2.5
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

/obj/effect/proc_holder/spell/invoked/revive_inhumen
	name = "Ressurection"
	overlay_state = "revive"
	releasedrain = 90
	chargedrain = 0
	chargetime = 30
	range = 1
	warnie = "sydwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	chargedloop = /datum/looping_sound/invokeholy
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/revive.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 2 MINUTES
	miracle = TRUE
	devotion_cost = 100
	var/revive_pq = PQ_GAIN_REVIVE

/obj/effect/proc_holder/spell/invoked/revive_inhumen/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		testing("revived1")
		var/mob/living/target = targets[1]
		if(target == user)
			return FALSE
		if(target.stat < DEAD)
			to_chat(user, span_warning("Nothing happens."))
			return FALSE
		target.adjustOxyLoss(-target.getOxyLoss())
		if(!target.revive(full_heal = FALSE))
			to_chat(user, span_warning("Nothing happens."))
			return FALSE
		testing("revived2")
		var/mob/living/carbon/spirit/underworld_spirit = target.get_spirit()
		if(underworld_spirit)
			var/mob/dead/observer/ghost = underworld_spirit.ghostize()
			qdel(underworld_spirit)
			ghost.mind.transfer_to(target, TRUE)
		target.grab_ghost(force = TRUE)
		target.remove_client_colour(/datum/client_colour/monochrome)
		target.emote("breathgasp")
		target.Jitter(100)
		if(isseelie(target))
			var/mob/living/carbon/human/fairy_target = target
			fairy_target.set_heartattack(FALSE)
			var/obj/item/organ/wings/Wing = fairy_target.getorganslot(ORGAN_SLOT_WINGS)
			if(Wing == null)
				var/wing_type = fairy_target.dna.species.organs[ORGAN_SLOT_WINGS]
				var/obj/item/organ/wings/seelie/new_wings = new wing_type()
				new_wings.Insert(fairy_target)
		target.update_body()
		target.visible_message(span_notice("[target] is revived by a gloaming hollow light!"), span_green("I awake from the realm before death, cut short of slipping entirely.."))
		if(target.mind)
			if(revive_pq && !HAS_TRAIT(target, TRAIT_IWASREVIVED) && user?.ckey)
				adjust_playerquality(revive_pq, user.ckey)
				ADD_TRAIT(target, TRAIT_IWASREVIVED, "[type]")
			target.mind.remove_antag_datum(/datum/antagonist/zombie)
		return TRUE
	return FALSE

