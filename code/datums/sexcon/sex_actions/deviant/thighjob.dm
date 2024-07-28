/datum/sex_action/thighjob
	name = "Use their thighs to get off"

/datum/sex_action/thighjob/shows_on_menu(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return
	return TRUE

/datum/sex_action/thighjob/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/datum/sex_action/thighjob/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] grabs [target]'s thighs and shoves their cock inbetween!"))

/datum/sex_action/thighjob/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s thighs."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 20, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/thighjob/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] pulls their cock out from inbetween [target]'s thighs."))
