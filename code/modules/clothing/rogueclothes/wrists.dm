/obj/item/clothing/wrists/roguetown
	slot_flags = ITEM_SLOT_WRISTS
	sleeved = 'icons/roguetown/clothing/onmob/wrists.dmi'
	icon = 'icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/wrists.dmi'
	sleevetype = "shirt"

/obj/item/clothing/wrists/roguetown/bracers
	name = "bracers"
	desc = "Steel bracers to protect the forearm."
	body_parts_covered = ARMS
	icon_state = "bracers"
	item_state = "bracers"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	max_integrity = 150
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/wrists/roguetown/vambraces
	name = "iron couter"
	desc = "Protection mainly focused around the elbows."
	body_parts_covered = ARMS
	icon_state = "vambraces"
	item_state = "vambraces"
	armor = list("blunt" = 70, "slash" = 90, "stab" = 60, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	max_integrity = 100
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/wrists/roguetown/bracers/carapace
	name = "carapace bracers"
	desc = "Fiber bracers lined with carapace to protect your wrists"
	body_parts_covered = ARMS
	icon_state = "carapace_bracers"
	item_state = "carapace_bracers"
	armor = list("blunt" = 60, "slash" = 100, "stab" = 60, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	max_integrity = 150
	anvilrepair = null
	smeltresult = /obj/item/ash
	sewrepair = TRUE
/obj/item/clothing/wrists/roguetown/bracers/carapace/dragon
	name = "dragon bracers"
	desc = "Fiber bracers lined with dragonbone to protect your wrists"
	color = "red"
	armor = list("blunt" = 80, "slash" = 100, "stab" = 60, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 0)

/obj/item/clothing/wrists/roguetown/bracers/leather
	name = "leather bracers"
	desc = "Leather bracers worn on the wrists."
	icon_state = "lbracers"
	item_state = "lbracers"
	armor = list("blunt" = 32, "slash" = 12, "stab" = 22, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = null
	blocksound = SOFTHIT

	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE

/obj/item/clothing/wrists/roguetown/wrappings
	name = "solar wrappings"
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "wrappings"
	item_state = "wrappings"
	sewrepair = TRUE

/obj/item/clothing/wrists/roguetown/nocwrappings
	name = "moon wrappings"
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "nocwrappings"
	item_state = "nocwrappings"
	sewrepair = TRUE

/obj/item/clothing/wrists/roguetown/nephilbracers
	name = "nephilim bracers"
	desc = "Bracers once worn by the descendents of giants."
	body_parts_covered = ARMS
	icon_state = "nephilimwrist"
	item_state = "nephilimwrist"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	max_integrity = 150
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ash

/obj/item/clothing/wrists/roguetown/hiddenblade
	name = "bracers"
	desc = "Bracers with a hidden blade within."
	body_parts_covered = ARMS
	icon_state = "lbracers"
	item_state = "lbracers"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	max_integrity = 150
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	var/extended = FALSE
	var/obj/item/rogueweapon/huntingknife/idagger/steel/parrying/hidden/hid

/obj/item/clothing/wrists/roguetown/hiddenblade/attack_right(mob/user)
	toggleblades(user)

/obj/item/clothing/wrists/roguetown/hiddenblade/attackby(obj/A, mob/user, params)
	if(istype(A, /obj/item/rogueweapon/huntingknife/idagger/steel/parrying/hidden))
		toggleblades(user)
		return ..()

/obj/item/clothing/wrists/roguetown/hiddenblade/proc/toggleblades(mob/user)
	hid = user.get_active_held_item()

	if(extended)
		if(istype(user.get_active_held_item(), /obj/item/rogueweapon/huntingknife/idagger/steel/parrying/hidden))
			user.dropItemToGround(hid, TRUE)
			user.visible_message("<span class='info'>A blade retracts into [user]'s bracer.</span>", "<span class='notice'>My hidden blade retracts into my bracer.</span>")
			extended = FALSE
			REMOVE_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)
	else
		hid = new(user,1)
		ADD_TRAIT(hid, TRAIT_NODROP, TRAIT_GENERIC)
		ADD_TRAIT(hid, TRAIT_NOEMBED, TRAIT_GENERIC)
		user.put_in_hands(hid, TRUE, FALSE, TRUE)
		user.visible_message("<span class='info'>A blade ejects out from [user]'s bracer.</span>", "<span class='notice'>My hidden blade ejects out of my bracer.</span>")
		extended = TRUE
		ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)


/obj/item/rogueweapon/huntingknife/idagger/steel/parrying/hidden
	name = "hidden blade"
	desc = ""
	embedding = list("embedded_pain_multiplier" = 0, "embed_chance" = 0, "embedded_fall_chance" = 0)
	item_flags = DROPDEL
