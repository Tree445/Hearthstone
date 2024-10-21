/mob/living/simple_animal/bird
	name = "bird"
	desc = ""
	icon = 'modular_hearthstone/icons/mob/bird.dmi'
	icon_state = "wtiel"
	icon_living = "wtiel"
	icon_dead = "wtiel-dead"
	turns_per_move = 1
	response_help_continuous = "shoos"
	response_help_simple = "shoo"
	response_disarm_continuous = "brushes aside"
	response_disarm_simple = "brush aside"
	response_harm_continuous = "squashes"
	response_harm_simple = "squash"
	speak_emote = list("flutters")
	maxHealth = 2
	health = 2
	harm_intent_damage = 1
	friendly_verb_continuous = "nudges"
	friendly_verb_simple = "nudge"
	density = FALSE
	movement_type = FLYING
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	ventcrawler = VENTCRAWLER_ALWAYS
	mob_size = MOB_SIZE_TINY
	mob_biotypes = MOB_ORGANIC|MOB_BUG
	gold_core_spawnable = FRIENDLY_SPAWN
	verb_say = "flutters"
	verb_ask = "flutters inquisitively"
	verb_exclaim = "flutters intensely"
	verb_yell = "flutters intensely"
	butcher_results = list(/obj/item/natural/bone = 1, /obj/item/reagent_containers/food/snacks/rogue/meat/poultry = 1, /obj/item/natural/feather = 1)

/mob/living/simple_animal/bird/Initialize()
	. = ..()
	var/newcolor = rgb(rand(0, 255), rand(0, 255), rand(0, 255))
	add_atom_colour(newcolor, FIXED_COLOUR_PRIORITY)
