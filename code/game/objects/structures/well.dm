//Fluff structures serve no purpose and exist only for enriching the environment. They can be destroyed with a wrench.

/obj/structure/well
	name = "well"
	desc = ""
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "well"
	anchored = TRUE
	density = TRUE
	opacity = 0
	climb_time = 40
	climbable = TRUE
	layer = 2.91
	damage_deflection = 30

/obj/structure/well/fountain
	name = "water fountain"
	desc = ""
	icon = 'icons/roguetown/misc/64x64.dmi'
	icon_state = "fountain"
	layer = BELOW_MOB_LAYER
	layer = -0.1

/obj/structure/well/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/reagent_containers/glass/bucket))
		var/obj/item/reagent_containers/glass/bucket/W = I
		if(W.reagents.holder_full())
			to_chat(user, span_warning("[W] is full."))
			return
		if(do_after(user, 60, target = src))
			var/list/waterl = list(/datum/reagent/water = 100)
			W.reagents.add_reagent_list(waterl)
			to_chat(user, "<span class='notice'>I fill [W] from [src].</span>")
			playsound(user, pick('sound/foley/waterwash (1).ogg','sound/foley/waterwash (2).ogg'), 80, FALSE)
			return
	else ..()

/obj/structure/well/fountain2
	name = "water fountain"
	desc = ""
	icon = 'icons/roguetown/misc/64x64.dmi'
	icon_state = "fountain2"
	layer = BELOW_MOB_LAYER
	layer = -0.1

/obj/structure/well/fountain3
	name = "water fountain"
	desc = ""
	icon = 'icons/roguetown/misc/64x64.dmi'
	icon_state = "fountain3"
	layer = BELOW_MOB_LAYER
	layer = -0.1

/obj/structure/well/fountain4
	name = "water fountain"
	desc = ""
	icon = 'modular_hearthstone/icons/obj/fountains.dmi'
	icon_state = "3"
	layer = BELOW_MOB_LAYER
	layer = -0.1
	pixel_x = -16
	pixel_y = -7


/obj/structure/well/marble
	name = "marble well"
	desc = ""
	icon = 'modular_hearthstone/icons/obj/watercloset.dmi'
	icon_state = "marble_well1"
	layer = BELOW_MOB_LAYER
	layer = -0.1

/obj/structure/well/well2
	name = "well"
	desc = ""
	icon = 'modular_hearthstone/icons/obj/watercloset.dmi'
	icon_state = "well1"
	layer = BELOW_MOB_LAYER
	layer = -0.1
