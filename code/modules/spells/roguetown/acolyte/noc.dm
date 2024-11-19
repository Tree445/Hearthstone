// Noc/ Moon / Trickery / Illusion Spells
/obj/effect/proc_holder/spell/invoked/blindness
    name = "Blindness"
    overlay_state = "blindness"
    req_items = list(/obj/item/clothing/neck/roguetown/psicross)
    releasedrain = 30
    chargedrain = 0
    chargetime = 0
    range = 7
    warnie = "sydwarning"
    movement_interrupt = FALSE
    sound = 'sound/magic/churn.ogg'
    invocation = ""
    invocation_type = "none" //can be none, whisper, emote and shout
    associated_skill = /datum/skill/magic/arcane
    antimagic_allowed = TRUE
    miracle = FALSE
    charge_max = 15 SECONDS
    devotion_cost = 0

/obj/effect/proc_holder/spell/invoked/blindness/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		target.visible_message(span_warning("[user] points at [target]'s eyes!"),span_warning("My eyes are covered in darkness!"))
		target.blind_eyes(2)
	return TRUE

/obj/effect/proc_holder/spell/invoked/invisibility
	name = "Invisibility"
	overlay_state = "invisibility"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	charge_max = 30 SECONDS
	range = 3
	warnie = "sydwarning"
	movement_interrupt = FALSE
	invocation_type = "whisper"
	sound = 'sound/misc/area.ogg' //This sound doesnt play for some reason. Fix me.
	associated_skill = /datum/skill/magic/arcane
	antimagic_allowed = TRUE
	miracle = FALSE
	devotion_cost = 0

/obj/effect/proc_holder/spell/invoked/invisibility/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		for(var/mob/living/simple_animal/hostile/nearmob in viewers(12, target))
			if(nearmob.target == target)
				nearmob.LoseTarget()
		for(var/mob/living/carbon/human/nearmob in viewers(12, target))
			if(nearmob.target == target)
				nearmob.back_to_idle()
		target.visible_message(span_warning("[target] starts to fade into thin air!"), span_notice("You start to become invisible!"))
		animate(target, alpha = 80, time = 1 SECONDS, easing = EASE_IN)
		target.mob_timers[MT_INVISIBILITY] = world.time + 15 SECONDS
		addtimer(CALLBACK(target, TYPE_PROC_REF(/mob/living, update_sneak_invis), TRUE), 15 SECONDS)
		addtimer(CALLBACK(target, TYPE_PROC_REF(/atom/movable, visible_message), span_warning("[target] fades back into view."), span_notice("You become visible again.")), 15 SECONDS)
	return FALSE
