/obj/item/clothing/suit/roguetown/shirt/slave
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	icon = 'modular_hearthstone/icons/obj/items/clothes/leia.dmi'
	mob_overlay_icon = 'modular_hearthstone/icons/obj/items/clothes/on_mob/drayco.dmi'
	name = "female slave garment"
	desc = "An attire meant for slaves"
	body_parts_covered = CHEST|GROIN|VITALS
	icon_state = "leia"
	sleeved = 'modular_hearthstone/icons/obj/items/clothes/on_mob/drayco.dmi'
	sleevetype = "leia"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/slave/red
	color = "#6F0000"

/obj/item/clothing/suit/roguetown/shirt/slave/blue
	color = CLOTHING_BLUE

/obj/item/clothing/suit/roguetown/shirt/slave/purple
	color = "#664357"

//CRAFTING

/datum/crafting_recipe/roguetown/weaving/slave
	name = "female slave garment"
	result = list(/obj/item/clothing/suit/roguetown/shirt/slave)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/weaving/slave_red
	name = "red female slave garment"
	result = list(/obj/item/clothing/suit/roguetown/shirt/slave/red)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/weaving/slave_blue
	name = "blue female slave garment"
	result = list(/obj/item/clothing/suit/roguetown/shirt/slave/blue)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/weaving/slave_purple
	name = "purple female slave garment"
	result = list(/obj/item/clothing/suit/roguetown/shirt/slave/purple)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
