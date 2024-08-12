/obj/effect/proc_holder/spell/invoked/berserk
	name = "Berserk"
	overlay_state = "curse2"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 0
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/vo/mobs/simple_orcs/orc_yell2.ogg'
	invocation = "RAAAAAAAAAAAAAGH!!!!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 120 SECONDS
	miracle = TRUE
	devotion_cost = 100



/obj/effect/proc_holder/spell/invoked/berserk/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.apply_status_effect(/datum/status_effect/buff/ozium)
		target.visible_message("<span class='info'>A rage of bestial resolve overtakes [target]!</span>", "<span class='notice'>Rage empowers me!</span>")
		target.blur_eyes(20)
		return TRUE
	return FALSE

/*      I'll mess with this later need to pull some of it out for the revival surgery plans, striked out for now just so the parts I need are easier to transplant. 

/obj/effect/proc_holder/spell/invoked/rebirth
	name = "Rebirth"
	overlay_state = "limb_attach"
	releasedrain = 90
	chargedrain = 0
	chargetime = 50
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
	devotion_cost = 120

/obj/effect/proc_holder/spell/invoked/rebirth/proc/get_organs(mob/living/target, mob/living/user)
	var/list/missing_organs = list(
		ORGAN_SLOT_EARS,
		ORGAN_SLOT_EYES,
		ORGAN_SLOT_TONGUE,
		ORGAN_SLOT_HEART,
		ORGAN_SLOT_LUNGS,
		ORGAN_SLOT_LIVER,
		ORGAN_SLOT_STOMACH,
		ORGAN_SLOT_APPENDIX,
	)
	for(var/missing_organ_slot in missing_organs)
		if(!target.getorganslot(missing_organ_slot))
			continue
		missing_organs -= missing_organ_slot
	if(!length(missing_organs))
		return
	var/list/organs = list()
	//try to get from user's hands first
	for(var/obj/item/organ/potential_organ in user?.held_items)
		if(potential_organ.owner || !(potential_organ.slot in missing_organs))
			continue
		organs += potential_organ
	//then target's hands
	for(var/obj/item/organ/dismembered in target.held_items)
		if(dismembered.owner || !(dismembered.slot in missing_organs))
			continue
		organs += dismembered
	//then finally, 1 tile range around target
	for(var/obj/item/organ/dismembered in range(1, target))
		if(dismembered.owner || !(dismembered.slot in missing_organs))
			continue
		organs += dismembered
	return organs

/obj/effect/proc_holder/spell/invoked/rebirth/proc/get_limbs(mob/living/target, mob/living/user)
	var/list/missing_limbs = target.get_missing_limbs()
	if(!length(missing_limbs))
		return
	var/list/limbs = list()
	//try to get from user's hands first
	for(var/obj/item/bodypart/potential_limb in user?.held_items)
		if(potential_limb.owner || !(potential_limb.body_zone in missing_limbs))
			continue
		limbs += potential_limb
	//then target's hands
	for(var/obj/item/bodypart/dismembered in target.held_items)
		if(dismembered.owner || !(dismembered.body_zone in missing_limbs))
			continue
		limbs += dismembered
	//then finally, 1 tile range around target
	for(var/obj/item/bodypart/dismembered in range(1, target))
		if(dismembered.owner || !(dismembered.body_zone in missing_limbs))
			continue
		limbs += dismembered
	return limbs

// consider adding functionality to regrow one entire organ or limb per casting?
/obj/effect/proc_holder/spell/invoked/rebirth/cast(list/targets, mob/living/user)
	. = ..()
	if(ishuman(targets[1]))
		var/mob/living/carbon/human/human_target = targets[1]
		if(HAS_TRAIT(human_target, TRAIT_FAITHLESS)) //go find a surgeon, non-believer
			to_chat(user, span_warning("The gods turn a blind eye. They will not aiding a non-believer!"))
			return FALSE
		for(var/obj/item/bodypart/limb as anything in get_limbs(human_target, user))
			if(human_target.get_bodypart(limb.body_zone) || !limb.attach_limb(human_target))
				continue
			human_target.visible_message(span_info("\The [limb] attaches itself to [human_target]!"), \
			span_notice("\The [limb] attaches itself to me!"))
		for(var/obj/item/organ/organ as anything in get_organs(human_target, user))
			if(human_target.getorganslot(organ.slot) || !organ.Insert(human_target))
				continue
			human_target.visible_message(span_info("\The [organ] attaches itself to [human_target]!"), \
			span_notice("\The [organ] attaches itself to me!"))
		if(!(human_target.mob_biotypes & MOB_UNDEAD))
			for(var/obj/item/bodypart/limb as anything in human_target.bodyparts)
				limb.rotted = FALSE
				limb.skeletonized = FALSE
		human_target.update_body()
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/invoked/rebirth/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		testing("curerot1")
		var/mob/living/target = targets[1]
		if(HAS_TRAIT(target, TRAIT_FAITHLESS))
			to_chat(user, span_warning("The gods turn a blind eye. They will not aiding a non-believer!"))
			return FALSE
		if(target == user)
			return FALSE
		var/datum/antagonist/zombie/was_zombie = target.mind?.has_antag_datum(/datum/antagonist/zombie)
		var/has_rot = was_zombie
		if(!has_rot && iscarbon(target))
			var/mob/living/carbon/stinky = target
			for(var/obj/item/bodypart/bodypart as anything in stinky.bodyparts)
				if(bodypart.rotted || bodypart.skeletonized)
					has_rot = TRUE
					break
		if(!has_rot)
			to_chat(user, span_warning("Nothing happens."))
			return FALSE
		if(GLOB.tod == "night")
			to_chat(user, span_warning("Let there be light."))
		for(var/obj/structure/fluff/psycross/S in oview(5, user))
			S.AOE_flash(user, range = 8)
		testing("curerot2")
		if(was_zombie)
			if(was_zombie.become_rotman && prob(95)) //95% chance to NOT become a rotman
				was_zombie.become_rotman = FALSE
			target.mind.remove_antag_datum(/datum/antagonist/zombie)
			target.Unconscious(20 SECONDS)
			target.emote("breathgasp")
			target.Jitter(100)
		var/datum/component/rot/rot = target.GetComponent(/datum/component/rot)
		if(rot)
			rot.amount = 0
		if(iscarbon(target))
			var/mob/living/carbon/stinky = target
			for(var/obj/item/bodypart/rotty in stinky.bodyparts)
				rotty.rotted = FALSE
				rotty.skeletonized = FALSE
				rotty.update_limb()
				rotty.update_disabled()
		target.update_body()
		if(!HAS_TRAIT(target, TRAIT_ROTMAN))
			target.visible_message(span_notice("The rot leaves [target]'s body!"), span_green("I feel the rot leave my body!"))
		else
			target.visible_message(span_warning("The rot fails to leave [target]'s body!"), span_warning("I feel no different..."))
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/invoked/rebirth/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		testing("revived1")
		var/mob/living/target = targets[1]
		if(HAS_TRAIT(target, TRAIT_FAITHLESS))
			to_chat(user, span_warning("The gods turn a blind eye. They will not aiding a non-believer!"))
			return FALSE
		if(target == user)
			return FALSE
		if(target.stat < DEAD)
			to_chat(user, span_warning("Nothing happens."))
			return FALSE
		if(GLOB.tod == "night")
			to_chat(user, span_warning("Return to us anew."))
		for(var/obj/structure/fluff/psycross/S in oview(5, user))
			S.AOE_flash(user, range = 8)
		if(!target.revive(full_heal = FALSE))
			to_chat(user, span_warning("Nothing happens."))
			return FALSE
		testing("revived2")
		var/mob/living/carbon/spirit/underworld_spirit = target.get_spirit()
		//GET OVER HERE!
		if(underworld_spirit)
			var/mob/dead/observer/ghost = underworld_spirit.ghostize()
			qdel(underworld_spirit)
			ghost.mind.transfer_to(target, TRUE)
		target.grab_ghost(force = TRUE) // even suicides
		target.emote("breathgasp")
		target.Jitter(100)
		target.update_body()
		target.visible_message(span_notice("[target] is revived by holy light!"), span_green("I awake from the void."))
		if(target.mind)
			target.mind.remove_antag_datum(/datum/antagonist/zombie)
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/invoked/rebirth/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		return FALSE
	var/found = null
	for(var/obj/machinery/light/rogue/campfire/densefire/S in oview(5, user))
		found = S
	if(!found)
		to_chat(user, span_warning("I need a grand fire."))
		return FALSE
	return TRUE
	*/
