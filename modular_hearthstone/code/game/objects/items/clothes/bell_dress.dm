/obj/item/clothing/suit/roguetown/shirt/belldress
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	icon = 'modular_hearthstone/icons/obj/items/clothes/dress.dmi'
	mob_overlay_icon = 'modular_hearthstone/icons/obj/items/clothes/on_mob/belldress.dmi'
	name = "bell dress"
	desc = "A fancy dress for the ladies."
	body_parts_covered = CHEST|GROIN|VITALS
	icon_state = "bdress"
	sleeved = 'modular_hearthstone/icons/obj/items/clothes/on_mob/belldress.dmi'
	sleevetype = "bdress"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL


//COLORS

/obj/item/clothing/suit/roguetown/shirt/belldress/yellow
	name = "yellow bell dress"
	icon_state = "ydress"
	sleevetype = "ydress"

/obj/item/clothing/suit/roguetown/shirt/belldress/red
	name = "red bell dress"
	icon_state = "rdress"
	sleevetype = "rdress"

/obj/item/clothing/suit/roguetown/shirt/belldress/cyan
	name = "cyan bell dress"
	icon_state = "cdress"
	sleevetype = "cdress"

/obj/item/clothing/suit/roguetown/shirt/belldress/purple
	name = "purple bell dress"
	icon_state = "pdress"
	sleevetype = "pdress"

/obj/item/clothing/suit/roguetown/shirt/belldress/baroness
	name = "baroness dress"
	icon_state = "baroness"
	sleevetype = "baroness"

/obj/item/clothing/suit/roguetown/shirt/belldress/white
	name = "white bell dress"
	icon_state = "whitedress"
	sleevetype = "whitedress"

/obj/item/clothing/suit/roguetown/shirt/belldress/black
	name = "black bell dress"
	icon_state = "blackdress"
	sleevetype = "blackdress"










//CRAFTING

/datum/crafting_recipe/roguetown/weaving/bell_dress
	name = "bell dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/belldress)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/weaving/bell_dress_yellow
	name = "yellow bell dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/belldress/yellow)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/weaving/bell_dress_red
	name = "red bell dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/belldress/red)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/weaving/bell_dress_cyan
	name = "cyan bell dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/belldress/cyan)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/weaving/bell_dress_purple
	name = "purple bell dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/belldress/purple)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/weaving/dress_white
	name = "white dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/belldress/white)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/weaving/bell_dress_black
	name = "black bell dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/belldress/black)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/weaving/bell_dress_baroness
	name = "baroness bell dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/belldress/baroness)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/natural/fibers = 1)



//SUPPLY

/datum/supply_pack/rogue/wardrobe/suits/bell_dress
	name = "Blue Bell Dresses"
	cost = 10
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/belldress,
					/obj/item/clothing/suit/roguetown/shirt/belldress,
				)

/datum/supply_pack/rogue/wardrobe/suits/bell_dress_yellow
	name = "Yellow bell Dresses"
	cost = 10
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/belldress/yellow,
					/obj/item/clothing/suit/roguetown/shirt/belldress/yellow,
				)

/datum/supply_pack/rogue/wardrobe/suits/bell_dress_red
	name = "Red bell Dresses"
	cost = 10
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/belldress/red,
					/obj/item/clothing/suit/roguetown/shirt/belldress/red,
				)

/datum/supply_pack/rogue/wardrobe/suits/bell_dress_cyan
	name = "Cyan bell Dresses"
	cost = 10
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/belldress/cyan,
					/obj/item/clothing/suit/roguetown/shirt/belldress/cyan,
				)

/datum/supply_pack/rogue/wardrobe/suits/bell_dress_purple
	name = "Purple bell Dresses"
	cost = 10
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/belldress/purple,
					/obj/item/clothing/suit/roguetown/shirt/belldress/purple,
				)

/datum/supply_pack/rogue/wardrobe/suits/bell_dress_black
	name = "Black bell Dresses"
	cost = 10
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/belldress/black,
					/obj/item/clothing/suit/roguetown/shirt/belldress/black,
				)

/datum/supply_pack/rogue/wardrobe/suits/white_dress
	name = "White Dresses"
	cost = 10
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/belldress/white,
					/obj/item/clothing/suit/roguetown/shirt/belldress/white,
				)


/datum/supply_pack/rogue/wardrobe/suits/baroness_dress
	name = "Baroness Dresses"
	cost = 10
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/belldress/baroness,
					/obj/item/clothing/suit/roguetown/shirt/belldress/baroness,
				)