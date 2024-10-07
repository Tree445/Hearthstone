
/obj/structure/flora/wildplant
	name = "wild plant"
	desc = "It's a wild plant."
	icon = 'icons/obj/flora/wildflora.dmi'
	anchored = 1
	density = 0
	var/has_plod = TRUE
	var/produce
	var/timer = 5000 

/obj/structure/flora/wildplant/Destroy()
	if(LAZYLEN(contents))
		var/turf/our_turf = get_turf(src)
		if(isturf(our_turf))
			for(var/atom/movable/inside_thing in contents)
				inside_thing.forceMove(our_turf)
	. = ..()

/obj/structure/flora/wildplant/attack_hand(mob/user)
	if(!ispath(produce))
		return ..()

	if(has_plod)
		var/obj/item/product = new produce
		if(!istype(product))
			return 
		user.put_in_hands(product)
		to_chat(user, span_notice("You pluck [product] from [src]."))
		has_plod = FALSE
		update_icon() 
		timer = initial(timer) + rand(-100,100) 
		addtimer(CALLBACK(src, .proc/regrow),timer) 
	update_icon()

/obj/structure/flora/wildplant/proc/regrow()
	if(!QDELETED(src))
		has_plod = TRUE
		update_icon()

/obj/structure/flora/wildplant/update_icon()
	if(has_plod)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]_no"

/obj/structure/flora/wildplant/Initialize()
	. = ..()
	if(ispath(produce))
		new produce(src) 

/obj/structure/flora/wildplant/wild_poppy
	name = "wild poppy flower"
	icon_state = "wild_poppy"
	desc = "vibrant red flowers famed for their use in ozium creation and pain removing effects"
	produce = /obj/item/reagent_containers/food/snacks/grown/poppy

/obj/structure/flora/wildplant/wild_herbs
	name = "wild herbs"
	icon_state = "wild_herbs"
	desc = "an assortment of wild herbs with mild healing properties."
	produce = /obj/item/reagent_containers/food/snacks/grown/herbs





/obj/structure/flora/wildapples/wildplant
	name = "wild plant"
	desc = "It's a wild plant."
	icon = 'icons/obj/flora/wildflora.dmi'
	anchored = 1
	density = 1
	var/has_plod = TRUE
	var/produce
	var/timer = 5000 

/obj/structure/flora/wildapples/wildplant/Destroy()
	if(LAZYLEN(contents))
		var/turf/our_turf = get_turf(src)
		if(isturf(our_turf))
			for(var/atom/movable/inside_thing in contents)
				inside_thing.forceMove(our_turf)
	. = ..()

/obj/structure/flora/wildapples/wildplant/attack_hand(mob/user)
	if(!ispath(produce))
		return ..()

	if(has_plod)
		var/obj/item/product = new produce
		if(!istype(product))
			return 
		user.put_in_hands(product)
		to_chat(user, span_notice("You pluck [product] from [src]."))
		has_plod = FALSE
		update_icon() 
		timer = initial(timer) + rand(-100,100) 
		addtimer(CALLBACK(src, .proc/regrow),timer) 
	update_icon()

/obj/structure/flora/wildapples/wildplant/proc/regrow()
	if(!QDELETED(src))
		has_plod = TRUE
		update_icon()

/obj/structure/flora/wildapples/wildplant/update_icon()
	if(has_plod)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]_no"

/obj/structure/flora/wildapples/wildplant/Initialize()
	. = ..()
	if(ispath(produce))
		new produce(src) 

/obj/structure/flora/wildapples/wildplant/wild_apples
	name = "wild apple tree"
	icon = 'modular_hearthstone/icons/obj/flora/grove_trees.dmi'
	icon_state = "grove_tree1"
	desc = "a naturally occuring apple tree, found in the wild."
	produce = /obj/item/reagent_containers/food/snacks/grown/apple

/obj/structure/flora/wildapples/wildplant/wild_apples2
	name = "wild apple tree"
	icon = 'modular_hearthstone/icons/obj/flora/grove_trees.dmi'
	icon_state = "grove_tree2"
	desc = "a naturally occuring apple tree, found in the wild."
	produce = /obj/item/reagent_containers/food/snacks/grown/apple
/obj/structure/flora/wildapples/wildplant/wild_apples3
	name = "wild apple tree"
	icon = 'modular_hearthstone/icons/obj/flora/grove_trees.dmi'
	icon_state = "grove_tree3"
	desc = "a naturally occuring apple tree, found in the wild."
	produce = /obj/item/reagent_containers/food/snacks/grown/apple


