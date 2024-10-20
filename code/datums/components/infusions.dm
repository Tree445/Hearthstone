/datum/component/infusions
	/*
	How do I add more infusions?

	Well there are 2 types of infusions.
	One is stat, trait, ability changes while worn... GRANTER INFUSION
	The other type is a direct change of OR to the item. CHANGE INFUSION

	GRANTER INFUSION instructions:
	1. put the name of your infusion in the [itemtype]_infusions list below
	2. in the equipped proc there is a switch, place that same name of your infusion in an if statement there
	3. make it add the traits, stats or abilities under that if statement
	4. in the dropped proc, do the same thing but remove the stats, traits and abilities you added in the equip proc

	CHANGE INFUSION instructions:
	1. put the name of your infusion in the [itemtype]_infusions list below
	2. in the check_change_item proc there is a switch, place that same name of your infusion in an if statement there
	3. do to the item what you want to do to it, or delete the item after replacing it with something else. eg. delete a pouch and spawn a pouch of holding

	Hope that has been helpful in using this datum.
	~Ham-Hole
	*/



	var/infusion_name = "" //item turns into "[item] of [infusion_name]"

	var/helm_infusions = list(
		"awareness", //give perfect tracking XX
		"water breathing", //give waterbreathing XX
		//"disguise", //give disguise self X
		"intellect", //+2 intelligence XX
		"telepathy", //give encode thoughts XX
		"defense", //set to decent defense stats
		)

	var/mask_infusions = list(
		"night", //give night vision XX
		"defense", //set to decent defense stats
		)

	var/armor_infusions = list(
		"propulsion", //increase walking speed XX
		"magical strength", //cant be pushed +1 strength? XX 
		//"tools", //activate to get a hammer, pickaxe, axe, lockpick REMEMBER ME!!!!
		"fire resistance", //no fire trait XX
		)

	var/robe_infusions = list(
		"mind sharpening", //+2 int XX
		)
	var/cloak_infusions = list(
		//"protection", //mage armor X
		"the bat", //bat polymorph XX
		)
	var/belt_infusions = list(
		"giant strength", //+2 strength XX
		)
	var/bracers_infusions = list(
		"archery", //+2 bows +2 crossbows XX
		)
	var/gloves_infusions = list(
		"thievery", //+2 lockpick +2 stealing XX
		"ogre power", //+1 con +1 str XX
		"missile snaring", //can dodge projectiles (check for dodge) XX
		"swimming and climbing", //+2 swimming +2 climbing XX
		)
	var/boots_infusions = list(
		//"the winding path", //teleport 3 squares X
		"striding and springing", //leaper XX
		"the spider", //web walk and +2 climbing XX
		//"wings", //fly spell X
		//"levitation", //uh? something else? I guess? X
		)

	var/ring_infusions = list(
		//"spell-refueling", //refresh all spells (long cooldown)
		"jumping", //z-jump
		"mind shielding", //cant be scryed on (where the fuck is this ability)
		//"protection", //mage armor X
		"free action", //bog trekking (basically what it does, dumb name) XX
		"the ram", //charger trait, better charges XX
		)

	var/amulet_infusions = list(
		"thoughts", //encode thoughs
		"adaptation", //no stink
		"wound closure", //lesser miracle that effects both faithless and faithful
		"health", //+2 con
		)

	var/weapon_infusions = list(
		"radiance", 
		"returning", 
		)
	var/staff_infusions = list(
		"arcyne focus", 
		)

	var/shield_infusions = list(
		"repulsion", 
		)
	
	var/instrument_infusions = list(
		"haunting", 
		"the sewers", //gain summon rous spell XX
		)

	var/bottle_infusions = list(
		"alchemy", 
		)
	var/bag_infusions = list(
		"holding", 
		)
	var/rope_infusions = list(
		"climbing", //give legendary climbing when held 
		)
	var/stone_infusions = list(
		"sending", //create paired stones, activate one to send a message to the other 
		)
	var/lantern_infusions = list(
		"revealing", //double light 
		)
	var/eyes_infusions = list(
		"charming", //gain charm person spell (they are not able to attack you) 
		"the eagle", //+3 perception 
		)
	var/gem_infusions = list(
		"scrying", //scrying orb X
		)
	var/horn_infusions = list(
		"blasting", //funny horn X
		)

