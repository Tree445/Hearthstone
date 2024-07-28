/datum/sex_action/tonguebath
	name = "Bathe with tongue"

/datum/sex_action/tonguebath/shows_on_menu(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	return TRUE

/datum/sex_action/tonguebath/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/datum/sex_action/tonguebath/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] sticks their tongue out, getting close to [target]..."))

/datum/sex_action/tonguebath/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] bathes [target]'s body with their tongue..."))
	user.make_sucking_noise()

	user.sexcon.perform_sex_action(target, 0.5, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/tonguebath/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops bathing [target]'s body ..."))

/datum/sex_action/tonguebath/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
