
/obj/item/gun/ballistic/revolver/grenadelauncher/matchlock
	name = "matchlock"
	desc = "A deadly weapon that shoots a ball with terrific power."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "matchlock0"
	item_state = "matchlock"
	possible_item_intents = list(/datum/intent/shoot/matchlock, /datum/intent/arc/matchlock, INTENT_GENERIC)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/matchlock
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 1
	spread = 0
	can_parry = TRUE
	pin = /obj/item/firing_pin
	force = 10
	var/cocked = FALSE
	cartridge_wording = "musketball"
	load_sound = 'sound/foley/musketload.ogg'
	fire_sound = 'sound/combat/Ranged/musketfire.ogg'
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/steel
	var/damfactor = 5

/obj/item/gun/ballistic/revolver/grenadelauncher/matchlock/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 9,"ny" = -6,"wx" = -6,"wy" = -4,"ex" = 4,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 90,"wturn" = 93,"eturn" = -12,"nflip" = 0,"sflip" = 1,"wflip" = 0,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/datum/intent/shoot/matchlock
	chargedrain = 0 //no drain to aim a crossbow

/datum/intent/shoot/matchlock/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
		//skill block
		newtime = newtime + 18
		//per block
		newtime = newtime + 20
		newtime = newtime - (mastermob.STAPER)
		if(newtime > 0)
			return newtime
		else
			return 0.1
	return chargetime

/datum/intent/arc/matchlock
	chargetime = 1
	chargedrain = 0 //no drain to aim a crossbow

/datum/intent/arc/matchlock/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
		//skill block
		newtime = newtime + 18
		newtime = newtime - (mastermob.mind.get_skill_level(/datum/skill/combat/firearms) * 3)
		//per block
		newtime = newtime + 20
		newtime = newtime - (mastermob.STAPER)
		if(newtime > 0)
			return newtime
		else
			return 1
	return chargetime

/obj/item/gun/ballistic/revolver/grenadelauncher/matchlock/shoot_with_empty_chamber()
	if(cocked)
		playsound(src.loc, 'sound/foley/musketcock.ogg', 100, FALSE)
		cocked = FALSE
		update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/matchlock/attack_self(mob/living/user)
	if(chambered)
		..()
	else
		if(!cocked)
			to_chat(user, span_info("I ready the matchlock to be fired..."))
			if(do_after(user, 100 - user.STASTR, target = user))
				playsound(user, 'sound/foley/musketcock.ogg', 100, FALSE)
				cocked = TRUE
		else
			to_chat(user, span_warning("I carefully de-cock the matchlock."))
			cocked = FALSE
	update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/matchlock/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(cocked)
			if((loc == user) && (user.get_inactive_held_item() != src))
				return
			..()
		else
			to_chat(user, span_warning("I need to cock the matchlock first!"))


/obj/item/gun/ballistic/revolver/grenadelauncher/matchlock/process_fire/(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 10
		else
			spread = 150 - (150 * (user.client.chargedprog / 100))
	else
		spread = 0
	for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
		var/obj/projectile/BB = CB.BB
		BB.damage = BB.damage * damfactor

	cocked = FALSE
	..()

/obj/item/ammo_box/magazine/internal/shot/matchlock
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet
	caliber = "musketball"
	max_ammo = 1
	start_empty = TRUE
