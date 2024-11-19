#define DRUGRADE_MONEYA				(1<<0)
#define DRUGRADE_MONEYB 	      	(1<<1)
#define DRUGRADE_NOTAX				(1<<5)

/obj/structure/roguemachine/drugmachine
	name = "TEMPTRESS"
	desc = "The mouth of an adultress is a deep pit..."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "streetvendor1"
	density = TRUE
	blade_dulling = DULLING_BASH
	max_integrity = 0
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	var/list/held_items = list()
	var/locked = FALSE
	var/budget = 0
	var/secret_budget = 0
	var/recent_payments = 0
	var/last_payout = 0
	var/drugrade_flags

/obj/structure/roguemachine/drugmachine/attackby(obj/item/P, mob/user, params)
	if(istype(P, /obj/item/roguekey))
		var/obj/item/roguekey/K = P
		if(K.lockid == "nightman")
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
			if(KE.lockid == "nightman")
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

/obj/structure/roguemachine/drugmachine/process()
	if(recent_payments)
		if(world.time > last_payout + rand(6 MINUTES,8 MINUTES))
			var/amt = recent_payments * 0.25
			if(drugrade_flags & DRUGRADE_MONEYA)
				amt = recent_payments * 0.50
			if(drugrade_flags & DRUGRADE_MONEYB)
				amt = recent_payments * 0.75
			recent_payments = 0
			send_ooc_note("<b>Income from TEMPTRESS:</b> [amt]", job = "Nightmaster")
			secret_budget += amt

/obj/structure/roguemachine/drugmachine/Topic(href, href_list)
	. = ..()
	if(!ishuman(usr))
		return
	if(href_list["buy"])
		if(!usr.canUseTopic(src, BE_CLOSE) || locked)
			return
		var/mob/M = usr
		var/O = text2path(href_list["buy"])
		if(held_items[O]["PRICE"])
			var/tax_amt = round(SStreasury.tax_value * held_items[O]["PRICE"])
			var/full_price = held_items[O]["PRICE"] + tax_amt
			if(drugrade_flags & DRUGRADE_NOTAX)
				full_price = held_items[O]["PRICE"]
			if(budget >= full_price)
				budget -= full_price
				recent_payments += held_items[O]["PRICE"]
				if(!(drugrade_flags & DRUGRADE_NOTAX))
					SStreasury.give_money_treasury(tax_amt, "TEMPTRESS import tax")
			else
				say("No sugar, no spice.")
				return
		var/obj/item/I = new O(get_turf(src))
		M.put_in_hands(I)
	if(href_list["change"])
		if(!usr.canUseTopic(src, BE_CLOSE) || locked)
			return
		if(budget > 0)
			budget2change(budget, usr)
			budget = 0
	if(href_list["secrets"])
		if(!usr.canUseTopic(src, BE_CLOSE) || locked)
			return
		var/list/options = list()
		options += "Withdraw Cut"
		if(drugrade_flags & DRUGRADE_NOTAX)
			options += "Enable Paying Taxes"
		else
			options += "Stop Paying Taxes"
		if(!(drugrade_flags & DRUGRADE_MONEYA))
			options += "Unlock 50% Cut (55)"
		else
			if(!(drugrade_flags & DRUGRADE_MONEYB))
				options += "Unlock 75% Cut (145)"
		var/select = input(usr, "Please select an option.", "", null) as null|anything in options
		if(!select)
			return
		if(!usr.canUseTopic(src, BE_CLOSE) || locked)
			return
		switch(select)
			if("Withdraw Cut")
				options = list("To Bank", "Direct")
				select = input(usr, "Please select an option.", "", null) as null|anything in options
				if(!select)
					return
				if(!usr.canUseTopic(src, BE_CLOSE) || locked)
					return
				switch(select)
					if("To Bank")
						var/mob/living/carbon/human/H = usr
						SStreasury.generate_money_account(secret_budget, H)
						secret_budget = 0
					if("Direct")
						if(secret_budget > 0)
							budget2change(secret_budget, usr)
							secret_budget = 0
			if("Enable Paying Taxes")
				drugrade_flags &= ~DRUGRADE_NOTAX
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			if("Stop Paying Taxes")
				drugrade_flags |= DRUGRADE_NOTAX
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			if("Unlock 50% Cut (55)")
				if(drugrade_flags & DRUGRADE_MONEYA)
					return
				if(budget < 55)
					say("Business before pleasure.")
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				budget -= 55
				drugrade_flags |= DRUGRADE_MONEYA
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			if("Unlock 75% Cut (145)")
				if(drugrade_flags & DRUGRADE_MONEYB)
					return
				if(budget < 145)
					say("I know what I'm worth.")
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				budget -= 145
				drugrade_flags |= DRUGRADE_MONEYB
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	return attack_hand(usr)