/datum/component/infusions/Initialize(mob/infuser = null, obj/item/roguegem/gem_used = null, random = TRUE)
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE

	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(equipped))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(dropped))
	RegisterSignal(parent, COMSIG_MOVABLE_IMPACT, PROC_REF(throw_impact))
	RegisterSignal(parent, COMSIG_ITEM_HIT_REACT, PROC_REF(blocked))
	var/obj/item/I = parent
	add_infusion(I, infuser, gem_used, random)

/datum/component/infusions/proc/check_change_item(obj/item/source, mob/user)
	switch(infusion_name)
		if("defense")
			if(istype(source, /obj/item/clothing/head)) //headwear
				var/new_blunt = 80
				var/new_slash = 90
				var/new_stab = 70
				var/new_bullet = 100
				source.armor.modifyRatingMax(new_blunt, new_slash, new_stab, new_bullet)
			else //mask
				var/new_blunt = 90
				var/new_slash = 100
				var/new_stab = 80
				var/new_bullet = 20
				source.armor.modifyRatingMax(new_blunt, new_slash, new_stab, new_bullet)
		if("radiance")
			source.light_range = 5
			source.light_color = "#da8c45"
			source.set_light_on(TRUE)
			START_PROCESSING(SSobj, source)
		if("alchemy")
			var/item = new /obj/item/reagent_containers/glass/bottle/alchemyjug

			user.put_in_hands(item, FALSE)
			qdel(parent)

		if("holding")
			var/item = new /obj/item/storage/belt/rogue/pouch/holding
			user.put_in_hands(item, FALSE)
			qdel(parent)

		if("sending")
			var/obj/item/natural/stone/sending/item1 = new /obj/item/natural/stone/sending
			var/obj/item/natural/stone/sending/item2 = new /obj/item/natural/stone/sending
			item1.paired_with = item2
			item2.paired_with = item1
			item1.icon_state = "whet"
			item2.icon_state = "whet"
			item1.color = "#d8aeff"
			item2.color = "#d8aeff"
			user.put_in_hands(item1, FALSE)
			user.put_in_hands(item2, FALSE)
			qdel(parent)

		if("revealing")
			source.set_light_range(source.light_range*2)

		if("charming")
			var/item = new /obj/item/organ/eyes/charming
			user.put_in_hands(item, FALSE)
			qdel(parent)

		if("the eagle")
			var/item = new /obj/item/organ/eyes/eagle
			user.put_in_hands(item, FALSE)
			qdel(parent)

		if("scrying")
			var/item = new /obj/item/scrying
			user.put_in_hands(item, FALSE)
			qdel(parent)

		if("blasting")
			var/item = new /obj/item/signal_horn/blasting
			user.put_in_hands(item, FALSE)
			qdel(parent)

