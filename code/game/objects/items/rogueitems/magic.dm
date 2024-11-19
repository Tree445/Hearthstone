/////////////////////////////////////////Scrying///////////////////

/obj/item/scrying
	name = "scrying orb"
	desc = "On it's glass depths, you can scry on many beings... After each use it must recharge for five minutes."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state ="scrying"
	throw_speed = 3
	throw_range = 7
	throwforce = 15
	damtype = BURN
	force = 15
	hitsound = 'sound/blank.ogg'
	sellprice = 900 //its bought for 1k so maybe its fine
	dropshrink = 0.6

	var/mob/current_owner
	var/last_scry
	var/cooldown = 3 MINUTES	

/obj/item/scrying/eye
	name = "accursed eye"
	desc = "It is pulsating."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state ="scryeye"
	cooldown = 5 MINUTES

/obj/item/scrying/attack_self(mob/living/user)
	. = ..()
	if(!user.mind)
		return
	if(world.time < last_scry + cooldown)
		to_chat(user, span_warning("I look into the ball but only see inky smoke. Maybe I should wait."))
		return
	var/input = stripped_input(user, "Who are you looking for?", "Scrying Orb")
	if(!input)
		return
	if(!user.key)
		return
	if(world.time < last_scry + cooldown)
		to_chat(user, span_warning("I look into the ball but only see inky smoke. Maybe I should wait."))
		return
	if(!user.mind || !user.mind.do_i_know(name=input))
		to_chat(user, span_warning("I don't know anyone by that name."))
		return
	var/arcane_skill = user.mind.get_skill_level(/datum/skill/magic/arcane)
	var/success_chance = 0
	switch(arcane_skill)
		if(SKILL_LEVEL_NONE)
			success_chance = 50
		if(SKILL_LEVEL_NOVICE)
			success_chance = 65
		if(SKILL_LEVEL_APPRENTICE) //Apprentices have this
			success_chance = 80
		if(SKILL_LEVEL_JOURNEYMAN) // Adventurer mages have this
			success_chance = 90
		if(SKILL_LEVEL_EXPERT)
			success_chance = 94
		if(SKILL_LEVEL_MASTER) // Magus has this
			success_chance = 97
		if(SKILL_LEVEL_LEGENDARY)
			success_chance = 100
	if(!prob(success_chance))
		to_chat(user, span_boldwarning("You focus your thoughts on the orb, but feel a sharp pain!"))
		visible_message("\The [src] shatters!")
		user.flash_fullscreen("redflash1")
		new /obj/item/shard(get_turf(src))
		playsound(src, "shatter", 70, TRUE)
		qdel(src)
		return
	for(var/mob/living/carbon/human/HL in GLOB.human_list)
		if(HL.real_name == input)
			if(!HAS_TRAIT(HL, TRAIT_NODETECT))
				message_admins("[HL.real_name]")
				var/turf/T = get_turf(HL)
				if(!T)
					continue
				var/mob/dead/observer/screye/S = user.scry_ghost()
				if(!S)
					return
				S.ManualFollow(HL)
				last_scry = world.time
				user.visible_message(span_danger("[user] stares into [src], [user.p_their()] eyes rolling back into [user.p_their()] head."))
				message_admins("SCRYING: [user] ([user.ckey]) has used the scrying orb to leer at [HL] ([HL.ckey])")
				log_game("SCRYING: [user] ([user.ckey]) has used the scrying orb to leer at [HL] ([HL.ckey])")
				addtimer(CALLBACK(S, TYPE_PROC_REF(/mob/dead/observer, reenter_corpse)), 8 SECONDS)
				if(!HL.stat)
					if(HL.STAPER >= 11)
						if(HL.mind)
							if(HL.mind.do_i_know(name=user.real_name))
								to_chat(HL, span_warning("I can clearly see the face of [user.real_name] staring at me!."))
								return
						to_chat(HL, span_warning("I can clearly see the face of an unknown [user.gender == FEMALE ? "woman" : "man"] staring at me!"))
						return
					if(HL.STAPER >= 9)
						to_chat(HL, span_warning("I feel a pair of unknown eyes on me."))
				return
			else
				to_chat(user, span_warning("I peer into the ball, but the orb refuses track [input]."))
	to_chat(user, span_warning("I peer into the ball, but can't find [input]."))
	return

/////////////////////////////////////////Crystal ball ghsot vision///////////////////

/obj/item/crystalball/attack_self(mob/user)
	user.visible_message(span_danger("[user] stares into [src], \their eyes rolling back into \their head."))
	user.ghostize(1)
