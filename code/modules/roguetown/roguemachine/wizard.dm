#define UPGRADE_NOTAX		(1<<0)
#define UPGRADE_ARMOR		(1<<1)
#define UPGRADE_WEAPONS		(1<<2)
#define UPGRADE_FOOD		(1<<3)
#define UPGRADE_WARDROBE	(1<<4)

/obj/structure/roguemachine/wizardvend
	name = "ARCYNORUM"
	desc = "Avarice begets power."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "streetvendor1"
	density = TRUE
	blade_dulling = DULLING_BASH
	max_integrity = 0
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	var/list/held_items = list()
	var/locked = TRUE
	var/budget = 0
	var/upgrade_flags
	var/current_cat = "1"

/obj/structure/roguemachine/wizardvend/Initialize()
	. = ..()
	update_icon()

/obj/structure/roguemachine/wizardvend/update_icon()
	cut_overlays()
	if(obj_broken)
		set_light(0)
		return
	set_light(1, 1, "#1b7bf1")
	add_overlay(mutable_appearance(icon, "vendor-merch"))


/obj/structure/roguemachine/wizardvend/attackby(obj/item/P, mob/user, params)
	if(istype(P, /obj/item/roguekey))
		var/obj/item/roguekey/K = P
		if(K.lockid == "mage")
			locked = !locked
			playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			update_icon()
			return attack_hand(user)
		else
			to_chat(user, span_warning("Wrong key."))
			return
	if(istype(P, /obj/item/storage/keyring))
		var/obj/item/storage/keyring/K = P
		for(var/obj/item/roguekey/KE in K.keys)
			if(KE.lockid == "mage")
				locked = !locked
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
				update_icon()
				return attack_hand(user)
	if(istype(P, /obj/item/roguecoin))
		budget += P.get_real_price()
		qdel(P)
		update_icon()
		playsound(loc, 'sound/misc/machinevomit.ogg', 100, TRUE, -1)
		return attack_hand(user)
	..()

/obj/structure/roguemachine/wizardvend/Topic(href, href_list)
	. = ..()
	if(!ishuman(usr))
		return
	if(!usr.canUseTopic(src, BE_CLOSE) || locked)
		return
	if(href_list["buy"])
		var/mob/M = usr
		var/path = text2path(href_list["buy"])
		if(!ispath(path, /datum/supply_pack))
			message_admins("DISTINGUISHED DREAMER [usr.key] IS TRYING TO BUY A [path] WITH THE ARCYNORUM")
			return
		var/datum/supply_pack/PA = new path
		var/cost = PA.cost
		var/tax_amt=round(SStreasury.tax_value * cost)
		cost=cost+tax_amt
		if(upgrade_flags & UPGRADE_NOTAX)
			cost = PA.cost
		if(budget >= cost)
			budget -= cost
			if(!(upgrade_flags & UPGRADE_NOTAX))
				SStreasury.give_money_treasury(tax_amt, "arcynorum import tax")
		else
			say("Not enough!")
			return
		var/shoplength = PA.contains.len
		var/l
		for(l=1,l<=shoplength,l++)
			var/pathi = pick(PA.contains)
			var/obj/item/I = new pathi(get_turf(src))
			M.put_in_hands(I)
		qdel(PA)
	if(href_list["change"])
		if(budget > 0)
			budget2change(budget, usr)
			budget = 0
	if(href_list["changecat"])
		current_cat = href_list["changecat"]
	if(href_list["secrets"])
		var/list/options = list()
		if(upgrade_flags & UPGRADE_NOTAX)
			options += "Enable Paying Taxes"
		else
			options += "Stop Paying Taxes"
		/*if(!(upgrade_flags & UPGRADE_ARMOR))
			options += "Purchase Armors License (150)"
		if(!(upgrade_flags & UPGRADE_WEAPONS))
			options += "Purchase Weapons License (110)"
		if(!(upgrade_flags & UPGRADE_FOOD))
			options += "Purchase Pantry License (50)"
		if(!(upgrade_flags & UPGRADE_WARDROBE))
			options += "Purchase Wardrobe License (50)"*/
		var/select = input(usr, "Please select an option.", "", null) as null|anything in options
		if(!select)
			return
		if(!usr.canUseTopic(src, BE_CLOSE) || locked)
			return
		switch(select)
			if("Enable Paying Taxes")
				upgrade_flags &= ~UPGRADE_NOTAX
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			if("Stop Paying Taxes")
				upgrade_flags |= UPGRADE_NOTAX
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			/*if("Purchase Armors License (150)")
				if(upgrade_flags & UPGRADE_ARMOR)
					return
				if(budget < 150)
					say("Ask again when you're serious.")
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				budget -= 150
				upgrade_flags |= UPGRADE_ARMOR
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			if("Purchase Weapons License (110)")
				if(upgrade_flags & UPGRADE_WEAPONS)
					return
				if(budget < 110)
					say("Ask again when you're serious.")
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				budget -= 110
				upgrade_flags |= UPGRADE_WEAPONS
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			if("Purchase Pantry License (50)")
				if(upgrade_flags & UPGRADE_FOOD)
					return
				if(budget < 50)
					say("Ask again when you're serious.")
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				budget -= 50
				upgrade_flags |= UPGRADE_FOOD
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			if("Purchase Wardrobe License (50)")
				if(upgrade_flags & UPGRADE_WARDROBE)
					return
				if(budget < 50)
					say("Ask again when you're serious.")
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				budget -= 50
				upgrade_flags |= UPGRADE_WARDROBE
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)*/
	return attack_hand(usr)