/datum/component/infusions/proc/blocked(obj/item/source, mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the projectile", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)

/datum/component/infusions/proc/throw_impact(obj/item/source, atom/hit_atom, datum/thrownthing/throwingdatum)
	switch(infusion_name)
		if("returning")
			var/mob/living/carbon/human/H = throwingdatum.thrower
			returnToOwner(source, H, 0, 1)

/datum/component/infusions/proc/returnToOwner(obj/item/source, mob/living/carbon/human/user, caught = 0)
	if(!istype(user))
		return
	source.forceMove(get_turf(user))

	var/msg = ""

	if(user.put_in_hands(parent))
		msg = "Your [source] returns to your hand!"
	else
		msg = "Your [source] returns to your location!"

	if(caught)
		if(source.loc == user)
			msg += " You catch your [source]!"
		else
			msg += " Your [source] lands at your feet!"

	if(msg)
		to_chat(user, span_notice("[msg]"))

/datum/component/infusions/proc/equipped(obj/item/source, mob/user, slot)
	var/mob/living/L = user
	switch(infusion_name)
		if("awareness")
			ADD_TRAIT(user, TRAIT_PERFECT_TRACKER, INFUSION_TRAIT)

		if("water breathing")
			ADD_TRAIT(user, TRAIT_WATERBREATHING, INFUSION_TRAIT)

		if("disguise")
			//spell

		if("intellect")
			L.change_stat("intelligence", 2)

		if("telepathy")
			user.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/encodethoughts5e)

		if("night")
			ADD_TRAIT(user, TRAIT_NIGHT_OWL, INFUSION_TRAIT)
			var/obj/item/organ/eyes/eyes = user.getorganslot(ORGAN_SLOT_EYES)
			eyes.see_in_dark = 8
			eyes.lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
			eyes.sight_flags = initial(eyes.sight_flags)
			eyes.sight_flags &= ~SEE_BLACKNESS
			eyes.owner.update_sight()

		if("propulsion")
			user.add_movespeed_modifier(MOVESPEED_ID_ADMIN_VAREDIT, update=TRUE, priority=100, multiplicative_slowdown=-1.5, movetypes=GROUND)
			//user.remove_movespeed_modifier(MOVESPEED_ID_ADMIN_VAREDIT, TRUE)

		if("magical strength")
			L.change_stat("strength", 1)
			ADD_TRAIT(user, TRAIT_PUSHIMMUNE, INFUSION_TRAIT)

		if("fire resistance")
			ADD_TRAIT(user, TRAIT_NOFIRE, INFUSION_TRAIT)

		if("mind sharpening")
			L.change_stat("intelligence", 2)

		if("protection")
			//spell

		if("archery")
			user.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
			user.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)

		if("thievery")
			user.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
			user.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)

		if("ogre power")
			L.change_stat("constitution", 1)
			L.change_stat("strength", 1)

		if("missile snaring")
			ADD_TRAIT(user, TRAIT_MISSILESNARING, INFUSION_TRAIT)

		if("swimming and climbing")
			user.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			user.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)

		if("the winding path")
			//spell

		if("striding and springing")
			ADD_TRAIT(user, TRAIT_LEAPER, INFUSION_TRAIT)

		if("the spider")
			ADD_TRAIT(user, TRAIT_WEBWALK, INFUSION_TRAIT)
			user.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)

		if("wings")
			//spell

		if("spell-refueling")
			//spell

		if("jumping")
			ADD_TRAIT(user, TRAIT_ZJUMP, INFUSION_TRAIT)

		if("mind shielding")
			ADD_TRAIT(user, TRAIT_NODETECT, INFUSION_TRAIT)

		if("free action")
			ADD_TRAIT(user, TRAIT_BOG_TREKKING, INFUSION_TRAIT)

		if("the ram")
			ADD_TRAIT(user, TRAIT_CHARGER, INFUSION_TRAIT)

		if("thoughts")
			user.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/encodethoughts5e)

		if("adaptation")
			ADD_TRAIT(user, TRAIT_NOSTINK, INFUSION_TRAIT)

		if("wound closure")
			user.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/eldritchhealing/any)

		if("health")
			L.change_stat("constitution", 2)

		if("arcyne focus")
			user.mind.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)

		if("the sewers")
			user.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
			user.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)

		if("climbing")
			user.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		
		if("giant strength")
			L.change_stat("strength", 2)

		if("levitation")
			//spell?

		if("the bat")
			user.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift/bat)

