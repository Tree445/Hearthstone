//by vide noir https://github.com/EaglePhntm
//Chests that are meant to make a replayable dungeon experience for long rounds.

//stole the loot lists from dungeon_chest

/obj/effect/spawner/lootdrop/roguetown/refilling_chest/randomspawner
	name = "refilling_chest"
	loot = list(
	/obj/structure/closet/crate/chest/refilling/generic = 6,
	/obj/structure/closet/crate/chest/refilling/materials = 5,
	/obj/structure/closet/crate/chest/refilling/armor = 3,
	/obj/structure/closet/crate/chest/refilling/food = 3,
	/obj/structure/closet/crate/chest/refilling/tools = 3,
	/obj/structure/closet/crate/chest/refilling/misc = 5,
	/obj/structure/closet/crate/chest/refilling/spells = 1,
	/obj/structure/closet/crate/chest/refilling/trait = 1,
	/obj/structure/closet/crate/chest/refilling/weapon = 4,
	/obj/structure/closet/crate/chest/refilling/treasure = 2,
	/obj/structure/closet/crate/chest/refilling/medicine = 5,
	/obj/structure/closet/crate/chest/refilling/mimic = 2
	)
	lootcount = 1

//This chest refills itself after the set duration, if no player is present in the same area as it, then it checks again later.
/obj/structure/closet/crate/chest/refilling
	name = "dungeon chest"
	desc = "An old damp chest that shimmer strangely."
	icon = 'modular_stonehedge/icons/roguetown/dungeon/dungeon_chest.dmi'
	//1 is unchecked(gold), 0 is checked(silver)
	icon_state = "dungeon_chest_1"
	base_icon_state = "dungeon_chest_1"
	anchored = TRUE //bet some dude would try to take this home.
	var/found = FALSE
	var/time_to_reset = 10 MINUTES
	var/reset_timer
	var/max_loot_num_to_spawn = 3
	var/loot_type = "generic"
	var/loot_num_to_spawn = 3

/obj/structure/closet/crate/chest/refilling/generic //because i know mappers wont take refilling base.
	loot_type = "generic"

/obj/structure/closet/crate/chest/refilling/treasure
	loot_type = "treasure"

/obj/structure/closet/crate/chest/refilling/medicine
	loot_type = "medicine"

/obj/structure/closet/crate/chest/refilling/materials
	loot_type = "materials"

/obj/structure/closet/crate/chest/refilling/weapon
	loot_type = "weapon"

/obj/structure/closet/crate/chest/refilling/food
	loot_type = "food"

/obj/structure/closet/crate/chest/refilling/tools
	loot_type = "tools"

/obj/structure/closet/crate/chest/refilling/spells
	loot_type = "spells"
	max_loot_num_to_spawn = 1

/obj/structure/closet/crate/chest/refilling/misc
	loot_type = "misc"

/obj/structure/closet/crate/chest/refilling/trait
	loot_type = "trait"
	max_loot_num_to_spawn = 1

/obj/structure/closet/crate/chest/refilling/armor
	loot_type = "armor"

/obj/structure/closet/crate/chest/refilling/Initialize()
	. = ..()
	loot_num_to_spawn = rand(max_loot_num_to_spawn)

/obj/structure/closet/crate/chest/refilling/Destroy()
	. = ..()

/obj/structure/closet/crate/chest/refilling/proc/try_reset_chest()
	//if its found before and area has no players when timer expire.
	if(found && playerless_in_area(get_area(src), src))
		found = FALSE
		icon_state = "dungeon_chest_1"
		base_icon_state = "dungeon_chest_1"
		close()
		loot_num_to_spawn = rand(max_loot_num_to_spawn)
		update_icon()
		PopulateContents()
		if(reset_timer)
			deltimer(reset_timer)
	else
		//quarter the time to check again because we really want to reset this chest soon at this point.
		var/fast_time = time_to_reset/4
		reset_timer = addtimer(CALLBACK(src, PROC_REF(try_reset_chest)), fast_time, TIMER_STOPPABLE)


