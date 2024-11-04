/datum/job/roguetown/squire
	title = "Squire"
	flag = SQUIRE
	department_flag = APPRENTICES
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_races = RACES_ALL_KINDS
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)
	cmode_music = 'sound/music/combat_squire.ogg'
	advclass_cat_rolls = list(CTAG_SQUIRE = 20)

	tutorial = "Your folks said you were going to be something, they had better aspirations for you than the life of a peasant. You practiced the basics \
		in the field alongside your friends, swordfighting with sticks, chasing rabbits with grain flail, and helping around the house lifting heavy \
		bags of grain. The Knight took notice of your potential and brought you on as his personal ward. You're going to be something someday."
	outfit = /datum/outfit/job/roguetown/squire
	display_order = JDO_SQUIRE
	give_bank_account = TRUE
	min_pq = -5 //squires aren't great but they can do some damage
	max_pq = null
	

/datum/outfit/job/roguetown/squire
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/keyring/servant

/datum/job/roguetown/squire/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/squire/lancer
	name = "Pikeman Squire"
	tutorial = "History with riding, and a bit of practice with a spear have landed you in a promising mounted position."
	outfit = /datum/outfit/job/roguetown/squire/lancer
		
	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/lancer/pre_equip(mob/living/carbon/human/H)
	r_hand = /obj/item/rogueweapon/spear
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	cloak = /obj/item/clothing/cloak/stabard/guard
	backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/clothing/neck/roguetown/chaincoif = 1, /obj/item/rogueweapon/hammer = 1,)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)  // For repairing your good Royal Guards equipment
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("speed", 1)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/advclass/squire/footman
	name = "Footman Squire"
	tutorial = "Years of hitting dummies with a sword and chasing your friends around have finally paid off."
	outfit = /datum/outfit/job/roguetown/squire/footman
		
	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/footman/pre_equip(mob/living/carbon/human/H)
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/sword
	cloak = /obj/item/clothing/cloak/tabard/knight/guard
	backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/clothing/neck/roguetown/chaincoif = 1, /obj/item/rogueweapon/hammer = 1,)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)  // For repairing your good Royal Guards equipment
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("speed", 1)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/advclass/squire/skirmisher
	name = "Bowman Squire"
	tutorial = "Coming from a background of hunters, your practice with a bow has proven useful for the keep."
	outfit = /datum/outfit/job/roguetown/squire/skirmisher
		
	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/skirmisher/pre_equip(mob/living/carbon/human/H)
	beltr = /obj/item/quiver/arrows
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/clothing/neck/roguetown/chaincoif = 1, /obj/item/rogueweapon/hammer = 1,)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)  // For repairing your good Royal Guards equipment
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("speed", 2)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