/datum/component/infusions/proc/dropped(obj/item/source, mob/user)
	var/mob/living/L = user
	switch(infusion_name)
		if("awareness")
			REMOVE_TRAIT(user, TRAIT_PERFECT_TRACKER, INFUSION_TRAIT)

		if("water breathing")
			REMOVE_TRAIT(user, TRAIT_WATERBREATHING, INFUSION_TRAIT)

		if("disguise")
			//spell

		if("intellect")
			L.change_stat("intelligence", -2)

		if("telepathy")
			user.mind.RemoveSpell(/obj/effect/proc_holder/spell/targeted/encodethoughts5e)

		if("night")
			REMOVE_TRAIT(user, TRAIT_NIGHT_OWL, INFUSION_TRAIT)
			var/obj/item/organ/eyes/eyes = user.getorganslot(ORGAN_SLOT_EYES)
			eyes.see_in_dark = 2
			eyes.lighting_alpha = LIGHTING_PLANE_ALPHA_VISIBLE
			eyes.sight_flags = 0
			eyes.owner.update_sight()

		if("propulsion")
			user.remove_movespeed_modifier(MOVESPEED_ID_ADMIN_VAREDIT, TRUE)

		if("magical strength")
			L.change_stat("strength", -1)
			REMOVE_TRAIT(user, TRAIT_PUSHIMMUNE, INFUSION_TRAIT)

		if("fire resistance")
			REMOVE_TRAIT(user, TRAIT_NOFIRE, INFUSION_TRAIT)

		if("mind sharpening")
			L.change_stat("intelligence", -2)

		if("protection")
			//spell

		if("archery")
			user.mind.adjust_skillrank(/datum/skill/combat/crossbows, -2, TRUE)
			user.mind.adjust_skillrank(/datum/skill/combat/bows, -2, TRUE)

		if("thievery")
			user.mind.adjust_skillrank(/datum/skill/misc/stealing, -2, TRUE)
			user.mind.adjust_skillrank(/datum/skill/misc/lockpicking, -2, TRUE)

		if("ogre power")
			L.change_stat("constitution", -1)
			L.change_stat("strength", -1)

		if("missile snaring")
			REMOVE_TRAIT(user, TRAIT_MISSILESNARING, INFUSION_TRAIT)

		if("swimming and climbing")
			user.mind.adjust_skillrank(/datum/skill/misc/swimming, -2, TRUE)
			user.mind.adjust_skillrank(/datum/skill/misc/climbing, -2, TRUE)

		if("the winding path")
			//spell

		if("striding and springing")
			REMOVE_TRAIT(user, TRAIT_LEAPER, INFUSION_TRAIT)

		if("the spider")
			REMOVE_TRAIT(user, TRAIT_WEBWALK, INFUSION_TRAIT)
			user.mind.adjust_skillrank(/datum/skill/misc/climbing, -2, TRUE)

		if("wings")
			//spell

		if("spell-refueling")
			//spell

		if("jumping")
			REMOVE_TRAIT(user, TRAIT_ZJUMP, INFUSION_TRAIT)

		if("mind shielding")
			REMOVE_TRAIT(user, TRAIT_NODETECT, INFUSION_TRAIT)

		if("free action")
			REMOVE_TRAIT(user, TRAIT_BOG_TREKKING, INFUSION_TRAIT)

		if("the ram")
			REMOVE_TRAIT(user, TRAIT_CHARGER, INFUSION_TRAIT)

		if("thoughts")
			user.mind.RemoveSpell(/obj/effect/proc_holder/spell/targeted/encodethoughts5e)

		if("adaptation")
			REMOVE_TRAIT(user, TRAIT_NOSTINK, INFUSION_TRAIT)

		if("wound closure")
			user.mind.RemoveSpell(/obj/effect/proc_holder/spell/invoked/eldritchhealing/any)

		if("health")
			L.change_stat("constitution", -2)

		if("arcyne focus")
			user.mind.adjust_skillrank(/datum/skill/magic/arcane, -1, TRUE)

		if("the sewers")
			user.mind.RemoveSpell(/obj/effect/proc_holder/spell/invoked/summon_rat)
			user.mind.RemoveSpell(/obj/effect/proc_holder/spell/targeted/roustame)

		if("climbing")
			user.mind.adjust_skillrank(/datum/skill/misc/climbing, -3, TRUE)
		
		if("giant strength")
			L.change_stat("strength", -2)

		if("levitation")
			//spell?

		if("the bat")
			user.mind.RemoveSpell(/obj/effect/proc_holder/spell/targeted/shapeshift/bat)

