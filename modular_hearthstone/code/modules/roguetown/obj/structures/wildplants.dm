
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





/obj/structure/flora/wildtree/wildplant
	name = "wild plant"
	desc = "It's a wild plant."
	icon = 'icons/obj/flora/wildflora.dmi'
	anchored = 1
	density = 1
	var/has_plod = TRUE
	var/produce
	var/timer = 5000 

/obj/structure/flora/wildtree/wildplant/Destroy()
	if(LAZYLEN(contents))
		var/turf/our_turf = get_turf(src)
		if(isturf(our_turf))
			for(var/atom/movable/inside_thing in contents)
				inside_thing.forceMove(our_turf)
	. = ..()

/obj/structure/flora/wildtree/wildplant/attack_hand(mob/user)
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

/obj/structure/flora/wildtree/wildplant/proc/regrow()
	if(!QDELETED(src))
		has_plod = TRUE
		update_icon()

/obj/structure/flora/wildtree/wildplant/update_icon()
	if(has_plod)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]_no"

/obj/structure/flora/wildtree/wildplant/Initialize()
	. = ..()
	if(ispath(produce))
		new produce(src) 

/obj/structure/flora/wildtree/wildplant/wild_apples
	name = "wild apple tree"
	icon = 'modular_hearthstone/icons/obj/flora/grove_trees.dmi'
	icon_state = "grove_tree1"
	desc = "a naturally occuring apple tree, found in the wild."
	produce = /obj/item/reagent_containers/food/snacks/grown/apple

/obj/structure/flora/wildtree/wildplant/wild_apples2
	name = "wild apple tree"
	icon = 'modular_hearthstone/icons/obj/flora/grove_trees.dmi'
	icon_state = "grove_tree2"
	desc = "a naturally occuring apple tree, found in the wild."
	produce = /obj/item/reagent_containers/food/snacks/grown/apple
/obj/structure/flora/wildtree/wildplant/wild_apples3
	name = "wild apple tree"
	icon = 'modular_hearthstone/icons/obj/flora/grove_trees.dmi'
	icon_state = "grove_tree3"
	desc = "a naturally occuring apple tree, found in the wild."
	produce = /obj/item/reagent_containers/food/snacks/grown/apple


/obj/structure/flora/wildtree/wildplant/wild_coconut
	name = "wild coconut tree"
	icon = 'modular_hearthstone/icons/obj/flora/desert_planet_160x160.dmi'
	icon_state = "spalmtree4"
	desc = "a naturally occuring palm tree, found in the wild."
	produce = /obj/item/reagent_containers/food/snacks/grown/coconut
	stump_type = /obj/structure/flora/roguetree/stump/palm

/obj/structure/flora/wildtree/wildplant/wild_coconut2
	name = "wild coconut tree"
	icon = 'modular_hearthstone/icons/obj/flora/desert_planet_160x160.dmi'
	icon_state = "spalmtree3"
	desc = "a naturally occuring palm tree, found in the wild."
	produce = /obj/item/reagent_containers/food/snacks/grown/coconut
	stump_type = /obj/structure/flora/roguetree/stump/palm
	pixel_x = -54

/obj/structure/flora/wildtree/wildplant/wild_cactus
	name = "wild cactus plant"
	icon = 'modular_hearthstone/icons/obj/flora/desert_planet_160x160.dmi'
	icon_state = "lcactus1"
	desc = "a naturally occuring cactus plant, found in the wild."
	produce = /obj/item/reagent_containers/food/snacks/grown/cactus
	pixel_x = -10
	pixel_y = -10

/obj/structure/flora/wildtree/wildplant/wild_cactus2
	name = "wild cactus plant"
	icon = 'modular_hearthstone/icons/obj/flora/desert_planet_160x160.dmi'
	icon_state = "lcactus3"
	desc = "a naturally occuring cactus plant, found in the wild."
	produce = /obj/item/reagent_containers/food/snacks/grown/cactus
	pixel_x = -10
	pixel_y = -10


/obj/structure/flora/wildtree/wildplant/wild_banana
	name = "wild banana palm tree"
	icon = 'modular_hearthstone/icons/obj/flora/desert_planet_160x160.dmi'
	icon_state = "mpalmtreeb"
	desc = "a naturally occuring palm tree, which grows bananas."
	produce = /obj/item/reagent_containers/food/snacks/grown/banana

/obj/structure/flora/wildtree/wildplant/wild_banana2
	name = "wild banana palm tree"
	icon = 'modular_hearthstone/icons/obj/flora/desert_planet_160x160.dmi'
	icon_state = "mpalmtreeb1"
	desc = "a naturally occuring palm tree, which grows bananas."
	produce = /obj/item/reagent_containers/food/snacks/grown/banana
	pixel_x = -44
