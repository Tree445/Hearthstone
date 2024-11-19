
///SPAWNER///


/obj/effect/mobspawner/undead_all
	name = "skelly spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/carbon/human/species/skeleton/npc = 3,
	/mob/living/simple_animal/hostile/rogue/skeleton/bow = 3,
	/mob/living/carbon/human/species/skeleton/dwarf/npc = 2,
	/mob/living/carbon/human/species/skeleton/npc/dungeon = 2,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/xbow = 2,
	/mob/living/carbon/human/species/skeleton/dwarf/npc/dungeon = 2,
	/mob/living/simple_animal/hostile/rogue/skeleton/axe = 5,
	/mob/living/simple_animal/hostile/rogue/skeleton/bow = 4,
	/mob/living/simple_animal/hostile/rogue/skeleton/spear = 6,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard = 5,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/spear = 5,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/shield = 4,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard = 2,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard_spear = 2,
	/mob/living/simple_animal/hostile/rogue/gravelord = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith = 3,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith2 = 3,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith3 = 3,
	/mob/living/simple_animal/hostile/rogue/ghost/cursed = 3,
	/mob/living/simple_animal/hostile/rogue/ghost/cursed/cursed2 = 3
	)
	text_faction = "Skeletons"	//for spawning string
	objfaction = list("undead")

/obj/effect/mobspawner/skeleton_spawner_hard
	name = "skelly spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/carbon/human/species/skeleton/npc = 6,
	/mob/living/simple_animal/hostile/rogue/skeleton/bow = 4,
	/mob/living/carbon/human/species/skeleton/dwarf/npc = 4,
	/mob/living/carbon/human/species/skeleton/npc/dungeon = 3,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/xbow = 3,
	/mob/living/carbon/human/species/skeleton/dwarf/npc/dungeon = 2)
	text_faction = "Skeletons"	//for spawning string		//for spawning string
	objfaction = list("undead")

/obj/effect/mobspawner/skeleton_spawner_simple
	name = "skelly spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/skeleton/axe = 6,
	/mob/living/simple_animal/hostile/rogue/skeleton/spear = 6,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard = 5,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/spear = 5,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/shield = 4,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/xbow = 3,
	/mob/living/simple_animal/hostile/rogue/skeleton/bow = 4,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard = 2,
	/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard_spear = 2,
	/mob/living/simple_animal/hostile/rogue/gravelord = 1
	)
	text_faction = "Skeletons"	//for spawning string		//for spawning string
	objfaction = list("undead")


/obj/effect/mobspawner/ghosts_all
	name = "wraith spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/ghost/wraith = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith2 = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith3 = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/cursed = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/cursed/cursed2 = 1
		)
	text_faction = "Wraiths"	//for spawning string		//for spawning string
	objfaction = list("undead")


/obj/effect/mobspawner/ghosts_wraiths
	name = "wraith spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/ghost/wraith = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith2 = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/wraith/wraith3 = 1
		)
	text_faction = "Wraiths"	//for spawning string		//for spawning string
	objfaction = list("undead")

/obj/effect/mobspawner/ghosts_cursedsouls
	name = "cursed soul spawner"
	desc = ""
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/rogue/ghost/cursed = 1,
	/mob/living/simple_animal/hostile/rogue/ghost/cursed/cursed2 = 1
		)
	text_faction = "Cursed souls"	//for spawning string		//for spawning string
	objfaction = list("undead")