/datum/component/infusions/proc/add_infusion(obj/item/source, mob/infuser, obj/item/roguegem/gem_used, random)
	var/obj/item/I = source
	var/tier = 5
	
	if(gem_used)
		I.sellprice += gem_used.sellprice
		if (istype(gem_used, /obj/item/roguegem/yellow))
			tier = 1
		else if (istype(gem_used, /obj/item/roguegem/green))
			tier = 2
		else if (istype(gem_used, /obj/item/roguegem/violet))
			tier = 3
		else if (istype(gem_used, /obj/item/roguegem/blue))
			tier = 4
		else if (istype(gem_used, /obj/item/roguegem/diamond))
			tier = 5
	
	var/list/options = list()
	if(istype(I, /obj/item/clothing/head)) //head
		options.Add(helm_infusions)
	if(istype(I, /obj/item/clothing/mask)) //mask
		options.Add(mask_infusions)
	if(istype(I, /obj/item/clothing/suit/roguetown/armor)) //armor
		options.Add(armor_infusions)
	if(istype(I, /obj/item/clothing/suit/roguetown/shirt/robe)) //robes
		options.Add(robe_infusions)
	if(istype(I, /obj/item/clothing/cloak)) //cloak
		options.Add(cloak_infusions)
	if(istype(I, /obj/item/storage/belt/rogue)) //belt
		options.Add(belt_infusions)
	if(istype(I, /obj/item/clothing/wrists/roguetown)) //wrists
		options.Add(bracers_infusions)
	if(istype(I, /obj/item/clothing/gloves/roguetown)) //gloves
		options.Add(gloves_infusions)
	if(istype(I, /obj/item/clothing/shoes/roguetown)) //boots
		options.Add(boots_infusions)
	if(istype(I,/obj/item/clothing/ring)) //ring
		options.Add(ring_infusions)
	if(istype(I, /obj/item/clothing/neck/roguetown/psicross)) //amulet
		options.Add(amulet_infusions)
	if(istype(I, /obj/item/rogueweapon)) //weapon
		options.Add(weapon_infusions)
	if(istype(I, /obj/item/rogueweapon/woodstaff)) //staff
		options.Add(staff_infusions)
	if(istype(I, /obj/item/rogueweapon/shield)) //shield
		options.Add(shield_infusions)
	if(istype(I, /obj/item/rogue/instrument)) //instrument
		options.Add(instrument_infusions)
	if(istype(I, /obj/item/reagent_containers/glass/bottle)) //bottle
		options.Add(bottle_infusions)
	if(istype(I, /obj/item/storage/belt/rogue/pouch)) //bag
		options.Add(bag_infusions)
	if(istype(I, /obj/item/rope)) //rope
		options.Add(rope_infusions)
	if(istype(I, /obj/item/natural/stone)) //stone
		options.Add(stone_infusions)
	if(istype(I, /obj/item/flashlight/flare/torch)) //lantern
		options.Add(lantern_infusions)
	if(istype(I, /obj/item/organ/eyes)) //eyes
		options.Add(eyes_infusions)
	if(istype(I, /obj/item/roguegem)) //gem
		options.Add(gem_infusions)
	if(istype(I, /obj/item/signal_horn)) //horn
		options.Add(horn_infusions)

	if(options)
		if(options.len > 0)
			I.infusable = FALSE
			qdel(gem_used)
			if(random)
				infusion_name = pick(options)
			else
				infusion_name = input("Choose Infusion", "Available Infusions") as anything in options

			I.name = "[I.name] of [infusion_name]"
			check_change_item(I, infuser)
		else
			qdel(src)
			to_chat(infuser, span_warning("[I] can not be infused."))

//alchemy jug
/obj/item/reagent_containers/glass/bottle/alchemyjug
	name = "alchemy jug"
	desc = "An enchanted jug that fills itself with liquids."
	infusable = FALSE
	
//eyes of the eagle
/obj/item/organ/eyes/eagle
	name = "eyes of the eagle" //make these eyes give you +3 perception
	desc = ""
	infusable = FALSE

//eyes of charming
/obj/item/organ/eyes/charming
	name = "eyes of charming" //make these eyes give you charm person
	desc = ""
	infusable = FALSE

//bag of holding
/obj/item/storage/belt/rogue/pouch/holding
	name = "pouch of holding"
	desc = "Usually used for holding anything."
	infusable = FALSE

/obj/item/storage/belt/rogue/pouch/holding/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 84
		STR.max_w_class = WEIGHT_CLASS_GIGANTIC
		STR.max_items = 18

/obj/item/storage/belt/rogue/pouch/proc/self_insert(current_size = 10)
	var/dist = max((current_size - 2),1)
	explosion(src.loc,(dist),(dist*2),(dist*4))

/obj/item/signal_horn/blasting
	name = "horn of blasting"
	desc = "Used to sound the alarm and more."
	infusable = FALSE

/obj/item/natural/stone/sending
	name = "sending stone"
	desc = "One of a pair of sending stones."
	infusable = FALSE
	var/obj/item/natural/stone/sending/paired_with

/obj/item/natural/stone/sending/attack_self(mob/user)
	user.changeNext_move(CLICK_CD_MELEE)
	var/input_text = input(user, "Enter your message:", "Message")
	if(input_text)
		paired_with.say(input_text)
