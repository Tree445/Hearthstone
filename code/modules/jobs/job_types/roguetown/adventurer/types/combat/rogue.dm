/datum/advclass/rogue
	name = "Rogue"
	tutorial = "Rogues are men of shadows, and commonly associated with banditry. Most are usually akin to criminals, \
	and those who aren't are usually treated as such anyway, \
	they are most commonly associated with the god Xylix due to their skills in thievery"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/rogue
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/combat_rogue.ogg'

/datum/outfit/job/roguetown/adventurer/rogue/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list(
	"Rogue",
	"Assassin",
	"Swashbuckler",
	"Arcane Trickster",
	"Phantom"
	)
/* made assassin available for all and bit more balanced. Keeping this for future usage of contributor shit.
	if(check_contributor(H.ckey))
		H.visible_message(span_info("I contributed into this world, I have been around..."))
		classes += "Assassin"*/
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes
	switch(classchoice)
		if("Rogue")
			H.set_blindness(0)
			roguearch(H)
		if("Assassin")
			H.set_blindness(0)
			assassinarch(H)
		if("Swashbuckler")
			H.set_blindness(0)
			swashbucklerarch(H)
		if("Arcane Trickster")
			H.set_blindness(0)
			tricksterarch(H)
		if("Phantom")
			H.set_blindness(0)
			phantomarch(H)
	H.grant_language(/datum/language/thievescant)
	to_chat(H, "<span class='info'>I can gesture in thieves' cant with ,t before my speech.</span>")

//Rogue, crafty and tricky.
/datum/outfit/job/roguetown/adventurer/rogue/proc/roguearch(mob/living/carbon/human/H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/rogue_vanish)
	shoes = /obj/item/clothing/shoes/roguetown/boots
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 6, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/butchering, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/traps, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/butchering, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 4, TRUE)
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	gloves = /obj/item/clothing/gloves/roguetown/leather
	if(prob(30))
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	cloak = /obj/item/clothing/cloak/raincloak/rogue
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	beltr = /obj/item/quiver/bolts
	beltl = /obj/item/rogueweapon/huntingknife/idagger/steel
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	backpack_contents = list(/obj/item/lockpickring/mundane, /obj/item/rogueweapon/huntingknife/idagger/steel)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, TRAIT_GENERIC)
	H.change_stat("strength", -1)
	H.change_stat("perception", 2)
	H.change_stat("speed", 4)
	H.change_stat("intelligence", 2)

//Assassin, nearly same as rogue but not versatile in weapon skills yet specialized in knives.
/datum/outfit/job/roguetown/adventurer/rogue/proc/assassinarch(mob/living/carbon/human/H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/rogue_vanish)
	shoes = /obj/item/clothing/shoes/roguetown/boots/hidden/berrypoison
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 6, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/traps, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE) //anatomy training for lethality id assume.
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE) //they fuck with poisons somewhat.
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 4, TRUE)
	pants = /obj/item/clothing/under/roguetown/trou/leather
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	wrists = /obj/item/clothing/wrists/roguetown/hiddenblade
	if(H.gender == FEMALE) //funny
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron/bikini
	else
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	cloak = /obj/item/clothing/cloak/raincloak/rogue
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/huntingknife/idagger/steel
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	beltr = /obj/item/quiver/Pbolts
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) //they are killers
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.change_stat("perception", 1)
	H.change_stat("speed", 4)
	H.change_stat("intelligence", 2)
	H.visible_message(span_info("I honed my skills as an assassin through the years. My bracers have a hidden blade, and my boots have a bottle of berry poison."))
	backpack_contents = list(/obj/item/lockpickring/mundane, /obj/item/rogueweapon/huntingknife/idagger/steel)

//Swashbuckler, Less thief-ish skills, but you have good sword skills plus shield skill and a parry dagger. And an actual str bonus wow.
//although it looks like bucklers take your main hand weapon skill for defense wtf.
/datum/outfit/job/roguetown/adventurer/rogue/proc/swashbucklerarch(mob/living/carbon/human/H)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 1, TRUE)
	head = /obj/item/clothing/head/roguetown/helmet/tricorn
	shoes = /obj/item/clothing/shoes/roguetown/boots
	pants = /obj/item/clothing/under/roguetown/trou/leather
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/parrying)
	gloves = /obj/item/clothing/gloves/roguetown/angle
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	if(H.gender == FEMALE) //funny
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
	else
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	cloak = /obj/item/clothing/cloak/half
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/sword/rapier
	beltr = /obj/item/rogueweapon/shield/buckler
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/parrying)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) //if they got all the shield and parry stuff, might aswell.
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC) //extra damage to groin (dirty fighting)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC) //funny nose grab.
	H.change_stat("strength", 1)
	H.change_stat("speed", 2)
	H.change_stat("intelligence", 2)
	H.visible_message(span_info("I trained as a swashbuckler. I have some skills and tricks under my cape."))

