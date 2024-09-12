// Spider spells/abilities
/obj/effect/proc_holder/spell/targeted/conjure_web
	name = "Conjure Web"
	desc = "Conjure webs where you stand"
	range = 1
	overlay_state = "null"
	releasedrain = 5
	charge_max = 30
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/webspin.ogg'
	invocation = null
	invocation_type = "none" //can be none, whisper, emote and shout
	antimagic_allowed = TRUE

/obj/effect/proc_holder/spell/targeted/conjure_web/cast(list/targets,mob/user = usr)
	. = ..()
	if(isopenturf(user.loc))
		var/turf/open/T = user.loc
		var/foundsurface
		for(var/X in GLOB.cardinals)
			var/turf/TU = get_step(T, X)
			if(TU && (isclosedturf(TU) || locate(/obj/structure/spider/stickyweb) in TU))
				foundsurface = TRUE
				break
		if(foundsurface)
			if(!locate(/obj/structure/spider/stickyweb) in T)
				new /obj/structure/spider/stickyweb(T)
		return TRUE
	to_chat(user, span_warning("It is too open or there are no adjacent webs for me to use."))
	return FALSE