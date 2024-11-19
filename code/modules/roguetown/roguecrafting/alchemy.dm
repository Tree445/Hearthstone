/// potions and tinctures

/datum/crafting_recipe/roguetown/alchemy
	req_table = FALSE
	verbage_simple = "mix"
	skillcraft = /datum/skill/misc/alchemy
	subtype_reqs = TRUE
	structurecraft = /obj/structure/fluff/alch

/datum/crafting_recipe/roguetown/alchemy/thermometer
	name = "Thermoscope"
	result = list(/obj/item/thermometer)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1, /datum/reagent/mercury = 5)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/bbomb
	name = "Bottle bomb"
	result = list(/obj/item/bomb)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1,/obj/item/reagent_containers/powder/gunpowder = 1, /obj/item/natural/cloth = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/ozium
	name = "Ozium Poppy"
	result = list(/obj/item/reagent_containers/food/snacks/grown/poppy)
	reqs = list(/obj/item/ash = 1, /obj/item/reagent_containers/food/snacks/grown/berries/rogue = 1, /obj/item/reagent_containers/food/snacks/grown/rogue/sweetleafdry = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/puremoon
	name = "Purest Moondust"
	result = list(/obj/item/reagent_containers/powder/moondust/purest)
	reqs = list(/obj/item/reagent_containers/powder/moondust, /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry = 1, /datum/reagent/berrypoison = 5)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/spice
	name = "Spice Melange"
	result = list(/obj/item/reagent_containers/powder/spice)
	reqs = list(/obj/item/ash = 1, /obj/item/reagent_containers/food/snacks/grown/rogue/sweetleafdry = 1, /datum/reagent/berrypoison = 5)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/salt
	name = "Salt Pile"
	result = list(/obj/item/reagent_containers/powder/salt)
	reqs = list(/obj/item/ash = 1, /datum/reagent/water = 10, /obj/item/reagent_containers/food/snacks/fat = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/alchemy/salt_2
	name = "Salt Pile"
	result = list(/obj/item/reagent_containers/powder/salt)
	reqs = list(/obj/item/ash = 1, /datum/reagent/water = 10, /obj/item/reagent_containers/food/snacks/rogue/meat/mince = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/alchemy/manna_pot
	name = "Manna Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/manapot)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 1,
		/obj/item/reagent_containers/powder/sublimate = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/manna_pot_3x
	name = "3x Manna Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/manapot,/obj/item/reagent_containers/glass/bottle/rogue/manapot,/obj/item/reagent_containers/glass/bottle/rogue/manapot)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 3,
		/obj/item/reagent_containers/powder/sublimate = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/minorhealthpot
	name = "Minor Health Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/minorhealthpot)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 1,
		/obj/item/reagent_containers/food/snacks/grown/herbs = 1,
		/obj/item/ash = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/alchemy/minorhealthpot3x
	name = "3x Minor Health Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/minorhealthpot,/obj/item/reagent_containers/glass/bottle/rogue/minorhealthpot,/obj/item/reagent_containers/glass/bottle/rogue/minorhealthpot)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 3,
		/obj/item/reagent_containers/food/snacks/grown/herbs = 2,
		/obj/item/ash = 2)
	craftdiff = 0

/datum/crafting_recipe/roguetown/alchemy/healthpot
	name = "Health Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/healthpot)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 1,
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 1,
		/obj/item/ash = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/healthpot3x
	name = "3x Health Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/healthpot,/obj/item/reagent_containers/glass/bottle/rogue/healthpot,/obj/item/reagent_containers/glass/bottle/rogue/healthpot)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 3,
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 2,
		/obj/item/ash = 2)
	craftdiff = 2

//fuck fish
/datum/crafting_recipe/roguetown/alchemy/healthpot3xalt
	name = "3x Health Potion (Honey)"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/healthpot,/obj/item/reagent_containers/glass/bottle/rogue/healthpot,/obj/item/reagent_containers/glass/bottle/rogue/healthpot)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 3,
		/obj/item/reagent_containers/food/snacks/rogue/honey = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/majorhealthpot
	name = "Major Health Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/majorhealthpot)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 1,
		/obj/item/reagent_containers/food/snacks/grown/apple = 1,
		/obj/item/ash = 1,
		/obj/item/natural/bone = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/alchemy/majorhealthpot3x
	name = "3x Major Health Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/majorhealthpot,/obj/item/reagent_containers/glass/bottle/rogue/majorhealthpot,/obj/item/reagent_containers/glass/bottle/rogue/majorhealthpot)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 3,
		/obj/item/reagent_containers/food/snacks/grown/apple = 2,
		/obj/item/ash = 2,
		/obj/item/natural/bone = 2)
	craftdiff = 4

