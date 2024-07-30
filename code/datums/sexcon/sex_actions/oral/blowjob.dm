/datum/sex_action/blowjob
	name = "Suck them off"

/datum/sex_action/blowjob/shows_on_menu(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/datum/sex_action/blowjob/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/datum/sex_action/blowjob/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] starts sucking [target]'s cock..."))

/datum/sex_action/blowjob/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] sucks [target]'s cock..."))
	user.make_sucking_noise()

	user.sexcon.perform_sex_action(target, 2, 0, TRUE)
	if(!target.sexcon.considered_limp())
		user.sexcon.perform_deepthroat_oxyloss(user, 1.3)
	if(target.sexcon.check_active_ejaculation())
		target.visible_message(span_love("[target] cums into [user]'s mouth!"))
		target.sexcon.cum_into()

/datum/sex_action/blowjob/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops sucking [target]'s cock ..."))

/datum/sex_action/blowjob/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
