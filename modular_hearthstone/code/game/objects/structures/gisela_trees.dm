/obj/structure/flora/roguetree/young
	name = "young tree"
	desc = "Recently grown from a sappling."
	icon = 'modular_hearthstone/icons/obj/flora/gisela_trees.dmi'
	icon_state = "t1"
	stump_type = null
	pixel_x = -32


/obj/structure/flora/roguetree/young/Initialize()
	. = ..()
	icon_state = "t[rand(1,3)]"