/datum/crafting_recipe/roguetown/alchemy/sublimeambrosia
	name = "Sublime Ambrosia Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/sublimeambrosia)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 1,
		/datum/reagent/medicine/minorhealthpot = 45,
		/datum/reagent/medicine/healthpot = 45,
		/datum/reagent/medicine/majorhealthpot = 45,
		/obj/item/ash = 1,
		/obj/item/reagent_containers/powder/sublimate = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/alchemy/sublimeambrosia3x
	name = "3x Sublime Ambrosia Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/sublimeambrosia, /obj/item/reagent_containers/glass/bottle/rogue/sublimeambrosia, /obj/item/reagent_containers/glass/bottle/rogue/sublimeambrosia)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 3,
		/datum/reagent/medicine/minorhealthpot = 15,
		/datum/reagent/medicine/healthpot = 15,
		/datum/reagent/medicine/majorhealthpot = 15,
		/obj/item/reagent_containers/powder/mfire = 1)
	craftdiff = 6

/datum/crafting_recipe/roguetown/alchemy/antipoison_pot
	name = "Anti Poison Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/antipoisonpot)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 1,
		/obj/item/reagent_containers/powder/sublimate = 1,
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/antipoison_pot_3x
	name = "3x Anti Poison Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/antipoisonpot,/obj/item/reagent_containers/glass/bottle/rogue/antipoisonpot,/obj/item/reagent_containers/glass/bottle/rogue/antipoisonpot)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 3,
		/obj/item/reagent_containers/powder/sublimate = 2,
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/antipreg_pot
	name = "Sterility Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/antipregnancy)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1, /obj/item/reagent_containers/powder/crystalglass = 1, /obj/item/clothing/head/peaceflower = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/antipreg_pot_3x
	name = "3x Sterility Potion"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/antipregnancy,/obj/item/reagent_containers/glass/bottle/rogue/antipregnancy,/obj/item/reagent_containers/glass/bottle/rogue/antipregnancy)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 3, /obj/item/reagent_containers/powder/crystalglass = 2, /obj/item/clothing/head/peaceflower = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/peacebloom
	name = "Peacebloom"
	result = list(/obj/item/clothing/head/peaceflower = 1)
	reqs = list(/obj/item/rogueweapon/huntingknife/stoneknife = 1, /obj/item/reagent_containers/powder/crystalglass = 1, /obj/item/reagent_containers/food/snacks/grown/poppy)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/gunpowder
	name = "firepowder"
	result = list(/obj/item/reagent_containers/powder/gunpowder)
	reqs = list(/obj/item/ash = 2, /obj/item/rogueore/coal = 1)
	craftdiff = 2

/// bottle craft


/datum/crafting_recipe/roguetown/alchemy/glassbottles
	name = "2x glass bottles"
	result = list(/obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/bottle)
	reqs = list(
		/obj/item/natural/stone = 1,
		/obj/item/natural/dirtclod = 1)
	craftdiff = 1
	verbage_simple = "forge"

/// transmutation

