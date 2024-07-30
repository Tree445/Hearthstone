/datum/sex_action/masturbate_penis
	name = "Jerk off"

/datum/sex_action/masturbate_penis/shows_on_menu(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_penis/can_perform(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	if(!user.sexcon.can_use_penis())
		return
	return TRUE

/datum/sex_action/masturbate_penis/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] starts jerking off..."))

/datum/sex_action/masturbate_penis/on_perform(mob/living/user, mob/living/target)
	var/chosen_verb = pick(list("jerks their cock", "strokes their cock", "masturbates", "jerks off"))
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] [chosen_verb]..."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 0, TRUE)

	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/masturbate_penis/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops jerking off."))

/datum/sex_action/masturbate_penis/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