// Arcane Trickster - A charlatan, magic using rogue (based on arcane trickster archetype from 5e)
/datum/outfit/job/roguetown/adventurer/rogue/proc/tricksterarch(mob/living/carbon/human/H)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/butchering, 2, TRUE)
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	gloves = /obj/item/clothing/gloves/roguetown/leather
	if(prob(30))
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	cloak = /obj/item/clothing/cloak/raincloak/rogue
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/huntingknife/idagger/steel
	beltl = /obj/item/rogueweapon/huntingknife/idagger/steel
	backpack_contents = list(/obj/item/lockpick)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC) //extra damage to groin (dirty fighting)
	ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, TRAIT_GENERIC)
	H.change_stat("strength", -1)
	H.change_stat("perception", 2)
	H.change_stat("speed", 2)
	H.change_stat("intelligence", 3)
	H.visible_message(span_info("I’m not just a thief. I'm a master of illusion and deception. One moment, I'm a harmless vagabond. The next, I'm a blur of motion, leaving my pursuers bewildered and outwitted."))
	H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)
	if(H.mind)
		H.mind.adjust_spellpoints(3)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/rogue_knock)

//Phantom, A death based rogue that can speak with the dead. (based on phantom archetype from 5e)
/datum/outfit/job/roguetown/adventurer/rogue/proc/phantomarch(mob/living/carbon/human/H)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/butchering, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 3, TRUE)
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	gloves = /obj/item/clothing/gloves/roguetown/leather
	if(prob(30))
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	cloak = /obj/item/clothing/cloak/raincloak/rogue
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	beltr = /obj/item/quiver/bolts
	mask = /obj/item/clothing/mask/rogue/facemask //mystery, woulda given leper mask but it would mistake em to be sick.
	beltl = /obj/item/rogueweapon/mace/steel
	backpack_contents = list(/obj/item/lockpick, /obj/item/rogueweapon/huntingknife/idagger/steel)
	ADD_TRAIT(H, TRAIT_NOMOOD, TRAIT_GENERIC) //unaffected by mood changes
	ADD_TRAIT(H, TRAIT_FAKEDEATH, TRAIT_GENERIC) //appears as dead upon examination
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC) //never queezy around death
	ADD_TRAIT(H, TRAIT_SIXTHSENSE, TRAIT_GENERIC) //can hear ghosts
	ADD_TRAIT(H, TRAIT_SOUL_EXAMINE, TRAIT_GENERIC) //can determine if someone has their soul.
	H.change_stat("perception", 2)
	H.change_stat("constitution", 1)
	H.change_stat("speed", 3)
	H.change_stat("intelligence", 2)
	H.visible_message(span_info("I am a conduit between the living and the dead, half in, half out, a phantom that hears the whispers of the departed and uses them for my personal gain."))

//rogue innate vanish
/obj/effect/proc_holder/spell/self/rogue_vanish
	name = "Vanish"
	overlay_state = "Smoke Bomb"
	releasedrain = 0
	charge_max = 20 SECONDS
	still_recharging_msg = span_notice("I don't have another smoke bomb ready yet.")
	warnie = "sydwarning"
	invocation_emote_self = "pulls out a smoke bomb and slams it to the ground!"
	movement_interrupt = FALSE
	antimagic_allowed = TRUE
	sound = 'sound/misc/explode/incendiary (1).ogg'
	invocation = ""
	invocation_type = "none"
	associated_skill = /datum/skill/misc/sneaking
	cooldown_min = 10 SECONDS

/obj/effect/proc_holder/spell/self/rogue_vanish/cast(mob/living/carbon/human/user = usr)
	new /obj/effect/particle_effect/smoke(get_turf(user))
	user.visible_message(span_warning("[user] tosses a smokebomb to the ground and vanishes in a puff of smoke!"), span_notice("I toss a smokebomb to the ground and vanish in a puff of smoke!"))
	playsound(user.loc, 'sound/misc/explode/incendiary (1).ogg', 50, FALSE, -1)
	for(var/mob/living/simple_animal/hostile/nearmob in viewers(12, user))
		if(nearmob.target == user)
			nearmob.LoseTarget()
	for(var/mob/living/carbon/human/nearmob in viewers(12, user))
		if(nearmob.target == user)
			nearmob.back_to_idle()
	animate(user, alpha = 100, time = 0.5 SECONDS, easing = EASE_IN)
	user.mob_timers[MT_INVISIBILITY] = world.time + 6 SECONDS
	addtimer(CALLBACK(user, TYPE_PROC_REF(/mob/living, update_sneak_invis), TRUE), 6 SECONDS)
	addtimer(CALLBACK(user, TYPE_PROC_REF(/atom/movable, visible_message), span_warning("[user] fades back into view."), span_warning("I become visible again.")), 6 SECONDS)
	return FALSE
