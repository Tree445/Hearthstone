/datum/sex_action/masturbate_anus
	name = "Finger butt"

/datum/sex_action/masturbate_anus/shows_on_menu(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	return TRUE

/datum/sex_action/masturbate_anus/can_perform(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			return FALSE
	return TRUE

/datum/sex_action/masturbate_anus/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] starts fingering their butt..."))

/datum/sex_action/masturbate_anus/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fingers their butt..."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 6, TRUE)
	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/masturbate_anus/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops fingering their butt."))

/datum/sex_action/masturbate_anus/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
