/datum/crafting_recipe/roguetown/cooking/sweetdough
	name = "sweet dough"
	reqs = list(
		/datum/reagent/water = 10,
		/obj/item/reagent_containers/food/snacks/egg = 1,
		/obj/item/reagent_containers/powder/flour/salt = 1,
		/obj/item/reagent_containers/powder/flour = 1,
		/obj/item/reagent_containers/powder/sugar = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/sweetdough
	craftdiff = 2
	subtype_reqs = FALSE


/obj/item/reagent_containers/food/snacks/rogue/sweetdough
	name = "sweet dough"
	desc = ""
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "sweetdough"
	slices_num = 4
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/uncookedfinecake
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/plaincake
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("sweetened dough" = 1)
	foodtype = SUGAR
	eat_effect = /datum/status_effect/debuff/uncookedfood
	rotprocess = 30 MINUTES

/obj/item/reagent_containers/food/snacks/rogue/uncookedfinecake
	name = "uncooked fine cake"
	desc = ""
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "finecake"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/finecake
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("dough" = 1,"sugar" = 1)
	foodtype = GRAIN
	slice_batch = FALSE
	rotprocess = 30 MINUTES
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/rogue/finecake
	name = "finecake"
	desc = ""
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "finecake3"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("delicate, melt in your mouth sweetness" = 1)
	foodtype = GRAIN
	bitesize = 3
	rotprocess = null

/obj/item/reagent_containers/food/snacks/rogue/finecake/On_Consume(mob/living/eater)
	..()
	if(bitecount == 1)
		icon_state = "finecake2"
	if(bitecount == 2)
		icon_state = "finecake1"

/obj/item/reagent_containers/food/snacks/rogue/plaincake
	name = "plain cake"
	desc = ""
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "plaincake"
	slices_num = 6
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/plaincakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 40)
	w_class = WEIGHT_CLASS_BULKY
	tastes = list("crispy sweetened dough with a sugar glaze and hints of rosewater" = 1)
	foodtype = SUGAR
	eat_effect = /datum/status_effect/buff/foodbuff
	bitesize = 6
	rotprocess = null
	dropshrink = 0.80

/obj/item/reagent_containers/food/snacks/rogue/plaincakeslice
	name = "plain cake slice"
	desc = ""
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "plaincakeslice"
	list_reagents = list(/datum/reagent/consumable/nutriment = 7)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("crispy sweetened dough with a sugar glaze and hints of rosewater" = 1)
	foodtype = SUGAR
	eat_effect = /datum/status_effect/buff/foodbuff
	bitesize = 3
	rotprocess = null
	dropshrink = 0.60

/obj/item/reagent_containers/food/snacks/rogue/uncookedapplejam
	name = "uncooked apple jam"
	desc = ""
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "uncookedapplejam"
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = SUGAR
	eat_effect = /datum/status_effect/buff/foodbuff
	bitesize = 3
	rotprocess = null
	dropshrink = 0.60

/obj/item/reagent_containers/food/snacks/rogue/applejam
	name = "apple jam"
	desc = ""
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "applejam"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("oversweet apple" = 1)
	foodtype = SUGAR
	bitesize = 3
	rotprocess = null
	dropshrink = 0.60
