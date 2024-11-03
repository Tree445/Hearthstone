/datum/advclass/rogue
	name = "Rogue"
	tutorial = "Rogues are men of shadows, and commonly associated with banditry. Most are usually akin to criminals, \
	and those who aren't are usually treated as such anyway, \
	they are most commonly associated with the god Xylix due to their skills in thievery"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/rogue
	traits_applied = list(TRAIT_DODGEEXPERT)
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/combat_rogue.ogg'

/datum/outfit/job/roguetown/adventurer/rogue/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list(
		"Thief",
		"Swashbuckler",
		"Assassin",
		//"Phantom",
		//"Arcane Trickster",
		)
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes
	switch(classchoice)
		if("Thief")
			H.set_blindness(0)
			roguearch(H)
		if("Swashbuckler")
			H.set_blindness(0)
			swashbucklerarch(H)
		if("Assassin")
			H.set_blindness(0)
			assassinarch(H)
		/*if("Arcane Trickster")
			H.set_blindness(0)
			tricksterarch(H)
		if("Phantom")
			H.set_blindness(0)
			phantomarch(H)*/
	H.grant_language(/datum/language/thievescant)
	to_chat(H, "<span class='info'>I can gesture in thieves' cant with ,t before my speech.</span>")

/datum/outfit/job/roguetown/adventurer/rogue/proc/roguearch(mob/living/carbon/human/H)
	shoes = /obj/item/clothing/shoes/roguetown/boots
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, pick(5,6), TRUE) // this might not be balanced
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, pick(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	gloves = /obj/item/clothing/gloves/roguetown/leather
	if(prob(30))
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/huntingknife/idagger/steel
	beltl = /obj/item/rogueweapon/huntingknife/idagger/steel
	backpack_contents = list(/obj/item/lockpickring/mundane)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.change_stat("perception", 2)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 1)
	H.change_stat("strength", -1)
	H.change_stat("intelligence", -2)

// Less thief-ish skills, but more of a fighter
/datum/outfit/job/roguetown/adventurer/rogue/proc/swashbucklerarch(mob/living/carbon/human/H)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 1, TRUE)
	//head = /obj/item/clothing/head/roguetown/helmet/tricorn
	shoes = /obj/item/clothing/shoes/roguetown/boots
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	backpack_contents = list(/obj/item/lockpickring/mundane)
	if(prob(15))
		gloves = /obj/item/clothing/gloves/roguetown/angle
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/sword/iron
	beltl = /obj/item/storage/belt/rogue/pouch/coins/	
	H.change_stat("perception", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("strength", 1)
	H.change_stat("intelligence", -2)
	H.cmode_music = 'sound/music/combat_duelist.ogg'
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC) //extra damage to groin (dirty fighting)
	H.visible_message(span_info("I trained as a swashbuckler. I have some dirty tricks under my cape."))

//skilled in taking out single targets with intrigue
/datum/outfit/job/roguetown/adventurer/rogue/proc/assassinarch(mob/living/carbon/human/H)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE) // no more expert level crap
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE) //Hearthstone change.
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, pick(0,1), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	shoes = /obj/item/clothing/shoes/roguetown/boots/hidden/poison
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	gloves = /obj/item/clothing/gloves/roguetown/angle
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	wrists = /obj/item/clothing/wrists/roguetown/hiddenblade
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	beltl = /obj/item/quiver/bolts
	backpack_contents = list(/obj/item/bomb, /obj/item/paper/assassin)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
	H.change_stat("perception", 2)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 1)
	H.change_stat("intelligence", -2)
	
	//someone who is a writer can do this. I can't think of anything
	//H.visible_message(span_info("I am a trained assassin from the local assassins' guild,  hidden from most."))

/obj/item/paper/assassin
	info = "Assassin,<br><br>You have been equipped with the standard hidden wrist blade bracers to complete your missions. A small vial of poison is hidden in your boot that you may take your own life if captured.<br><br>Destroy this parchment at your earliest convenience.<br><br>-The Guild"

/*
// Arcane Trickster - A charlatan, magic using rogue (based on arcane trickster archetype from 5e)
/datum/outfit/job/roguetown/adventurer/rogue/proc/tricksterarch(mob/living/carbon/human/H)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, pick(1,1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, pick(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, pick(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/butchering, 2, TRUE)
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	head = /obj/item/clothing/head/roguetown/bardhat
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	gloves = /obj/item/clothing/gloves/roguetown/angle
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	cloak = /obj/item/clothing/cloak/half
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/sword/rapier
	beltr = /obj/item/rogueweapon/shield/buckler
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/parrying)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC) //extra damage to groin (dirty fighting)
	H.change_stat("strength", -1)
	H.change_stat("perception", 2)
	H.change_stat("speed", pick(1,2))
	H.change_stat("intelligence", 3)
	H.visible_message(span_info("I’m not just a thief. I'm a master of illusion and deception. One moment, I'm a harmless vagabond. The next, I'm a blur of motion, leaving my pursuers bewildered and outwitted."))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/rogue_knock)
	
// A death based rogue (based on phantom archetype from 5e)
/datum/outfit/job/roguetown/adventurer/rogue/proc/phantomarch(mob/living/carbon/human/H)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, pick(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, pick(0,1), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/butchering, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	head = /obj/item/clothing/head/roguetown/bardhat
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	gloves = /obj/item/clothing/gloves/roguetown/angle
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	cloak = /obj/item/clothing/cloak/half
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/sword/rapier
	beltr = /obj/item/rogueweapon/shield/buckler
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/parrying)
	ADD_TRAIT(H, TRAIT_NOMOOD, TRAIT_GENERIC) //unaffected by mood changes
	ADD_TRAIT(H, TRAIT_FAKEDEATH, TRAIT_GENERIC) //appears as dead upon examination
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC) //never queezy around death
	ADD_TRAIT(H, TRAIT_SIXTHSENSE, TRAIT_GENERIC) //can hear ghosts
	H.change_stat("perception", 2)
	H.change_stat("constitution", 1)
	H.change_stat("speed", pick(2,3))
	H.change_stat("intelligence", 2)
	H.visible_message(span_info("I am a conduit between the living and the dead, half in, half out, a phantom that hears the whispers of the departed and uses them for my personal gain."))
	
*/
