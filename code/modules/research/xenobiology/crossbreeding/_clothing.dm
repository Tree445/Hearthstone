/*
Slimecrossing Armor
	Armor added by the slimecrossing system.
	Collected here for clarity.
*/

//Rebreather mask - Chilling Blue
/obj/item/clothing/mask/nobreath
	name = "rebreather mask"
	desc = ""
	icon_state = "slime"
	item_state = "slime"
	body_parts_covered = NONE
	w_class = WEIGHT_CLASS_SMALL
	gas_transfer_coefficient = 0
	permeability_coefficient = 0.5
	flags_cover = MASKCOVERSMOUTH
	resistance_flags = NONE

/obj/item/clothing/mask/nobreath/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == SLOT_WEAR_MASK)
		ADD_TRAIT(user, TRAIT_NOBREATH, "breathmask_[REF(src)]")
		user.failed_last_breath = FALSE
		user.clear_alert("not_enough_oxy")
		user.apply_status_effect(/datum/status_effect/rebreathing)

/obj/item/clothing/mask/nobreath/dropped(mob/living/carbon/human/user)
	..()
	REMOVE_TRAIT(user, TRAIT_NOBREATH, "breathmask_[REF(src)]")
	user.remove_status_effect(/datum/status_effect/rebreathing)

/obj/item/clothing/glasses/prism_glasses
	name = "prism glasses"
	desc = ""
	icon = 'icons/obj/slimecrossing.dmi'
	icon_state = "prismglasses"
	actions_types = list(/datum/action/item_action/change_prism_colour, /datum/action/item_action/place_light_prism)
	var/glasses_color = "#FFFFFF"

/obj/item/clothing/glasses/prism_glasses/item_action_slot_check(slot)
	if(slot == SLOT_GLASSES)
		return TRUE

/obj/structure/light_prism
	name = "light prism"
	desc = ""
	icon = 'icons/obj/slimecrossing.dmi'
	icon_state = "lightprism"
	density = FALSE
	anchored = TRUE
	max_integrity = 10

/obj/structure/light_prism/Initialize(mapload, newcolor)
	. = ..()
	color = newcolor
	light_color = newcolor
	set_light(5)

/obj/structure/light_prism/attack_hand(mob/user)
	to_chat(user, span_notice("I dispel [src]."))
	qdel(src)

/datum/action/item_action/change_prism_colour
	name = "Adjust Prismatic Lens"
	icon_icon = 'icons/obj/slimecrossing.dmi'
	button_icon_state = "prismcolor"

/datum/action/item_action/change_prism_colour/Trigger()
	if(!IsAvailable())
		return
	var/obj/item/clothing/glasses/prism_glasses/glasses = target
	var/new_color = input(owner, "Choose the lens color:", "Color change",glasses.glasses_color) as color|null
	if(!new_color)
		return
	glasses.glasses_color = new_color

/datum/action/item_action/place_light_prism
	name = "Fabricate Light Prism"
	icon_icon = 'icons/obj/slimecrossing.dmi'
	button_icon_state = "lightprism"

/datum/action/item_action/place_light_prism/Trigger()
	if(!IsAvailable())
		return
	var/obj/item/clothing/glasses/prism_glasses/glasses = target
	if(locate(/obj/structure/light_prism) in get_turf(owner))
		to_chat(owner, span_warning("There isn't enough ambient energy to fabricate another light prism here."))
		return
	if(istype(glasses))
		if(!glasses.glasses_color)
			to_chat(owner, span_warning("The lens is oddly opaque..."))
			return
		to_chat(owner, span_notice("I channel nearby light into a glowing, ethereal prism."))
		new /obj/structure/light_prism(get_turf(owner), glasses.glasses_color)

//Eora content from Stonekeep

/obj/item/clothing/head/peaceflower
	name = "eoran bud"
	desc = "A flower of gentle petals, associated with Eora or Necra. Usually adorned as a headress or laid at graves as a symbol of love or peace."
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "peaceflower"
	item_state = "peaceflower"
	slot_flags = ITEM_SLOT_HEAD
	body_parts_covered = NONE
	dynamic_hair_suffix = ""
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 3

/obj/item/clothing/head/peaceflower/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == SLOT_HEAD)
		ADD_TRAIT(user, TRAIT_PACIFISM, "peaceflower_[REF(src)]")

/obj/item/clothing/head/peaceflower/dropped(mob/living/carbon/human/user)
	..()
	REMOVE_TRAIT(user, TRAIT_PACIFISM, "peaceflower_[REF(src)]")

/obj/item/clothing/head/peaceflower/attack_hand(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.head)
			to_chat(user, "<span class='warning'>I feel at peace. <b style='color:pink'>Why would you want anything else?</b></span>")
			return
	return ..()

/obj/item/clothing/suit/armor/heavy/adamantine
	name = "adamantine armor"
	desc = ""
	icon_state = "adamsuit"
	item_state = "adamsuit"
	flags_inv = NONE
	obj_flags = IMMUTABLE_SLOW
	slowdown = 4
	var/hit_reflect_chance = 40

/obj/item/clothing/suit/armor/heavy/adamantine/IsReflect(def_zone)
	if(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_R_ARM, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_LEG) && prob(hit_reflect_chance))
		return TRUE
	else
		return FALSE