/obj/structure/roguemachine/drugmachine/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(!ishuman(user))
		return
	if(locked)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	var/canread = user.can_read(src, TRUE)
	var/contents
	if(canread)
		contents = "<center>TEMPTRESS - Just a taste.<BR>"
		contents += "<a href='?src=[REF(src)];change=1'>MAMMON LOADED:</a> [budget]<BR>"
	else
		contents = "<center>[stars("TEMPTRESS - Just a taste.")]<BR>"
		contents += "<a href='?src=[REF(src)];change=1'>[stars("MAMMON LOADED:")]</a> [budget]<BR>"


	var/mob/living/carbon/human/H = user
	if(H.job == "Nightmaster")
		if(canread)
			contents += "<a href='?src=[REF(src)];secrets=1'>Secrets</a>"
		else
			contents += "<a href='?src=[REF(src)];secrets=1'>[stars("Secrets")]</a>"

	contents += "</center><BR>"

	for(var/I in held_items)
		var/price = held_items[I]["PRICE"] + (SStreasury.tax_value * held_items[I]["PRICE"])
		var/namer = held_items[I]["NAME"]
		if(!price)
			price = "0"
		if(!namer)
			held_items[I]["NAME"] = "thing"
			namer = "thing"
		if(canread)
			contents += "[icon2html(I, user)] [namer] - [price] <a href='?src=[REF(src)];buy=[I]'>BUY</a>"
		else
			contents += "[icon2html(I, user)] [stars(namer)] - [stars(price)] <a href='?src=[REF(src)];buy=[I]'>[stars("BUY")]</a>"
		contents += "<BR>"

	var/datum/browser/popup = new(user, "VENDORTHING", "", 370, 400)
	popup.set_content(contents)
	popup.open()

/obj/structure/roguemachine/drugmachine/obj_break(damage_flag)
	..()
	budget2change(budget)
	set_light(0)
	update_icon()
	icon_state = "streetvendor0"

/obj/structure/roguemachine/drugmachine/update_icon()
	cut_overlays()
	if(obj_broken)
		set_light(0)
		return
	set_light(1, 1, "#1b7bf1")
	add_overlay(mutable_appearance(icon, "vendor-drug"))


/obj/structure/roguemachine/drugmachine/Destroy()
	set_light(0)
	STOP_PROCESSING(SSroguemachine, src)
	return ..()

/obj/structure/roguemachine/drugmachine/Initialize()
	. = ..()
	START_PROCESSING(SSroguemachine, src)
	update_icon()
	held_items[/obj/item/reagent_containers/powder/spice] = list("PRICE" = rand(20,30),"NAME" = "spice")
	held_items[/obj/item/reagent_containers/powder/ozium] = list("PRICE" = rand(6,15),"NAME" = "ozium")
	held_items[/obj/item/reagent_containers/powder/moondust] = list("PRICE" = rand(35,55),"NAME" = "moondust")
	held_items[/obj/item/clothing/mask/cigarette/rollie/cannabis] = list("PRICE" = rand(12,18),"NAME" = "swampweed zig")
	held_items[/obj/item/storage/fancy/shhig] = list("PRICE" = rand(15,25),"NAME" = "box of ssssigs")
	held_items[/obj/item/storage/box/matches] = list("PRICE" = rand(10,15),"NAME" = "tinderbox")
	held_items[/obj/item/reagent_containers/hypospray/medipen/sty/detox] = list("PRICE" = rand(15,20),"NAME" = "DETOX")
	held_items[/obj/item/reagent_containers/hypospray/medipen/sty/snekbt] = list("PRICE" = rand(35),"NAME" = "SNAKEBITE")
	held_items[/obj/item/reagent_containers/hypospray/medipen/sty/nourish] = list("PRICE" = rand(20),"NAME" = "NOURISH")
	held_items[/obj/item/storage/fancy/pilltinwake] = list("PRICE" = rand(25,30),"NAME" = "pep pills tin")
	held_items[/obj/item/reagent_containers/hypospray/medipen/sealbottle/purify] = list("PRICE" = rand(25,30),"NAME" = "PURIFY")
	held_items[/obj/item/storage/fancy/pilltinpink] = list("PRICE" = rand(25,35),"NAME" = "pink pill tin")
	held_items[/obj/item/natural/bundle/cloth/bandage/full] = list("PRICE" = rand(10,15),"NAME" = "roll of bandages")
	held_items[/obj/item/survivalcapsule/tent] = list("PRICE" = rand(15,20),"NAME" = "Tent crystal")
	held_items[/obj/item/survivalcapsule/smith] = list("PRICE" = rand(90,100),"NAME" = "Modest home crystal")
	held_items[/obj/item/survivalcapsule/wiz] = list("PRICE" = rand(600,800),"NAME" = "Luxury home crystal")
	held_items[/obj/item/reagent_containers/glass/alembic] = list("PRICE" = rand(30,40),"NAME" = "alembic")

#undef DRUGRADE_MONEYA
#undef DRUGRADE_MONEYB
#undef DRUGRADE_NOTAX
