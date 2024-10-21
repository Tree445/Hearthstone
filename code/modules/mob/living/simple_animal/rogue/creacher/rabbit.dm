//Look Sir, free rabbits!
/mob/living/simple_animal/hostile/retaliate/rogue/rabbit
	name = "rabbit"
	desc = ""
	icon = 'modular_hearthstone/icons/mob/rabbits.dmi'
	icon_state = "rabbit"
	icon_living = "rabbit"
	icon_dead = "rabbit_dead"
	speak_emote = list("squeaks.")
	emote_hear = list("squeaks.")
	emote_see = list("cleans its nose.")
	speak_chance = 1
	turns_per_move = 5
	butcher_results = list(/obj/item/natural/hide = 1, /obj/item/natural/fur = 1,
						/obj/item/natural/bone = 1, /obj/item/reagent_containers/food/snacks/rogue/meat/steak = 1)
	faction = list("rats")
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "stomps"
	response_harm_simple = "stomp"
	stop_automated_movement = 1
	friendly_verb_continuous = "squeaks"
	friendly_verb_simple = "squeaks"
	STASPD = 12
	ventcrawler = VENTCRAWLER_ALWAYS
	var/obj/item/inventory_head
	var/obj/item/inventory_mask
	gold_core_spawnable = FRIENDLY_SPAWN

/mob/living/simple_animal/rabbitrabbit/Life()
	..()
	//rabbit movement
	if(!ckey && !stat)
		if(isturf(loc) && !resting && !buckled)		//This is so it only moves if it's not inside a closet, gentics machine, etc.
			turns_since_move++
			if(turns_since_move >= turns_per_move)
				var/east_vs_west = pick(4,8)
				if(Process_Spacemove(east_vs_west))
					Move(get_step(src,east_vs_west), east_vs_west)

/mob/living/simple_animal/hostile/retaliate/rogue/rabbit/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/rat/aggro (1).ogg','sound/vo/mobs/rat/aggro (2).ogg','sound/vo/mobs/rat/aggro (3).ogg')
		if("pain")
			return pick('sound/vo/mobs/rat/pain (1).ogg','sound/vo/mobs/rat/pain (2).ogg','sound/vo/mobs/rat/pain (3).ogg')
		if("death")
			return pick('sound/vo/mobs/rat/death (1).ogg','sound/vo/mobs/rat/death (2).ogg')
		if("idle")
			return pick('sound/vo/mobs/rat/rat_life.ogg','sound/vo/mobs/rat/rat_life2.ogg','sound/vo/mobs/rat/rat_life3.ogg')

/obj/structure/rabbitnest
	name = "rabbit Burrow"
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "crabnest"
	max_integrity = 200
	anchored = TRUE
	density = FALSE
	layer = BELOW_OBJ_LAYER
	var/rabbits = 0
	var/maxrabbits = 3
	var/spawning = FALSE
	attacked_sound = null

/obj/structure/rabbitnest/Initialize()
	. = ..()
	spawn_rabbit()

/obj/structure/rabbitnest/proc/createrabbit()
	if(QDELETED(src))
		return
	if(!spawning)
		return
	spawning = FALSE
	new /mob/living/simple_animal/hostile/retaliate/rogue/rabbit(get_turf(src))
	rabbits++
	update_icon()
	if(rabbits < maxrabbits)
		spawn_rabbit()

/obj/structure/rabbitnest/proc/spawn_rabbit()
	if(QDELETED(src))
		return
	if(spawning)
		return
	spawning = TRUE
	update_icon()
	spawn(2 SECONDS)
		createrabbit()
	//addtimer(CALLBACK(src, PROC_REF(creategob)), 4 SECONDS)
