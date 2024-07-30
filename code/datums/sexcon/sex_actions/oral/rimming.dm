/datum/sex_action/rimming
	name = "Rim them"

/datum/sex_action/rimming/shows_on_menu(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	return TRUE

/datum/sex_action/rimming/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/datum/sex_action/rimming/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] starts rimming [target]'s butt..."))

/datum/sex_action/rimming/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] rims [target]'s butt..."))
	user.make_sucking_noise()

	user.sexcon.perform_sex_action(target, 2, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/rimming/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops rimming [target]'s butt ..."))

/datum/sex_action/rimming/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
