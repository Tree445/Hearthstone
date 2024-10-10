/obj/item/ash
	name = "ash"
	desc = "A dark remnant of decadent flames."
	icon = 'icons/obj/objects.dmi'
	icon_state = "ash"
	w_class = WEIGHT_CLASS_TINY

/obj/item/ash/Crossed(mob/living/L)
	. = ..()
	if(istype(L))
		var/prob2break = 33
		if(L.m_intent == MOVE_INTENT_SNEAK)
			prob2break = 0
		if(L.m_intent == MOVE_INTENT_RUN)
			prob2break = 100
		if(prob(prob2break))
			qdel(src)

/obj/item/ash/bonemeal
	name = "bonemeal"
	desc = "Rich in calcium and phosphorus, a perfect feed for plants."
	icon = 'icons/obj/objects.dmi'
	icon_state = "bonemeal"
	w_class = WEIGHT_CLASS_TINY