/obj/structure/roguemachine/wizardvend/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(!ishuman(user))
		return
	if(locked)
		to_chat(user, span_warning("It's locked. Of course."))
		return
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	var/canread = user.can_read(src, TRUE)
	var/contents
	contents = "<center>ARCYNORUM - In the name of knowledge.<BR>"
	contents += "<a href='?src=[REF(src)];change=1'>MAMMON LOADED:</a> [budget]<BR>"

	var/mob/living/carbon/human/H = user
	if(H.job == "Court Magician" || "Magicians Apprentice")
		if(canread)
			contents += "<a href='?src=[REF(src)];secrets=1'>Secrets</a>"
		else
			contents += "<a href='?src=[REF(src)];secrets=1'>[stars("Secrets")]</a>"

	contents += "</center><BR>"

	var/list/unlocked_cats = list("Magic")
	/*if(upgrade_flags & UPGRADE_ARMOR)
		unlocked_cats+="Armor"
	if(upgrade_flags & UPGRADE_WEAPONS)
		unlocked_cats+="Weapons"
	if(upgrade_flags & UPGRADE_FOOD)
		unlocked_cats+="Consumable"
	if(upgrade_flags & UPGRADE_WARDROBE)
		unlocked_cats+="Wardrobe"*/

	if(current_cat == "1")
		contents += "<center>"
		for(var/X in unlocked_cats)
			contents += "<a href='?src=[REF(src)];changecat=[X]'>[X]</a><BR>"
		contents += "</center>"
	else
		contents += "<center>[current_cat]<BR></center>"
		contents += "<center><a href='?src=[REF(src)];changecat=1'>\[RETURN\]</a><BR><BR></center>"
		var/list/pax = list()
		for(var/pack in SSshuttle.supply_packs)
			var/datum/supply_pack/PA = SSshuttle.supply_packs[pack]
			if(PA.group == current_cat)
				pax += PA
		for(var/datum/supply_pack/PA in sortList(pax))
			var/costy = PA.cost
			if(!(upgrade_flags & UPGRADE_NOTAX))
				costy=round(costy+(SStreasury.tax_value * costy))
			contents += "[PA.name] [PA.contains.len > 1?"x[PA.contains.len]":""] - ([costy])<a href='?src=[REF(src)];buy=[PA.type]'>BUY</a><BR>"

	if(!canread)
		contents = stars(contents)

	var/datum/browser/popup = new(user, "VENDORTHING", "", 370, 600)
	popup.set_content(contents)
	popup.open()

/obj/structure/roguemachine/wizardvend/obj_break(damage_flag)
	..()
	budget2change(budget)
	set_light(0)
	update_icon()
	icon_state = "goldvendor0"

/obj/structure/roguemachine/wizardvend/Destroy()
	set_light(0)
	return ..()

/obj/structure/roguemachine/wizardvend/Initialize()
	. = ..()
	update_icon()
//	held_items[/obj/item/reagent_containers/glass/bottle/rogue/wine] = list("PRICE" = rand(23,33),"NAME" = "vino")
//	held_items[/obj/item/dmusicbox] = list("PRICE" = rand(444,777),"NAME" = "Music Box")

#undef UPGRADE_NOTAX
