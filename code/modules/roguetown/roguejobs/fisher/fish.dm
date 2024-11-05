/obj/item/reagent_containers/food/snacks/fish
	name = "fish"
	desc = "Fresh blood stains its silvery skin. Silver-coloured scales shimmering softly.."
	icon_state = "carp"
	icon = 'icons/roguetown/misc/fish.dmi'
	verb_say = "glubs"
	verb_yell = "glubs"
	obj_flags = CAN_BE_HIT
	var/dead = TRUE
	max_integrity = 50
	sellprice = 10
	dropshrink = 0.6
	slices_num = 1
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/meat/mince/fish
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/fish/dead
	dead = TRUE

/obj/item/reagent_containers/food/snacks/fish/Initialize()
	. = ..()
	var/rarity = pickweight(list("gold" = 1, "ultra" =40, "rare"=50, "com"=900))
	icon_state = "[initial(icon_state)][rarity]"
	switch(rarity)
		if("gold")
			sellprice = sellprice * 10
			name = "legendary [initial(name)]"
		if("ultra")
			sellprice = sellprice * 4
			name = "ultra-rare [initial(name)]"
		if("rare")
			sellprice = sellprice * 2
			name = "rare [initial(name)]"
		if("com")
			name = "common [initial(name)]"
	if(!dead)
		START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/food/snacks/fish/attack_hand(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_PICKUP))
			return
	user.changeNext_move(CLICK_CD_MELEE)
	if(dead)
		..()
	else
		if(isturf(user.loc))
			src.forceMove(user.loc)
		to_chat(user, span_warning("Too slippery!"))
		return

/obj/item/reagent_containers/food/snacks/fish/process()
	if(!isturf(loc)) //no floating out of bags
		return
	if(prob(50) && !dead)
		dir = pick(NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST)
		step(src, dir)

/obj/item/reagent_containers/food/snacks/fish/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/reagent_containers/food/snacks/fish/deconstruct()
	if(!dead)
		dead = TRUE
//		icon_state = "[icon_state]"
		STOP_PROCESSING(SSobj, src)
		return 1



/obj/item/reagent_containers/food/snacks/fish/carp
	name = "carp"
	desc = "A majestic scaled fish bearing untold tales."
	icon_state = "carp"
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/carp
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/carp

/obj/item/reagent_containers/food/snacks/fish/clownfish
	name = "clownfish"
	desc = "This fish brings vibrant hues to the dark world of Rockhill."
	icon_state = "clownfish"
	sellprice = 40
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/clownfish
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/clownfish

/obj/item/reagent_containers/food/snacks/fish/angler
	name = "anglerfish"
	desc = "A menacing abyssal predator."
	icon_state = "angler"
	sellprice = 15
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/angler
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/angler

/obj/item/reagent_containers/food/snacks/fish/eel
	name = "eel"
	desc = "A sinuous eel that slithers through the dark waters."
	icon_state = "eel"
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/eel
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/eel









/obj/item/reagent_containers/food/snacks/fishfresh
	name = "fish"
	desc = "Fresh blood stains its silvery skin. Silver-coloured scales shimmering softly.."
	icon_state = "guppy"
	icon = 'modular_hearthstone/icons/obj/items.dmi'
	verb_say = "glubs"
	verb_yell = "glubs"
	obj_flags = CAN_BE_HIT
	var/dead = TRUE
	max_integrity = 50
	sellprice = 10
	dropshrink = 0.6
	slices_num = 1
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/meat/mince/fish
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/fishfresh/dead
	dead = TRUE

/obj/item/reagent_containers/food/snacks/fishfresh/attack_hand(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_PICKUP))
			return
	user.changeNext_move(CLICK_CD_MELEE)
	if(dead)
		..()
	else
		if(isturf(user.loc))
			src.forceMove(user.loc)
		to_chat(user, span_warning("Too slippery!"))
		return

/obj/item/reagent_containers/food/snacks/fishfresh/process()
	if(!isturf(loc)) //no floating out of bags
		return
	if(prob(50) && !dead)
		dir = pick(NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST)
		step(src, dir)

/obj/item/reagent_containers/food/snacks/fishfresh/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/reagent_containers/food/snacks/fishfresh/deconstruct()
	if(!dead)
		dead = TRUE
//		icon_state = "[icon_state]"
		STOP_PROCESSING(SSobj, src)
		return 1


