/obj/item
	var/baitchance = 0
	var/list/fishloot = null

/obj/item/natural/worms
	name = "worm"
	desc = "The favorite bait of the courageous fishermen who venture these dark waters."
	icon_state = "worm1"
	throwforce = 10
	baitchance = 75
	color = "#b65f49"
	w_class = WEIGHT_CLASS_TINY
	fishloot = list(/obj/item/reagent_containers/food/snacks/fish/carp = 10,
					/obj/item/reagent_containers/food/snacks/fish/eel = 2,
					/obj/item/reagent_containers/food/snacks/fish/angler = 2,
					/obj/item/reagent_containers/food/snacks/fish/clownfish = 2)
	drop_sound = 'sound/foley/dropsound/food_drop.ogg'

/obj/item/natural/worms/grubs
	name = "grub"
	desc = "Bait for the desperate, or the daring."
	baitchance = 100
	color = null
	fishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/eel = 1,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 9,
	)


/obj/item/natural/worms/bloodworms
	name = "blood worms"
	desc = "Bait that is particularly great for ocean species."
	baitchance = 100
	color = "#ee1f1f"
	fishloot = list(
		/obj/item/reagent_containers/food/snacks/fishfresh/guppy = 5,
		/obj/item/reagent_containers/food/snacks/fishfresh/catfish = 5,
		/obj/item/reagent_containers/food/snacks/fishfresh/ratfish = 5,
		/obj/item/reagent_containers/food/snacks/fishfresh/firefish = 5,
		/obj/item/reagent_containers/food/snacks/fishfresh/angelfish = 5,
		/obj/item/reagent_containers/food/snacks/fishfresh/goldfish = 5,
		/obj/item/reagent_containers/food/snacks/fishfresh/jellyfish = 5,
		/obj/item/reagent_containers/food/snacks/fishfresh/crab = 5,
		/obj/item/reagent_containers/food/snacks/fishfresh/sludgefish = 5,
		/obj/item/reagent_containers/food/snacks/fishfresh/pufferfish = 5,

	)