/datum/crafting_recipe/roguetown/alchemy/distill
	name = "distill water"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/water = 1)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 1,
		/datum/reagent/water = 99) // 45 and 90 u allows for bottle duping. This requires 33oz containers, preventing the dupe.
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/w2m
	name = "transmute water to milk"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/milk = 1)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 1,
		/datum/reagent/water = 99) // 45 and 90 u allows for bottle duping. This requires 33oz containers, preventing the dupe.
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/w2w
	name = "transmute water to wine" /// eat your heart out god.
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/wine = 1)
	reqs = list(
		/obj/item/reagent_containers/glass/bottle = 1,
		/datum/reagent/water = 99) // 45 and 90 u allows for bottle duping. This requires 33oz containers, preventing the dupe.
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/g2wes
	name = "transmute grain to westleach"
	result = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/wheat = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/w2swa
	name = "transmute westleach to swampweed"
	result = list(/obj/item/reagent_containers/food/snacks/grown/rogue/sweetleaf = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/f2gra
	name = "transmute fiber to grain"
	result = list(/obj/item/reagent_containers/food/snacks/grown/wheat = 1)
	reqs = list(/obj/item/natural/fibers = 4)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/b2app
	name = "transmute berry to apple"
	result = list(/obj/item/reagent_containers/food/snacks/grown/apple = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/poisonberry
	name = "corrupt berry"
	result = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 1, /obj/item/reagent_containers/food/snacks/grown/rogue/sweetleaf = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/safeberry
	name = "purify berry"
	result = list(/obj/item/reagent_containers/food/snacks/grown/rogue = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison = 1, /obj/item/reagent_containers/food/snacks/grown/herbs = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/w2coa
	name = "transmute small log to coal"
	result = list(/obj/item/rogueore/coal = 1)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	craftdiff = 0
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/alchemy/w2l
	name = "combine small logs into large log"
	result = list(/obj/item/grown/log/tree/large = 1)
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/natural/fibers)
	craftdiff = 0

/datum/crafting_recipe/roguetown/alchemy/l2coa
	name = "transmute log to coal"
	result = list(/obj/item/rogueore/coal,/obj/item/rogueore/coal,/obj/item/rogueore/coal,/obj/item/rogueore/coal)
	reqs = list(/obj/item/grown/log/tree/large = 1)
	craftdiff = 1
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/alchemy/s2coa
	name = "transmute stone to coal"
	result = list(/obj/item/rogueore/coal = 1)
	reqs = list(/obj/item/natural/stone = 4)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/coa2s
	name = "transmute coal to stones"

	result = list(/obj/item/natural/stone,/obj/item/natural/stone,/obj/item/natural/stone,/obj/item/natural/stone,/obj/item/natural/stone)
	reqs = list(/obj/item/rogueore/coal = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/c2irn
	name = "transmute coal to iron"
	result = list(/obj/item/rogueore/iron = 1)
	reqs = list(/obj/item/rogueore/coal = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/i2gol
	name = "transmute iron to gold"
	result = list(/obj/item/rogueore/gold = 1)
	reqs = list(/obj/item/rogueore/iron = 4)
	craftdiff = 4

/datum/crafting_recipe/roguetown/alchemy/i2top // Keep topers and their trinkets cheap to prevent wealth creep. Cheap means of getting gem dust, for potions.
	name = "transmute iron to toper"
	result = list(/obj/item/roguegem/yellow = 1)
	reqs = list(
		/obj/item/rogueore/iron = 1, //Toper will be worth 30 mammon. Iron ingot is worth 25.
		/obj/item/natural/stone = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/alchemy/alglass // TO-DO: add construction recipe for church windows using this. Touching a church window with mage hand will invert it to the evil version and vice versa.
	name = "transmute stone to alchemical glass"
	result = list(/obj/item/roguegem = 1)
	reqs = list(
		/obj/item/reagent_containers/powder/sublimate = 1,
		/obj/item/natural/stone = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/t2gem
	name = "transmute topaz to emerald"
	result = list(/obj/item/roguegem/green = 1)
	reqs = list(
		/obj/item/roguegem/yellow = 2)
	craftdiff = 4

/datum/crafting_recipe/roguetown/alchemy/g2saf
	name = "transmute emerald to sapphire"
	result = list(/obj/item/roguegem/violet = 1)
	reqs = list(
		/obj/item/roguegem/green = 1,
		/obj/item/roguegem/yellow = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/alchemy/s2blo
	name = "transmute sapphire to turquise"
	result = list(/obj/item/roguegem/blue = 1)
	reqs = list(
		/obj/item/roguegem/violet = 1,
		/obj/item/roguegem/yellow = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/alchemy/b2ron
	name = "transmute turquoise to ruby"
	result = list(/obj/item/roguegem/red = 1)
	reqs = list(
		/obj/item/roguegem/blue = 1,
		/obj/item/roguegem/yellow = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/alchemy/r2dia
	name = "transmute ruby to diamond"
	result = list(/obj/item/roguegem/diamond = 1)
	reqs = list(
		/obj/item/roguegem/red = 1,
		/obj/item/roguegem/yellow = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/alchemy/d2ros
	name = "transmute diamonds to riddle of steel" /// holy grail requires legendary. (sell price on average is 350. ruby and diamond worth 100 each. you get to legndary you deserve 150-200 profit)
	result = list(/obj/item/riddleofsteel = 1)
	reqs = list(
		/obj/item/roguegem/diamond = 1,
		/obj/item/rogueore/iron = 3, //3 iron and 1 coal, same as the ratio of materials in a greatforge.
		/obj/item/rogueore/coal = 1)
	craftdiff = 6

/datum/crafting_recipe/roguetown/alchemy/e2s
	name = "transmute steel to silver" // Making it is still pretty involved, but at least now you aren't wasting 3 entire ingots of steel plus almost 300 mammon worth of potential profit for a single silver ingot.
	result = list(/obj/item/ingot/silver = 4)
	reqs = list(/obj/item/rogueore/gold = 2, /obj/item/ingot/steel = 4, /obj/item/roguegem/violet = 2)
	craftdiff = 6

/datum/crafting_recipe/roguetown/alchemy/moon
	name = "Moondust"
	result = list(/obj/item/reagent_containers/powder/moondust)
	reqs = list(
		/obj/item/ash = 1,
		/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry = 2) // Probably better to just buy from the merchant.
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/t2sub
	name = "Sublimate Topaz Dust"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate)
	reqs = list(
		/obj/item/reagent_containers/powder/toper = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/g2sub
	name = "Sublimate Emerald Dust"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate)
	reqs = list(
		/obj/item/reagent_containers/powder/gemerald = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/s2sub
	name = "Sublimate Sapphire Dust"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate)
	reqs = list(
		/obj/item/reagent_containers/powder/saffira = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/b2sub
	name = "Sublimate Quartz Dust"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate)
	reqs = list(
		/obj/item/reagent_containers/powder/blortz = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/r2sub
	name = "Sublimate Ruby Dust"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate)
	reqs = list(
		/obj/item/reagent_containers/powder/rontz = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/d2sub
	name = "Sublimate Diamond Dust"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,)
	reqs = list(
		/obj/item/reagent_containers/powder/dorpel = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/m2sub
	name = "Sublimate Malum's Fire"
	result = list(
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,
		/obj/item/reagent_containers/powder/sublimate,)
	reqs = list(
		/obj/item/reagent_containers/powder/mfire = 1,
		/obj/item/reagent_containers/powder/moondust = 1)
	craftdiff = 1

/////// I gotta put this somewhere so. here./////////////////////


/obj/item/reagent_containers/hypospray/medipen/sealbottle
	name = "sealed bottle item"
	desc = "If you see this, call an admin."
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "THEbottle"

/obj/item/reagent_containers/hypospray/medipen/sealbottle/attack_self(mob/user)
	if(has_cap)
		has_cap = FALSE
		icon_state = "[icon_state]_nocap"  // Update icon state for no cap
		to_chat(user, span_notice("You thumb off the cork from [src]."))
		playsound(src, 'modular/Smoker/sound/corkpop.ogg', 100, TRUE)
	else
		to_chat(user, span_warning("[src] doesn't have a cork."))

/obj/item/reagent_containers/hypospray/medipen/sealbottle/update_icon()
	if(reagents.total_volume > 0)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]0"

/obj/item/reagent_containers/hypospray/medipen/sealbottle/inject(mob/living/M, mob/user)
	if(reagents.total_volume <= 0)
		return FALSE
	if(!M)
		return FALSE
	if(user == M)
		to_chat(user, span_danger("You chug [src]!"))
	else
		to_chat(user, span_danger("You force [M] to swallow [src]."))
	reagents.trans_to(M, reagents.total_volume, transfered_by = user)  // Transfer all remaining reagents
	reagents.maximum_volume = 0  // Makes them useless afterwards
	reagents.flags = NONE  // Ensure reagents are deactivated
	update_icon()
	playsound(src, 'modular/Smoker/sound/chug.ogg', 100, TRUE)
	return TRUE

/obj/item/reagent_containers/hypospray/medipen/sealbottle/attack(mob/user)
	if(user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		if(has_cap)
			to_chat(user, span_warning("[src] has a cork still! You need to remove it first."))
			return
		inject(user, user)

/obj/item/reagent_containers/hypospray/medipen/sealbottle/attack(mob/user)
	if(user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		if(has_cap)
			to_chat(user, span_warning("[src] has a cork still! You need to remove it first."))
			return
		inject(user, user)

/obj/item/reagent_containers/hypospray/medipen/sty
	name = "sealed sty"
	desc = "If you see this, call an admin."
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "sty"

/obj/item/reagent_containers/hypospray/medipen/sty/attack_self(mob/user)
	if(has_cap)
		has_cap = FALSE
		icon_state = "[icon_state]_nocap"  // Update icon state for no cap
		to_chat(user, span_notice("You bite the cap off [src] and spit it out."))
		playsound(src, 'modular/Smoker/sound/capoff.ogg', 100, TRUE)
	else
		to_chat(user, span_warning("[src] doesn't have a cap."))

/obj/item/reagent_containers/hypospray/medipen/sty/update_icon()
	if(reagents.total_volume > 0)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]0"

/obj/item/reagent_containers/hypospray/medipen/sty/inject(mob/living/M, mob/user)
	if(reagents.total_volume <= 0)
		return FALSE
	if(!M)
		return FALSE
	if(user == M)
		to_chat(user, span_danger("You inject yourself with [src]."))
	else
		to_chat(user, span_danger("You inject [M] with [src]!"))
	reagents.trans_to(M, reagents.total_volume, transfered_by = user)  // Transfer all remaining reagents
	reagents.maximum_volume = 0  // Makes them useless afterwards
	reagents.flags = NONE  // Ensure reagents are deactivated
	update_icon()
	playsound(src, 'modular/Smoker/sound/inject.ogg', 100, TRUE)
	return TRUE

/obj/item/reagent_containers/hypospray/medipen/sty/attack(mob/user)
	if(user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		if(has_cap)
			to_chat(user, span_warning("[src] has a cap still! You need to remove it first."))
			return
		inject(user, user)

/obj/item/reagent_containers/pill/caffpill
	name = "WAKE-UP"
	desc = "a handful of Dr V's pep-pills. a promise to make you both alert and have an uncomfortable amount of vigor for everyone involved. Who needs sleep anyway? thats how you get diddled by an orc!"
	icon_state = "pillg"
	icon = 'icons/roguetown/items/surgery.dmi'
	list_reagents = list(/datum/reagent/medicine/caffeine = 1, /datum/reagent/medicine/antihol = 10, /datum/reagent/consumable/coffee = 81) //coffee OD is safe. causes jitters for awhile.
	dissolvable = FALSE
	grind_results = null

/obj/item/reagent_containers/pill/pnkpill
	name = "PNKBAWLS"
	desc = "a handful of Dr V's pink little balls. says they restore vitality, you are pretty certain this is watered down red mixed with ash"
	icon_state = "pinkb"
	icon = 'icons/roguetown/items/surgery.dmi'
	list_reagents = list(/datum/reagent/ash = 15, /datum/reagent/iron = 15, /datum/reagent/medicine/healthpot = 24) //mug of red, bottle is 45u
	dissolvable = FALSE
	grind_results = null

/obj/item/reagent_containers/hypospray/medipen/sty/detox
	name = "DETOX"
	desc = "Dr. V's well aint this funny? a snake curing toxin's and venoms. heresy... purges the body of all that is not natural."
	volume = 34
	amount_per_transfer_from_this = 34
	list_reagents = list(/datum/reagent/medicine/antihol = 10, /datum/reagent/medicine/pen_acid = 24)

/obj/item/reagent_containers/hypospray/medipen/sealbottle/reju
	name = "rejuv elixer"
	desc = "Dr V's special formulated body revitalizer; restores blood, helps seal wounds, helps to stabalize breathing and numbs pain with a non-addictive snake venom derived analgesic. Single dose. Caffeinated, just like the snake that made it."
	icon_state = "THEbottle"
	volume = 16
	amount_per_transfer_from_this = 16
	list_reagents = list(/datum/reagent/medicine/stimu = 15, /datum/reagent/medicine/caffeine = 1)

/obj/item/reagent_containers/hypospray/medipen/sealbottle/purify
	name = "purifying elixer"
	desc = "Dr V's special formulated body purifier; A powerful drug that purifies the blood and seals wounds painfully on the body. flooding your blood with anything like this isnt exactly healthy but, if it stops you needing to use the word 'festering' to describe part of your body, it's worth it."
	icon_state = "THEbottle"
	volume = 30
	amount_per_transfer_from_this = 30
	list_reagents = list(/datum/reagent/medicine/purify = 20, /datum/reagent/ozium = 5, /datum/reagent/consumable/ethanol/hooch = 5) // lil laudanum for your troubles

/obj/item/reagent_containers/hypospray/medipen/sealbottle/mori
	name = "MORIBUND"
	desc = "Dr. V's elixer of life, because sometimes even necra needs a second opinion. WARNING: absolutely do not drink more than a bottle. mend corpse prior to imbide."
	volume = 5
	amount_per_transfer_from_this = 5
	list_reagents = list(/datum/reagent/medicine/mori = 5,)

/obj/item/natural/cloth/bandage
	name = "bandage"
	desc = "A simple bandage used to bind wounds. takes longer to apply but is more effective than just cloth. Slowly heals wounds and binded fractures."
	icon_state = "bandageroll"
	icon = 'icons/roguetown/items/surgery.dmi'
	possible_item_intents = list(/datum/intent/use)
	force = 0
	throwforce = 0
	obj_flags = null
	firefuel = 5 MINUTES
	resistance_flags = FLAMMABLE
	slot_flags = ITEM_SLOT_MOUTH | ITEM_SLOT_HIP
	body_parts_covered = null
	experimental_onhip = TRUE
	max_integrity = 20
	muteinmouth = TRUE
	w_class = WEIGHT_CLASS_TINY
	spitoutmouth = FALSE
	bundletype = /obj/item/natural/bundle/cloth/bandage
	bandage_effectiveness = 1

/obj/item/natural/cloth/bandage/attack(mob/living/carbon/human/M, mob/user)
	if (!M.can_inject(user, TRUE)) return
	if (!ishuman(M)) return
	var/mob/living/carbon/human/H = M
	var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
	if (!affecting) return
	if (affecting.bandage) 
		to_chat(user, "There is already a bandage.")
		return
	var/used_time = 100
	if (H.mind) 
		used_time -= (H.mind.get_skill_level(/datum/skill/misc/medicine) * 10)
	playsound(loc, 'sound/foley/bandage.ogg', 100, FALSE)
	if (!do_mob(user, M, used_time)) return
	playsound(loc, 'sound/foley/bandage.ogg', 100, FALSE)
	user.dropItemToGround(src)
	affecting.try_bandage(src)
	H.update_damage_overlays()
	
	// Heal the specific body part every second while bandaged and manage wound pain and disabling effects
	addtimer(CALLBACK(src, /proc/heal_and_manage_pain_disabling, H, affecting), 10, 1, TRUE)
	if (M == user)
		user.visible_message("You bandage your [affecting].")
	else
		user.visible_message("You bandage [M]'s [affecting].")

/proc/heal_and_manage_pain_disabling(var/mob/living/carbon/human/H, var/obj/item/bodypart/affecting)
	if (!affecting) return
	affecting.heal_wounds(0.5)
	for (var/datum/wound/W in affecting.wounds)
		if (W.woundpain > 30)
			W.woundpain = 30

/obj/item/natural/bundle/cloth/bandage
	name = "roll of bandages"
	desc = "A bundle of bandages used to bind wounds. More effective than just cloth."
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "bandageroll1"
	possible_item_intents = list(/datum/intent/use)
	force = 0
	throwforce = 0
	maxamount = 3
	obj_flags = null
	firefuel = 15 MINUTES
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_TINY
	stacktype = /obj/item/natural/cloth/bandage
	stackname = "bandages"
	icon1 = "bandageroll1"
	icon1step = 2
	icon2 = "bandageroll2"
	icon2step = 3

/obj/item/book/rogue/snek
	name = "Snake Stitches"
	desc = "{<font color='green'><blink>By Dr.volva, snake.</blink></font>}"
	icon_state ="book6_0"
	base_icon_state = "book6"
	bookfile = "medical.json"

/obj/item/natural/bundle/cloth/bandage/full
	icon_state = "bandageroll2"
	amount = 3
	firefuel = 60 MINUTES

/datum/crafting_recipe/roguetown/bandage
	name = "essence of purity"
	result = /obj/item/reagent_containers/powder/alch/pur
	reqs = list(/obj/item/reagent_containers/powder/salt = 1, /obj/item/reagent_containers/powder/alch/pipe = 1,)
	craftdiff = 5
	skillcraft = /datum/skill/misc/alchemy

/datum/crafting_recipe/roguetown/bandage
	name = "essence of life"
	result = /obj/item/reagent_containers/powder/alch/life
	reqs = list(/obj/item/reagent_containers/powder/salt = 1, /datum/reagent/medicine/healthpot = 45, /obj/item/reagent_containers/powder/alch/mincem = 1,)
	craftdiff = 6
	skillcraft = /datum/skill/misc/alchemy