/obj/structure/closet/crate/chest/refilling/PopulateContents()
	for(var/obj/item/olditem in contents)
		qdel(olditem) //fresh start babehhh
	var/list/loot
	switch(loot_type)
		if("generic")
			loot = list(/obj/item/cooking/pan=33,
				/obj/item/bomb=6,
				/obj/item/rogueweapon/huntingknife/idagger=33,
				/obj/item/clothing/suit/roguetown/armor/gambeson=33,
				/obj/item/clothing/suit/roguetown/armor/leather=33,
				/obj/item/roguestatue/gold/loot=1,
				/obj/item/ingot/iron=22,
				/obj/item/rogueweapon/huntingknife/cleaver=22,
				/obj/item/rogueweapon/mace=22,
				/obj/item/clothing/cloak/raincloak/rogue=22,
				/obj/item/reagent_containers/food/snacks/butter=22,
				/obj/item/clothing/mask/cigarette/pipe=10,
				/obj/item/clothing/mask/cigarette/pipe/westman=10,
				/obj/item/storage/box/matches=33,
				/obj/item/storage/backpack/rogue/satchel=33,
				/obj/item/storage/roguebag=33,
				/obj/item/roguegem=1,
				/obj/item/roguegem/blue=2,
				/obj/item/roguegem/violet=4,
				/obj/item/roguegem/green=6,
				/obj/item/roguegem/yellow=10,
				/obj/item/roguecoin/silver/pile=4,
				/obj/item/rogueweapon/pick=23,
				/obj/item/book/granter/spell_points=5,
				/obj/item/riddleofsteel=2,
				/obj/item/clothing/neck/roguetown/talkstone=2
				)
		if("treasure")
			loot = list(
				/obj/item/roguegem/random = 50,
				/obj/item/ingot/gold = 10,

				/obj/item/roguecoin/copper/pile = 50,
				/obj/item/roguecoin/silver/pile = 40,
				/obj/item/roguecoin/gold/pile = 25,
				/obj/item/roguestatue/gold = 5,
				/obj/item/roguestatue/steel = 10,
				/obj/item/roguestatue/silver = 15,
				/obj/item/roguestatue/iron = 15,
				/obj/item/roguestatue/gold/loot = 10,

				/obj/item/clothing/ring/dragon_ring = 5,
				/obj/item/clothing/ring/diamonds = 15,
				/obj/item/clothing/ring/quartzs = 15,
				/obj/item/clothing/ring/sapphires = 15,
				/obj/item/clothing/ring/topazs = 15,
				/obj/item/clothing/ring/rubys = 15,
				/obj/item/clothing/ring/emeralds =15,

				/obj/item/clothing/ring/emerald = 15,
				/obj/item/clothing/ring/ruby = 15,
				/obj/item/clothing/ring/topaz = 15,
				/obj/item/clothing/ring/quartz = 15,
				/obj/item/clothing/ring/sapphire = 15,
				/obj/item/clothing/ring/diamond = 15,

				/obj/item/riddleofsteel = 15,
				/obj/item/listenstone = 15
				)
		if("medicine")
			loot = list(
				/obj/item/needle = 40,
				/obj/item/natural/bundle/cloth = 20,

				/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 70,
				/obj/item/reagent_containers/glass/bottle/rogue/manapot = 30,
				/obj/item/reagent_containers/glass/bottle/rogue/antipoisonpot = 20,
				/obj/item/reagent_containers/glass/bottle/rogue/poison = 10,
				/obj/item/reagent_containers/glass/bottle/rogue/wine = 10,
				/obj/item/reagent_containers/glass/bottle/rogue/water = 25
				)
		if("materials")
			loot = list(
				/obj/item/ingot/copper = 50,
				/obj/item/ingot/iron = 30,
				/obj/item/ingot/steel = 20,

				/obj/item/natural/bundle/stick = 20,
				/obj/item/rogueore/coal = 55,
				/obj/item/natural/bundle/fibers = 50,
				/obj/item/natural/bundle/cloth = 50,
				/obj/item/natural/hide = 50,
				/obj/item/natural/fur = 50,
				/obj/item/natural/carapace = 50,
				/obj/item/grown/log/tree/small = 40
				)
		if("weapon")
			loot = list(//sword
				/obj/item/rogueweapon/sword/iron = 50,
				/obj/item/rogueweapon/sword/iron/short = 50,
				/obj/item/rogueweapon/sword/iron/messer = 30,
				/obj/item/rogueweapon/sword/iron/messer/steel = 20,
				/obj/item/rogueweapon/sword/falchion = 45,
				/obj/item/rogueweapon/sword/sabre = 50,
				/obj/item/rogueweapon/sword/estoc = 35,
				/obj/item/rogueweapon/sword/rapier = 35,
				/obj/item/rogueweapon/sword/cutlass = 50,
				/obj/item/rogueweapon/sword/silver = 30,
				/obj/item/rogueweapon/sword/silver/sabre/elf = 10,

			//axe
				/obj/item/rogueweapon/stoneaxe/battle = 50,

			//blunt
				/obj/item/rogueweapon/mace = 50,
				/obj/item/rogueweapon/mace/cudgel = 30,
				/obj/item/rogueweapon/mace/spiked = 25,

			//knives
				/obj/item/rogueweapon/huntingknife = 35,
				/obj/item/rogueweapon/huntingknife/idagger = 40,
				/obj/item/rogueweapon/huntingknife/idagger/steel = 25,
				/obj/item/rogueweapon/huntingknife/idagger/steel/parrying = 25,
				/obj/item/rogueweapon/huntingknife/idagger/silver = 25,
				/obj/item/rogueweapon/huntingknife/idagger/silver/elvish = 15,

			//polearms
				/obj/item/rogueweapon/spear = 50,
				/obj/item/rogueweapon/spear/billhook = 20,
				/obj/item/rogueweapon/halberd = 10,
				/obj/item/rogueweapon/halberd/bardiche = 10,
				/obj/item/rogueweapon/eaglebeak = 10,
				/obj/item/rogueweapon/eaglebeak/lucerne = 10,

			//ammunition
				/obj/item/quiver/bolts = 30,
				/obj/item/quiver/arrows = 35
			)
		if("armor")
			loot = list(//armor
				/obj/item/clothing/suit/roguetown/armor/leather/studded = 60,
				/obj/item/clothing/suit/roguetown/armor/gambeson = 60,
				/obj/item/clothing/suit/roguetown/armor/chainmail = 40,
				/obj/item/clothing/suit/roguetown/armor/chainmail/iron = 50,
				/obj/item/clothing/suit/roguetown/armor/plate/half/iron = 50,
				/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk = 50,
				/obj/item/clothing/suit/roguetown/armor/plate/half = 30,
				/obj/item/clothing/suit/roguetown/armor/chainmail/bikini = 20,
				/obj/item/clothing/suit/roguetown/armor/carapace = 40,
				/obj/item/clothing/suit/roguetown/armor/plate/ironarmor = 40,
				/obj/item/clothing/suit/roguetown/armor/leather/hide = 55,
				/obj/item/clothing/suit/roguetown/armor/leather/bikini = 50,
				/obj/item/clothing/suit/roguetown/armor/leather/studded/bikini = 45,
				/obj/item/clothing/suit/roguetown/armor/leather/hide/bikini = 45,
				/obj/item/clothing/suit/roguetown/armor/leather/vest= 55,
				/obj/item/clothing/suit/roguetown/armor/hide/bearfur = 30,
				/obj/item/clothing/suit/roguetown/armor/bone/chestplate = 40,

				//helmet
				/obj/item/clothing/head/roguetown/helmet/kettle = 10,
				/obj/item/clothing/head/roguetown/helmet/leather = 20,
				/obj/item/clothing/head/roguetown/helmet/horned = 10,
				/obj/item/clothing/head/roguetown/helmet/skullcap = 50,
				/obj/item/clothing/head/roguetown/helmet/winged = 10,
				/obj/item/clothing/head/roguetown/antlerhood = 35,
				/obj/item/clothing/head/roguetown/roguehood = 40,
				/obj/item/clothing/head/roguetown/roguehood/shalal = 30,
				/obj/item/clothing/head/roguetown/paddedcap = 55,
				/obj/item/clothing/head/roguetown/helmet/bascinet = 20,
				/obj/item/clothing/head/roguetown/helmet/carapacecap = 35,
				/obj/item/clothing/head/roguetown/helmet/carapacehelm = 35,
				/obj/item/clothing/head/roguetown/helmet/leather/bearhead = 25,
				/obj/item/clothing/head/roguetown/helmet/footmanhelmet = 35,
				/obj/item/clothing/head/roguetown/helmet/ironplatehelmet = 50,

				//legs
				/obj/item/clothing/under/roguetown/chainlegs = 20,
				/obj/item/clothing/under/roguetown/chainlegs/iron = 50,
				/obj/item/clothing/under/roguetown/platelegs = 10,
				/obj/item/clothing/under/roguetown/carapacelegs = 35,
				/obj/item/clothing/under/roguetown/chainlegs/skirt = 35,
				/obj/item/clothing/under/roguetown/platelegs/skirt = 35,
				/obj/item/clothing/under/roguetown/carapacelegs/skirt = 50,

				//gloves

				/obj/item/clothing/gloves/roguetown/carapace = 50,
				/obj/item/clothing/gloves/roguetown/chain = 20,
				/obj/item/clothing/gloves/roguetown/leather = 45,
				/obj/item/clothing/gloves/roguetown/chain/iron = 50,
				/obj/item/clothing/gloves/roguetown/plate = 10,
				/obj/item/clothing/gloves/roguetown/footmangauntlets = 25,

				//neck
				/obj/item/clothing/neck/roguetown/chaincoif = 50,
				/obj/item/clothing/neck/roguetown/gorget = 20,
				/obj/item/clothing/neck/roguetown/bervor = 10,

				//feet
				/obj/item/clothing/shoes/roguetown/boots/carapace = 50,
				/obj/item/clothing/shoes/roguetown/boots/armoriron = 55,
				/obj/item/clothing/shoes/roguetown/boots/armor = 50,
				/obj/item/clothing/shoes/roguetown/boots/leather = 55,
				/obj/item/clothing/shoes/roguetown/boots/footmangreaves = 30
				)
		if("food")
			loot = list(
				/obj/item/reagent_containers/food/snacks/rogue/crackerscooked = 3,
				/obj/item/reagent_containers/food/snacks/butterslice = 3,
				/obj/item/reagent_containers/powder/salt = 3,
				/obj/item/reagent_containers/food/snacks/egg = 3
				)
		if("spells")
			loot = list(
				//spells
				/obj/item/book/granter/spell/blackstone/fireball = 3,
				/obj/item/book/granter/spell/blackstone/greaterfireball = 2,
				/obj/item/book/granter/spell/blackstone/lightning = 3,
				/obj/item/book/granter/spell/blackstone/fetch = 4,
				/obj/item/book/granter/spell/blackstone/blindness = 1,
				/obj/item/book/granter/spell/blackstone/invisibility = 3,
				/obj/item/book/granter/spell/blackstone/sicknessray = 2,
				/obj/item/book/granter/spell/blackstone/strengthen_undead = 2
			)
		if("tools")
			loot = list(
				// tools
				/obj/item/rogueweapon/shovel = 3,
				/obj/item/rogueweapon/thresher = 3,
				/obj/item/flint = 4,
				/obj/item/rogueweapon/stoneaxe/woodcut = 3,
				/obj/item/rogueweapon/stoneaxe = 3,
				/obj/item/rogueweapon/hammer = 3,
				/obj/item/rogueweapon/tongs = 3,
				/obj/item/rogueweapon/pick = 3
			)
		if("misc")
			loot = list(
				/obj/item/rogue/instrument/flute = 3,
				/obj/item/ash = 5,
				/obj/item/shard = 5,
				/obj/item/candle/yellow = 3,
				/obj/item/flashlight/flare/torch = 3,
				/obj/item/reagent_containers/glass/bowl = 4,
				/obj/item/reagent_containers/glass/cup = 4,
				/obj/item/reagent_containers/glass/cup/wooden = 4,
				/obj/item/reagent_containers/glass/cup/steel = 3,
				/obj/item/reagent_containers/glass/cup/golden = 1,
				/obj/item/reagent_containers/glass/cup/skull = 1,
				/obj/item/reagent_containers/glass/bucket/wooden = 3,
				/obj/item/natural/feather = 4,
				/obj/item/paper/scroll = 3,
				/obj/item/rope = 3,
				/obj/item/rope/chain = 3,
				/obj/item/storage/roguebag/crafted = 3,
				/obj/item/clothing/mask/cigarette/pipe = 3,
				/obj/item/paper = 3,
				/obj/item/reagent_containers/glass/bowl = 3,
				/obj/item/storage/bag/tray = 3
			)
		if("trait")
			loot = list(
				/obj/item/rogueweapon/huntingknife/idagger/silver=33,
				/obj/item/book/granter/trait/war/undying=13,
				/obj/item/book/granter/trait/war/relentless=13,
				/obj/item/book/granter/trait/mobility/bogtrek=33,
				/obj/item/book/granter/trait/defense/mediumarmor=40,
				/obj/item/book/granter/trait/defense/heavyarmor=40,
				/obj/item/book/granter/trait/acrobat=40,
				/obj/item/book/granter/trait/succubus=13,
				/obj/item/riddleofsteel=13,
				/obj/item/clothing/neck/roguetown/talkstone=13
			)
	if(loot == null)
		log_runtime("Some stupid RETARD put the loot_type of [src] wrong at [get_area(src)], x[src.x], y[src.y], z[src.z]") //must keep the roguetown tradition.
		return
	for(var/damn in 1 to loot_num_to_spawn)
		var/I = pickweight(loot)
		new I(src)

/obj/structure/closet/crate/chest/refilling/open(mob/living/user)
	. = ..()
	if(!found)
		found = TRUE
		icon_state = "dungeon_chest_0"
		base_icon_state = "dungeon_chest_0"
		update_icon()
		reset_timer = addtimer(CALLBACK(src, PROC_REF(try_reset_chest), time_to_reset), TIMER_STOPPABLE) //start a timer to reset this chest later.

/obj/structure/closet/crate/chest/refilling/mimic
	icon_state = "dungeon_chest_1"
	base_icon_state = "dungeon_chest_1"

/obj/structure/closet/crate/chest/refilling/mimic/attack_hand(mob/living/user)
	. = ..()
	playsound(src.loc, 'sound/vo/mobs/mimic/surprise.ogg', 100, TRUE)
	//playsound(src.loc, 'modular_stonehedge/sound/mgsalert.ogg', 100, TRUE)
	//need to make overhead effects, and lewd mimic when someone makes it.
	visible_message(span_danger("The [src] is a mimic!"))
	new	/mob/living/simple_animal/hostile/rogue/mimic (get_turf(src))
	qdel(src)

