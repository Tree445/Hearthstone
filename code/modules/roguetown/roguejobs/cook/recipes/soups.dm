/datum/crafting_recipe/roguetown/cooking/soup
	name = "soup"
	subtype_reqs = FALSE
	craftdiff = 0
	reqs = list()

/datum/crafting_recipe/roguetown/cooking/soup/gruel
	name = "gruel"
	reqs = list(
		/datum/reagent/water = 15,
		/obj/item/reagent_containers/food/snacks/grown/wheat= 1)
	result = list(/obj/item/reagent_containers/food/snacks/rogue/soup/gruel=3)
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/soup/simplestew
	name = "simple stew"
	reqs = list(
		/datum/reagent/water = 15,
		/obj/item/reagent_containers/food/snacks/rogue/meat/steak= 1,
		/obj/item/reagent_containers/food/snacks/grown/rogue/potato= 1)
	result = list(/obj/item/reagent_containers/food/snacks/rogue/soup/simplestew=3)
	craftdiff = 1

/datum/crafting_recipe/roguetown/cooking/soup/fishchowder
	name = "fish chowder"
	reqs = list(
		/datum/reagent/water = 15,
		/obj/item/reagent_containers/food/snacks/fish = 1,
		/obj/item/reagent_containers/food/snacks/grown/rogue/potato= 1)
	result = list(/obj/item/reagent_containers/food/snacks/rogue/soup/fishchowder=3)
	craftdiff = 1

/obj/item/reagent_containers/food/snacks/rogue/soup/gruel
	name = "gruel"
	desc = ""
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "gruel"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("creamy, grainy soup" = 1)
	foodtype = GRAIN

/obj/item/reagent_containers/food/snacks/rogue/soup/simplestew
	name = "simple stew"
	desc = ""
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "simplestew"
	list_reagents = list(/datum/reagent/consumable/nutriment = 15)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("hearty, beefy soup" = 1)
	foodtype = MEAT
	
/obj/item/reagent_containers/food/snacks/rogue/soup/fishchowder
	name = "fish chowder"
	desc = ""
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "fishchowder"
	list_reagents = list(/datum/reagent/consumable/nutriment = 15)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("creamy, fishy soup" = 1)
	foodtype = MEAT
