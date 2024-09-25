//==============================================
//	COMPELLED DUEL
//==============================================
/obj/effect/proc_holder/spell/invoked/compelledduel5e
	name = "Compelled Duel"
	overlay_state = "null"
	releasedrain = 0
	chargetime = 1
	charge_max = 1 SECONDS
	//charge_max = 130 SECONDS
	range = 2
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = ""
	invocation_type = "shout" //can be none, whisper, emote and shout

/obj/effect/proc_holder/spell/invoked/compelledduel5e/cast(list/targets, mob/living/user)
	var/mob/living/carbon/target = targets[1]
	if (isLiving(target))
		
		//user is pacified due to the pop-up on the opponents screen
		user.apply_status_effect(/datum/status_effect/buff/compelledduel5epacify)
		//target is pacified due to the user being pacified, cant ignore prompt and get the upperhand.
		target.apply_status_effect(/datum/status_effect/buff/compelledduel5epacify)

		var/choice = alert(target, "[user] challenges you to a duel!", "", "Accept!", "Decline!")
		switch(choice)
			if("Accept!")
				var/datum/status_effect/buff/compelledduel5e userBuff = new /datum/status_effect/buff/compelledduel5e
				var/datum/status_effect/buff/compelledduel5e targetBuff = new /datum/status_effect/buff/compelledduel5e

				//set duel allowed targets
				userBuff.enemy = target
				targetBuff.enemy = user

				//give them the duel for 135 seconds
				user.apply_status_effect(targetBuff)
				target.apply_status_effect(userBuff)

				//give them both a 3 second pacifist trait to prepare
				user.apply_status_effect(/datum/status_effect/buff/compelledduel5epacify)
				target.apply_status_effect(/datum/status_effect/buff/compelledduel5epacify)
				
				//target flourishes his blade or gets into a fighting stance

			if("Decline!")
				//target is a coward, shame them
				var/datum/status_effect/buff/compelledduel5eshame shame = new /datum/status_effect/buff/compelledduel5eshame
				shame.shamer = user
				target.apply_status_effect(shame)
				//user laugh
				//target whimper

/datum/status_effect/buff/compelledduel5e
	id = "compelled duel"
	alert_type = /atom/movable/screen/alert/status_effect/buff/boomingblade5e
	duration = 135 SECONDS //a minute 30 seconds + 5 seconds for the pacify
	var/mob/living/carbon/enemy

/atom/movable/screen/alert/status_effect/buff/compelledduel5e
	name = "Compelled Duel"
	desc = "I am only able to attack [enemy]."
	icon_state = "debuff"

/datum/status_effect/buff/compelledduel5e/on_apply()
	. = ..()
	var/mob/living/target = owner
	ADD_TRAIT(target, TRAIT_NORUN, TRAIT_GENERIC)

/datum/status_effect/buff/compelledduel5e/on_remove()
	var/mob/living/target = owner
	REMOVE_TRAIT(target, TRAIT_NORUN, TRAIT_GENERIC)
	. = ..()`

//duel prep 
/datum/status_effect/buff/compelledduel5epacify
	id = "duel prepare"
	alert_type = /atom/movable/screen/alert/status_effect/buff/compelledduel5epacify
	duration = 3 SECONDS

/atom/movable/screen/alert/status_effect/buff/compelledduel5epacify
	name = "Duel Preparation"
	desc = "I am preparing for my duel"
	icon_state = "debuff"

/datum/status_effect/buff/compelledduel5epacify/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_PACIFISM, TRAIT_GENERIC)

/datum/status_effect/buff/compelledduel5epacify/on_remove()
	ADD_TRAIT(owner, TRAIT_PACIFISM, TRAIT_GENERIC)
	. = ..()

//duel reject shame 
/datum/status_effect/buff/compelledduel5eshame
	id = "shame"
	alert_type = /atom/movable/screen/alert/status_effect/buff/compelledduel5eshame
	effectedstats = list("fortune" = -3, "speed" = -1)
	duration = 300 SECONDS
	var/mob/living/carbon/shamer

/atom/movable/screen/alert/status_effect/buff/compelledduel5eshame
	name = "Shame"
	desc = "I have been shamed by [shamer]"
	icon_state = "debuff"
