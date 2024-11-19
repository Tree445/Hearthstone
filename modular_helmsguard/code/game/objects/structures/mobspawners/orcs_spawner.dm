
///EFFECT SPAWNER///

/obj/effect/mobspawner/goblin_spawner
	name = "gob spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/carbon/human/species/goblin/npc = 6,
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin/cave = 3,		//archer
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin = 3,		//archer
	/mob/living/carbon/human/species/goblin/npc/hell = 1,
	/mob/living/carbon/human/species/goblin/npc/cave = 4,
	/mob/living/carbon/human/species/goblin/npc/sea= 1,
	/mob/living/carbon/human/species/goblin/npc/moon = 1)
	text_faction = "Goblins"	//for spawning string		//for spawning string
	objfaction = list("orcs")

/obj/effect/mobspawner/orc_spawner
	name = "orc spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/carbon/human/species/halforc/orc_raider/savage_orc = 6,
	/mob/living/carbon/human/species/halforc/orc_raider = 5,		//archer
	/mob/living/simple_animal/hostile/retaliate/rogue/orc/ranged = 5		//archer
	)
	text_faction = "Orcs"	//for spawning string		//for spawning string
	objfaction = list("orcs")

/obj/effect/mobspawner/greenskin_spawner
	name = "greenskin spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 5
	mob_types = list(
	/mob/living/carbon/human/species/goblin/npc = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin/cave = 4,		//archer
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin = 4,	//archer
	/mob/living/carbon/human/species/halforc/orc_raider/savage_orc = 6,
	/mob/living/carbon/human/species/halforc/orc_raider = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/orc/ranged = 3		//archer
	)
	text_faction = "Greenskins"	//for spawning string		//for spawning string
	objfaction = list("orcs")


/obj/effect/mobspawner/greenskin_spawner_HORDE
	name = "greenskin spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 5
	spawn_range = 7
	max_mobs = 10
	mob_types = list(
	/mob/living/carbon/human/species/goblin/npc = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin/cave = 4,		//archer
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin = 4,	//archer
	/mob/living/carbon/human/species/halforc/orc_raider/savage_orc = 6,
	/mob/living/carbon/human/species/halforc/orc_raider = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/orc/ranged = 3		//archer
	)
	text_faction = "Greenskins"	//for spawning string		//for spawning string
	objfaction = list("orcs")


///DESTRUCTIBLE STRUCTURE SPAWNER///

/obj/structure/mobspawner/orc_banner_all
	name = "Orc Banner"
	desc = "A tattered banner rallying orc invaders to the area!"
	icon = 'modular_helmsguard/icons/obj/structure/orc_banner.dmi'
	icon_state = "orc_banner"
	max_integrity = 500
	anchored = TRUE
	density = TRUE
	detect_range = 6
	spawn_range = 3
	restart_time = 5 MINUTES
	min_mobs = 3
	max_mobs = 6
	mobs = 0
	mobs_to_spawn = 3
	mob_types = list(
	/mob/living/carbon/human/species/goblin/npc = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin/cave = 4,		//archer
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin = 4,	//archer
	/mob/living/carbon/human/species/halforc/orc_raider/savage_orc = 6,
	/mob/living/carbon/human/species/halforc/orc_raider = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/orc/ranged = 3		//archer
	)
	text_faction = "Greenskins"	//for spawning string
	spawn_text = "rallied around"		//for spawning string
	spawn_sound = list(
		'modular_helmsguard/sound/items/horns2/orc 1.ogg',
		'modular_helmsguard/sound/items/horns2/orc 2.ogg',
		'modular_helmsguard/sound/items/horns2/orc 3.ogg',
		'modular_helmsguard/sound/items/horns2/orc 4.ogg'
		)
	objfaction = list("orcs")
	debris = list(
	/obj/item/natural/cloth = 3,
	/obj/item/grown/log/tree/small = 2)

///GOBLIN HOLE SPAWNER///


/obj/effect/mobspawner/hole/goblins
	name = "the hole"
	desc = "A hole that reeks of goblin stentch."
	icon = 'modular_helmsguard/icons/obj/structure/spawners.dmi'
	icon_state = "hole"
	anchored = TRUE
	density = FALSE
	mobs = 0
	detect_range = 6
	restart_time = 5 MINUTES
	min_mobs = 1
	max_mobs = 3
	mobs_to_spawn = 3
	mob_types = list(
	/mob/living/carbon/human/species/goblin/npc = 6,
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin/cave = 3,		//archer
	/mob/living/simple_animal/hostile/retaliate/rogue/goblin = 3,		//archer
	/mob/living/carbon/human/species/goblin/npc/hell = 1,
	/mob/living/carbon/human/species/goblin/npc/cave = 4,
	/mob/living/carbon/human/species/goblin/npc/sea= 1,
	/mob/living/carbon/human/species/goblin/npc/moon = 1)
	picked_string = null
	spawn_sound = list('sound/foley/climb.ogg')
	objfaction = list("orcs")
	mymobs = list()

/obj/effect/mobspawner/hole/goblins/wall
	icon_state = "hole_wall"

/obj/effect/mobspawner/hole/goblins/wall/south
	dir = SOUTH
	pixel_y = 32 //so we see it in mapper

/obj/effect/mobspawner/hole/goblins/wall/west
	dir = WEST
	pixel_x = 32

/obj/effect/mobspawner/hole/goblins/wall/east
	dir = EAST
	pixel_x = -32

/obj/effect/mobspawner/hole/goblins/wall/update_icon()
	pixel_x = 0
	pixel_y = 0
	switch(dir)
		if(SOUTH)
			pixel_y = 32
		if(NORTH)
			pixel_y = -32
		if(WEST)
			pixel_x = 32
		if(EAST)
			pixel_x = -32
