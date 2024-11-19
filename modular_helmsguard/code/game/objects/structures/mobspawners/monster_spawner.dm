
///SPAWNER///

/obj/effect/mobspawner/monster_spawner_all
	name = "monster spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/female = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe/female = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf/poison = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 8,
	/mob/living/simple_animal/hostile/retaliate/rogue/spider = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated = 1,
	/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 6,
	/mob/living/simple_animal/hostile/retaliate/rogue/bogtroll = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/cavetroll = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 7,
	/mob/living/simple_animal/hostile/retaliate/rogue/mole = 6

	)
	text_faction = "Some monsters"	//for spawning string		//for spawning string
	objfaction = list("caves")

/obj/effect/mobspawner/monster_spawner_minotaurs
	name = "minotaur spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/female = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe/female = 3
	)
	text_faction = "Minotaurs"	//for spawning string		//for spawning string
	objfaction = list("caves")

/obj/effect/mobspawner/monster_spawner_animals
	name = "critter spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf/poison = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/spider = 3,
	/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated = 1,
	/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 4,
	/mob/living/simple_animal/hostile/retaliate/rogue/bogtroll = 2,
	/mob/living/simple_animal/hostile/retaliate/rogue/cavetroll = 1,
	/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 6,
	/mob/living/simple_animal/hostile/retaliate/rogue/mole = 4
	)
	text_faction = "Some wild animals"	//for spawning string		//for spawning string
	objfaction = list("caves")

/obj/effect/mobspawner/monster_spawner_wolfs
	name = "volfs spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf/poison = 1,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 3
	)
	text_faction = "Volfs"	//for spawning string
	objfaction = list("caves")

/obj/effect/mobspawner/monster_spawner_spider
	name = "spider spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/spider = 3,
					/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated = 1)
	)
	text_faction = "Beespiders"	//for spawning string
	objfaction = list("spiders")

/obj/effect/mobspawner/monster_spawner_trolls
	name = "troll spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/bogtroll = 1,
	/mob/living/simple_animal/hostile/retaliate/rogue/cavetroll = 1
	)
	text_faction = "Trolls"	//for spawning string
	objfaction = list("caves")




/// HOLE SPAWNER ///
/* THIS ONE DOESN'T SCATTER ITS MOBS BUT INSTEAD SPAWN ON ITS OWN TILE */


/obj/effect/mobspawner/hole/spiders
	name = "the web covered hole"
	desc = "A large hole covered with spider webs..."
	icon = 'modular_helmsguard/icons/obj/structure/spawners.dmi'
	icon_state = "hole_spider"
	anchored = TRUE
	density = FALSE
	ready = FALSE
	last_activated
	mobs = 0
	detect_range = 6
	spawn_range = null
	restart_time = 5 MINUTES
	min_mobs = 1
	max_mobs = 2
	mobs_to_spawn = 3
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/spider = 3,
					/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated = 1)
	text_faction = null
	picked_string = null
	spawn_sound = list('sound/foley/climb.ogg')
	objfaction = list("spiders")
	mymobs = list()

/obj/effect/mobspawner/hole/spiders/wall
	icon_state = "hole_wall_spider"

/obj/effect/mobspawner/hole/spiders/wall/south
	dir = SOUTH
	pixel_y = 32 //so we see it in mapper

/obj/effect/mobspawner/hole/spiders/wall/west
	dir = WEST
	pixel_x = 32

/obj/effect/mobspawner/hole/spiders/wall/east
	dir = EAST
	pixel_x = -32

/obj/effect/mobspawner/hole/spiders/wall/update_icon()
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

/obj/effect/mobspawner/hole/wolf
	name = "the burrow"
	desc = "A burrow made by wild animals to live in"
	icon = 'modular_helmsguard/icons/obj/structure/spawners.dmi'
	icon_state = "hole_burrow"
	anchored = TRUE
	density = FALSE
	ready = FALSE
	last_activated
	mobs = 0
	detect_range = 6
	spawn_range = null
	restart_time = 5 MINUTES
	min_mobs = 1
	max_mobs = 2
	mobs_to_spawn = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf/poison = 1,
	/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 3
	)
	text_faction = null
	picked_string = null
	spawn_sound = list('sound/foley/climb.ogg')
	objfaction = list("wolfs")
	mymobs = list()

/obj/effect/mobspawner/hole/wolf/wall
	icon_state = "hole_wall_burrow"

/obj/effect/mobspawner/hole/wolf/wall/south
	dir = SOUTH
	pixel_y = 32 //so we see it in mapper

/obj/effect/mobspawner/hole/wolf/wall/west
	dir = WEST
	pixel_x = 32

/obj/effect/mobspawner/hole/wolf/wall/east
	dir = EAST
	pixel_x = -32

/obj/effect/mobspawner/hole/wolf/wall/update_icon()
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


