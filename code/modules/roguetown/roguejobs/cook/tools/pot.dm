/obj/item/reagent_containers/glass/pot
	force = 10
	throwforce = 15
	possible_item_intents = list(INTENT_GENERIC)
	name = "glass pot"
	desc = "A delicate glass pot."
	icon_state = "pot"
	icon = 'icons/roguetown/items/cooking.dmi'
	item_state = "rods"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	sharpness = IS_BLUNT
	w_class = WEIGHT_CLASS_BULKY
	amount_per_transfer_from_this = 9 //hard to transfer
	possible_transfer_amounts = list(9)
	volume = 99
	reagent_flags = OPENCONTAINER|REFILLABLE
	spillable = TRUE
	possible_item_intents = list(INTENT_GENERIC, /datum/intent/fill, INTENT_POUR, INTENT_SPLASH)
	drop_sound = 'sound/foley/dropsound/shovel_drop.ogg'
	slot_flags = null
	//var/list/contained_ingredients = new/list()
	var/isBoiling = FALSE
	
/obj/item/reagent_containers/glass/pot/stone
	//for stone crafting.
	name = "stone pot"
	desc = "A rough stone pot."

/obj/item/reagent_containers/glass/pot/iron
	//for stone crafting.
	name = "iron pot"
	desc = "A smooth iron pot."

// /obj/item/reagent_containers/glass/pot/attackby(obj/item/W, mob/living/user, params)
// 	if(W.type in subtypesof(/obj/item/reagent_containers/food/snacks/grown))
// 		if(src.contained_ingredients.len < 10)
// 			src.insert_ingredient(W, user)
// 		else
// 			to_chat(user, span_warning("The pot is full."))
// 		return
	
// 	. = ..()

// /obj/item/reagent_containers/glass/pot/attack_right(mob/living/user)
// 	src.remove_ingredient(user)
// 	. = ..()

// /obj/item/reagent_containers/glass/pot/proc/insert_ingredient(obj/item/reagent_containers/food/snacks/grown/W, mob/living/user)
// 	contained_ingredients += W
// 	to_chat(user, span_warning("Deposited [W] into the pot."))
// 	to_chat(user, span_warning("Pot now contains [contained_ingredients.len] items."))
// 	W.forceMove(src)

// 	return

// /obj/item/reagent_containers/glass/pot/proc/remove_ingredient(mob/living/user)
// 	if(contained_ingredients.len)
// 		var/obj/item/reagent_containers/food/snacks/grown/ingredient = contained_ingredients[contained_ingredients.len]
// 		contained_ingredients -= ingredient
// 		to_chat(user, span_warning("Removed [ingredient] from the pot."))
// 		if(!user.put_in_active_hand(ingredient))
// 			ingredient.forceMove(user.loc)
// 		to_chat(user, span_warning("Pot now contains [contained_ingredients.len] items."))
// 	return
	
// /obj/item/reagent_containers/glass/pot/Destroy()
// 	. = ..()
// 	contained_ingredients = null
