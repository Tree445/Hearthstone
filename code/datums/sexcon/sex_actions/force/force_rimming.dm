/datum/sex_action/force_rimming
	name = "Force them to rim you"
	require_grab = TRUE
	stamina_cost = 1.0

/datum/sex_action/force_rimming/shows_on_menu(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	return TRUE

/datum/sex_action/force_rimming/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/datum/sex_action/force_rimming/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] shoves [target]'s head against his butt!"))

/datum/sex_action/force_rimming/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] forces [target] to rim his butt."))
	target.make_sucking_noise()

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	user.sexcon.handle_passive_ejaculation()

	user.sexcon.perform_sex_action(target, 0, 2, FALSE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/force_rimming/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] pulls [target]'s head away from his butt."))

/datum/sex_action/force_rimming/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