/obj/item/reagent_containers/food/snacks/fishfresh/guppy
	name = "guppy"
	desc = "A vibrate oceanic fish, with a vibrant lime-green and purple coloration."
	icon_state = "guppy"
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/guppy
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/guppy
/obj/item/reagent_containers/food/snacks/fishfresh/catfish
	name = "catfish"
	desc = "A wide-mouth fish with long slender barbells upon it's face, giving it a whiskered appearance."
	icon_state = "catfish"
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/catfish
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/catfish
/obj/item/reagent_containers/food/snacks/fishfresh/ratfish
	name = "ratfish"
	desc = "A grey fish with a pink-tipped nose and pink fins, giving it a rat-like appearance. Tastes funny."
	icon_state = "ratfish"
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/ratfish
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/ratfish
/obj/item/reagent_containers/food/snacks/fishfresh/firefish
	name = "fire fish"
	desc = "A unique species of fish, said to be attuned to the element of fire. Highly flammable and explosive. Cook with care."
	icon_state = "firefish"
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/firefish
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/firefish
/obj/item/reagent_containers/food/snacks/fishfresh/angelfish
	name = "angel fish"
	desc = "A uniquely shaped fish, tall and skinny. It is said to have attuned to divine healing magicks."
	icon_state = "angelfish"
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/angelfish
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/angelfish
/obj/item/reagent_containers/food/snacks/fishfresh/goldfish
	name = "goldfish"
	desc = "A large bass-shaped fish, made of pure gold. This thing is quite valuable."
	icon_state = "goldfish"
	sellprice = 150
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/goldfish
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/goldfish
/obj/item/reagent_containers/food/snacks/fishfresh/jellyfish
	name = "jellyfish"
	desc = "No brain, heart, bones, or eyes. This alien creature has tentacles that sting. It is attuned with lightning magicks."
	icon_state = "gunner_jellyfish"
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/jellyfish
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/jellyfish
/obj/item/reagent_containers/food/snacks/fishfresh/crab
	name = "crab"
	desc = "A hard-shelled oceanwater crustaceans. This particular species is said to be attuned with earth magicks."
	icon_state = "crab"
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/crab
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/crab
/obj/item/reagent_containers/food/snacks/fishfresh/sludgefish
	name = "sludge fish"
	desc = "A slimey, purple fish that seems to be a mix between eel and octopus. It produces poisonous ink as a self defense mechanism."
	icon_state = "sludgefish_purple"
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/sludgefish
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/sludgefish
/obj/item/reagent_containers/food/snacks/fishfresh/pufferfish
	name = "puffer fish"
	desc = "He's just a little guy. Until he's not, then he's deadly. This fish has strong poisons that can kill, if prepared incorrectly."
	icon_state = "pufferfish"
	sellprice = 5
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/pufferfish
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/pufferfish


/obj/item/reagent_containers/food/snacks/rogue/fryfish
	icon = 'icons/roguetown/misc/fish.dmi'
	trash = null
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	tastes = list("fish" = 1)
	name = "cooked fish"
	desc = "A charred fish, crisped to perfection."
	icon_state = "carpcooked"
	foodtype = MEAT
	warming = 5 MINUTES
	dropshrink = 0.6

/obj/item/reagent_containers/food/snacks/rogue/fryfish/carp
	icon_state = "carpcooked"

/obj/item/reagent_containers/food/snacks/rogue/fryfish/clownfish
	icon_state = "clownfishcooked"

/obj/item/reagent_containers/food/snacks/rogue/fryfish/angler
	icon_state = "anglercooked"

/obj/item/reagent_containers/food/snacks/rogue/fryfish/eel
	icon_state = "eelcooked"


/obj/item/reagent_containers/food/snacks/rogue/fryfishfresh
	icon = 'modular_hearthstone/icons/obj/items.dmi'
	trash = null
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	tastes = list("fish" = 1)
	desc = "A charred fish, crisped to perfection."
	foodtype = MEAT
	warming = 5 MINUTES
	dropshrink = 0.6


/obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/guppy
	name = "cooked guppy"
	icon_state = "guppy"
	color = "#b6791e"
/obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/catfish
	name = "cooked catfish"
	icon_state = "catfish"
	color = "#b6791e"
/obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/firefish
	name = "cooked firefish"
	icon_state = "firefish"
	color = "#b6791e"
/obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/angelfish
	name = "cooked angelfish"
	icon_state = "angelfish"
	color = "#b6791e"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/medicine/healthpot = 10)
/obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/goldfish
	name = "cooked goldfish"
	icon_state = "goldfish"
	color = "#b6791e"
/obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/jellyfish
	name = "cooked jellyfish"
	icon_state = "gunner_jellyfish"
	color = "#b6791e"
/obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/crab
	name = "cooked crab"
	icon_state = "crab"
	color = "#b6791e"
/obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/sludgefish
	name = "cooked sludgefish"
	icon_state = "sludgefish_purple"
	color = "#b6791e"
	list_reagents = list(/datum/reagent/berrypoison = 5)
/obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/ratfish
	name = "cooked ratfish"
	icon_state = "ratfish"
	color = "#b6791e"
	list_reagents = list(/datum/reagent/berrypoison = 5)
/obj/item/reagent_containers/food/snacks/rogue/fryfishfresh/pufferfish
	name = "cooked pufferfish"
	icon_state = "pufferfish"
	color = "#b6791e"
	list_reagents = list(/datum/reagent/medicine/paralysispot = 10)
