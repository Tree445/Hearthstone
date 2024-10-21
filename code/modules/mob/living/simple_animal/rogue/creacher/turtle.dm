//Look Sir, free turtles!
/mob/living/simple_animal/hostile/retaliate/rogue/turtle
	name = "large turtle"
	desc = ""
	icon = 'modular_hearthstone/icons/mob/tortoise.dmi'
	icon_state = "Tortoise"
	icon_living = "Tortoise"
	icon_dead = "Tortoise_dead"
	speak_emote = list("clicks")
	emote_hear = list("clicks.")
	emote_see = list("clacks.")
	speak_chance = 1
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/rawturtle = 4, /obj/item/natural/carapace = 2)
	faction = list("turtles")
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "stomps"
	response_harm_simple = "stomp"
	stop_automated_movement = 1
	friendly_verb_continuous = "snaps"
	friendly_verb_simple = "snap"
	ventcrawler = VENTCRAWLER_ALWAYS
	var/obj/item/inventory_head
	var/obj/item/inventory_mask
	gold_core_spawnable = FRIENDLY_SPAWN

/mob/living/simple_animal/Tortoiseturtle/Life()
	..()
	//turtle movement
	if(!ckey && !stat)
		if(isturf(loc) && !resting && !buckled)		//This is so it only moves if it's not inside a closet, gentics machine, etc.
			turns_since_move++
			if(turns_since_move >= turns_per_move)
				var/east_vs_west = pick(4,8)
				if(Process_Spacemove(east_vs_west))
					Move(get_step(src,east_vs_west), east_vs_west)

/mob/living/simple_animal/hostile/retaliate/rogue/turtle/get_sound(input)
	switch(input)
		if("idle")
			return pick('sound/vo/mobs/crab/crab noise (1).ogg','sound/vo/mobs/crab/crab noise (2).ogg','sound/vo/mobs/crab/crab noise (3).ogg')
		if("death")
			return pick('sound/vo/mobs/crab/crab death.ogg')

/obj/structure/turtlenest
	name = "turtle burrow"
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "crabnest"
	max_integrity = 200
	anchored = TRUE
	density = FALSE
	layer = BELOW_OBJ_LAYER
	var/turtles = 0
	var/maxturtles = 3
	var/spawning = FALSE
	attacked_sound = null

/obj/structure/turtlenest/Initialize()
	. = ..()
	spawn_turtle()

/obj/structure/turtlenest/proc/createturtle()
	if(QDELETED(src))
		return
	if(!spawning)
		return
	spawning = FALSE
	new /mob/living/simple_animal/hostile/retaliate/rogue/turtle(get_turf(src))
	turtles++
	update_icon()
	if(turtles < maxturtles)
		spawn_turtle()

/obj/structure/turtlenest/proc/spawn_turtle()
	if(QDELETED(src))
		return
	if(spawning)
		return
	spawning = TRUE
	update_icon()
	spawn(2 SECONDS)
		createturtle()
	//addtimer(CALLBACK(src, PROC_REF(creategob)), 4 SECONDS)



