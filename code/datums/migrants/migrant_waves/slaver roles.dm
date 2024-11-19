/datum/migrant_role/slaver/master
	name = "Underdark Slave-Master"
	greet_text = "You are here to collect permanent residents for the Underdark. You and your fellow slavers have spent a long time within the underdark; twisted by cruelty and the harshness of the sunless realm. Your Masters in the Underkeep demand fresh blood for their own devices. Take the unwilling and bring them to the underkeep to work. Break them in however is needed."
	outfit = /datum/outfit/job/roguetown/slaver/master
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/slaver/master/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/sheriff
	mask = /obj/item/clothing/head/roguetown/roguehood/black
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	shoes = /obj/item/clothing/shoes/roguetown/boots/hidden/poison
	pants = /obj/item/clothing/under/roguetown/chainlegs
	gloves = /obj/item/clothing/gloves/roguetown/angle
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/purple
	belt = /obj/item/storage/belt/rogue/leather/blackleather
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
	cloak = /obj/item/clothing/cloak/cape/purple
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/rogueweapon/whip/antique
	backpack_contents = list(/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1, /obj/item/rope/chain = 1, /obj/item/flint = 1)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("speed", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_XENOPHOBIC, TRAIT_GENERIC)

/datum/migrant_role/slaver/slavemercsword
	name = "Underdark Blade-Dancer"
	greet_text = "A prestigious warrior of the underdark. You are trusted enough you were selected to accompany the Slave Master, as their blades."
	outfit = /datum/outfit/job/roguetown/slaver/slavemercsword
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/slaver/slavemercsword/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/guard
	mask = /obj/item/clothing/head/roguetown/roguehood/black
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	shoes = /obj/item/clothing/shoes/roguetown/boots/hidden/poison
	pants = /obj/item/clothing/under/roguetown/trou/leather
	gloves = /obj/item/clothing/gloves/roguetown/angle
	belt = /obj/item/storage/belt/rogue/leather/blackleather
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/sword/long/rider
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backpack_contents = list(/obj/item/rope/chain = 1, /obj/item/rogueweapon/huntingknife/idagger = 1)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("speed", 1)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_XENOPHOBIC, TRAIT_GENERIC)

/datum/migrant_role/slaver/slavemercwhip
	name = "Underdark Slave-Driver"
	greet_text = "In the underdark, you are known as one of the finest taskmasters. Your skills with the whip are unmatched; beasts and mortals alike will submit."
	outfit = /datum/outfit/job/roguetown/slaver/slavemercwhip
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/slaver/slavemercwhip/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/sallet
	mask = /obj/item/clothing/mask/rogue/facemask
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	shoes = /obj/item/clothing/shoes/roguetown/boots/hidden/poison
	pants = /obj/item/clothing/under/roguetown/trou/leather
	gloves = /obj/item/clothing/gloves/roguetown/angle
	belt = /obj/item/storage/belt/rogue/leather/blackleather
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/whip
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backpack_contents = list(/obj/item/rope/chain = 1, /obj/item/rogueweapon/huntingknife/idagger = 1)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("speed", 1)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_XENOPHOBIC, TRAIT_GENERIC)

/datum/migrant_role/slaver/slavemercbow
	name = "Underdark Crack-Shot"
	greet_text = "A hired arm for the Zybantine Slave troup, and also a discount first aider. You have come from the western deserts of Zybantine, and are hired for the week you are spending on this island."
	outfit = /datum/outfit/job/roguetown/slaver/slavemercbow
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/slaver/slavemercbow/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/sallet
	mask = /obj/item/clothing/mask/rogue/facemask
	neck = /obj/item/clothing/neck/roguetown/gorget
	shoes = /obj/item/clothing/shoes/roguetown/boots/hidden/poison
	pants = /obj/item/clothing/under/roguetown/trou/leather
	gloves = /obj/item/clothing/gloves/roguetown/angle
	belt = /obj/item/storage/belt/rogue/leather/blackleather
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltr = /obj/item/quiver/Pbolts
	backpack_contents = list(/obj/item/rope/chain = 1, /obj/item/rogueweapon/huntingknife/cleaver/combat = 1, /obj/item/needle = 1)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("perception", 3)
		H.change_stat("speed", 2)
		H.change_stat("intelligence", 3)
		H.change_stat("endurance", 2)

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_XENOPHOBIC, TRAIT_GENERIC)

/datum/migrant_role/slaver/slavez
	name = "Slave"
	greet_text = "An unlucky slave, captured and trained. The party of Slavers found you some time ago, and you've been brought with as they intend to capture more."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/slaver/slavez/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/suit/roguetown/shirt/rags
	neck = /obj/item/clothing/neck/roguetown/gorget/prisoner
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/storage/belt/rogue/pouch
	beltr = /obj/item/flint
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	if(H.mind)
		H.virginity = TRUE
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/music, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/fishing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/tanning, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
		H.change_stat("strength", -3)
		H.change_stat("constitution", -2)
		H.change_stat("intelligence", 3)
		H.change_stat("speed", 1)
		H.change_stat("fortune", -1)

	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
