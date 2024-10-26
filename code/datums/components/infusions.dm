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

	///////////TIERS
	in the list next to the name of the infusion there is a number. This number is the TIER of the infusion. higher level gems are required for higher level infusions.

	tier 1, toper : adds flavor
	tier 2, gemerald : minor effect (skill increases and okay traits)
	tier 3, saffira : normal effect or (okay spells, stat increases and good traits)
	tier 4, blortz : major effect (good spells and amazing traits)
	tier 5, dorpel or rontz or riddle of steel : potentially game changing effect

	Hope that has been helpful in using this datum.
	~Ham-Hole
	*/



	var/infusion_name = "" //item turns into "[item] of [infusion_name]"

	var/helm_infusions = list(
		"awareness" = 2, //give perfect tracking
		"water breathing" = 2, //give waterbreathing
		//"disguise", //give disguise self
		"intellect" = 3, //+2 intelligence
		"telepathy" = 3, //give encode thoughts
		"defense" = 3, //set to decent defense stats
		)

	var/mask_infusions = list(
		"night" = 3, //give night vision
		"defense" = 3, //set to decent defense stats
		)

	var/armor_infusions = list(
		"propulsion" = 5, //increase walking speed
		"magical strength" = 3, //cant be pushed +1 strength?
		//"tools", //activate to get a hammer, pickaxe, axe, lockpick REMEMBER ME!!!!
		"fire resistance" = 4, //no fire trait
		)

	var/robe_infusions = list(
		"mind sharpening" = 3, //+2 int
		)
	var/cloak_infusions = list(
		//"protection", //mage armor
		"the bat" = 4, //bat polymorph
		)
	var/belt_infusions = list(
		"giant strength" = 3, //+2 strength
		)
	var/bracers_infusions = list(
		"archery" = 2, //+2 bows +2 crossbows
		)
	var/gloves_infusions = list(
		"thievery" = 2, //+2 lockpick +2 stealing
		"ogre power" = 3, //+1 con +1 str
		"missile snaring" = 3, //can dodge projectiles (check for dodge)
		"swimming and climbing" = 2, //+2 swimming +2 climbing
		)
	var/boots_infusions = list(
		//"the winding path", //teleport 3 squares
		"striding and springing" = 4, //leaper
		"the spider" = 3, //web walk and +2 climbing
		//"wings", //fly spell
		//"levitation", //uh? something else? I guess?
		)

	var/ring_infusions = list(
		//"spell-refueling", //refresh all spells (long cooldown)
		"jumping" = 4, //z-jump
		"mind shielding" = 4, //cant be scryed on (where the fuck is this ability)
		//"protection", //mage armor
		"free action" = 2, //bog trekking (basically what it does, dumb name)
		"the ram" = 4, //charger trait, better charges
		)

	var/amulet_infusions = list(
		"thoughts" = 2, //encode thoughs
		"adaptation" = 2, //no stink
		"wound closure" = 4, //lesser miracle that effects both faithless and faithful
		"health" = 3, //+2 con
		)

	var/weapon_infusions = list(
		"radiance" = 1, 
		"returning" = 2, 
		)
	var/staff_infusions = list(
		"arcyne focus" = 3, 
		)

	var/shield_infusions = list(
		"repulsion" = 3, 
		)
	
	var/instrument_infusions = list(
		"haunting" = 1, 
		"the sewers" = 1, //gain summon rous spell XX
		)

	var/bottle_infusions = list(
		"alchemy" = 1, 
		)
	var/bag_infusions = list(
		"holding" = 1, 
		)
	var/rope_infusions = list(
		"climbing" = 2,
		)
	var/stone_infusions = list(
		"sending" = 1, //create paired stones, activate one to send a message to the other 
		)
	var/lantern_infusions = list(
		"revealing" = 1, //double light 
		)
	var/eyes_infusions = list(
		"charming" = 4, //gain charm person spell (they are not able to attack you or something) 
		"the eagle" = 3, //+3 perception 
		)
	var/gem_infusions = list(
		"scrying" = 5, //scrying orb X
		)
	var/horn_infusions = list(
		"blasting" = 2, //funny horn X
		)

	var/active_item = FALSE

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
	if(!active_item)
		var/mob/living/L = user
		active_item = TRUE
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
				user.add_movespeed_modifier(MOVESPEED_ID_ADMIN_VAREDIT, update=TRUE, priority=100, multiplicative_slowdown=-1.15, movetypes=GROUND)
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
	if(active_item)
		var/mob/living/L = user
		active_item = FALSE
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

/obj/item
	var/tier_level = 0

/datum/component/infusions/proc/add_infusion(obj/item/source, mob/infuser, obj/item/roguegem/gem_used, random)
	var/obj/item/I = source
	var/tier = 5
	
	if(gem_used)
		I.sellprice += gem_used.sellprice
		//rontz is just gonna be as good as diamon or riddle of steel...
		if (istype(gem_used, /obj/item/roguegem/yellow))
			tier = 1
		else if (istype(gem_used, /obj/item/roguegem/green))
			tier = 2
		else if (istype(gem_used, /obj/item/roguegem/violet))
			tier = 3
		else if (istype(gem_used, /obj/item/roguegem/blue))
			tier = 4
		I.tier_level = tier

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
	var/fill_per_minute = 15
	var/reagent = /datum/reagent/water
	var/wait = 0
	
/obj/item/reagent_containers/glass/bottle/alchemyjug/Initialize()
	START_PROCESSING(SSobj, src)
	. = ..()

/obj/item/reagent_containers/glass/bottle/alchemyjug/process()
	wait++
	if(wait >= 30) //SSobj processes once ever 2 seconds so after a minute
		wait = 0 //reset timer
		if(src.reagents.holder_full())
			return
		playsound(src, 'sound/foley/drawwater.ogg', 100, FALSE)
		var/list/L = list()
		L[reagent] = fill_per_minute
		src.reagents.add_reagent_list(L)
/obj/item/reagent_containers/glass/bottle/alchemyjug/attack_self(mob/user)
	var/list/options = list(
		/datum/reagent/water, //fresh water
		/datum/reagent/water/gross, //salt water: analog for saltwater
		/datum/reagent/consumable/ethanol/beer, //beer
		/datum/reagent/consumable/ethanol/beer/wine, //wine
		/datum/reagent/consumable/ethanol/beer/cider, //cider: original addition
		/datum/reagent/consumable/honey, //honey
		/datum/reagent/consumable/lemonade, //lemonade: 
		/datum/reagent/consumable/mayonnaise, // mayonaise (maybe change to just egg yolk)
		/datum/reagent/fuel/oil, //oil
		/datum/reagent/berrypoison, //basic poison
		/datum/reagent/toxin/acid/fluacid //acid
		)
	var/reagent_change = input("Choose Contents", "Available Liquids") as anything in options
	reagent = reagent_change
	wait = 15
	reagents.total_volume = 0
	switch(reagent_change)
		if(/datum/reagent/water)
			fill_per_minute = 30
		if(/datum/reagent/water/gross)
			fill_per_minute = 45
		if(/datum/reagent/consumable/ethanol/beer)
			fill_per_minute = 15
		if(/datum/reagent/consumable/ethanol/beer/wine)
			fill_per_minute = 7.5
		if(/datum/reagent/consumable/ethanol/beer/cider)
			fill_per_minute = 7.5
		if(/datum/reagent/consumable/honey)
			fill_per_minute = 3.25
		if(/datum/reagent/consumable/lemonade)
			fill_per_minute = 15
		if(/datum/reagent/consumable/mayonnaise)
			fill_per_minute = 7.5
		if(/datum/reagent/fuel/oil)
			fill_per_minute = 3.25
		if(/datum/reagent/berrypoison)
			fill_per_minute = 3.25
		if(/datum/reagent/toxin/acid/fluacid)
			fill_per_minute = 1
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
	var/range = 8

/obj/item/signal_horn/blasting/sound_horn(mob/living/user)
	if(prob(20)) //20% chance to explode
		explosion(src, 0, 0, 3, 1)
		qdel(src)
	else
		var/list/cone_turfs = get_cone_turfs(get_turf(user), user.dir, range)
		for(var/list/turf_list in cone_turfs)
			do_cone_effects(turf_list, user, range)
	. = ..()

/obj/item/signal_horn/blasting/proc/do_cone_effects(list/target_turf_list, atom/caster, level = 1)
	var/list/things_to_throw = list()
	for(var/turf/affected_tile in target_turf_list)
		affected_tile.Shake_turf(duration = 0.5 SECONDS)
		for(var/atom/movable/affected as anything in affected_tile)
			if(!ishuman(affected) && !istype(affected, /obj/item))
				affected.Shake(duration = 0.5 SECONDS)
				continue
			if(ishuman(affected))
				var/mob/living/carbon/human/H = affected
				H.apply_status_effect(/datum/status_effect/buff/horn_deaf)
				if(H.stat == DEAD)
					continue
				H.apply_effects(2 SECONDS, 2 SECONDS)
				shake_camera(H, 2, 1)
			things_to_throw += affected

	for(var/atom/movable/affected as anything in things_to_throw)
		var/throwlocation = affected.loc
		for(var/x in 1 to 6)
			throwlocation = get_step(throwlocation, caster.dir)
		affected.throw_at(throwlocation, 3, 1, caster, TRUE)

/datum/status_effect/buff/horn_deaf
	id = "deafened"
	alert_type = /atom/movable/screen/alert/status_effect/buff/horn_deaf
	duration = 30 SECONDS

/atom/movable/screen/alert/status_effect/buff/horn_deaf
	name = "Deafened"
	desc = "I can't hear."
	icon_state = "debuff"

/datum/status_effect/buff/horn_deaf/on_apply()
	. = ..()
	var/mob/living/target = owner
	ADD_TRAIT(target, TRAIT_DEAF, TRAIT_GENERIC)

/datum/status_effect/buff/horn_deaf/on_remove()
	var/mob/living/target = owner
	REMOVE_TRAIT(target, TRAIT_DEAF, TRAIT_GENERIC)
	. = ..()

/obj/item/natural/stone/sending
	name = "sending stone"
	desc = "One of a pair of sending stones."
	infusable = FALSE
	var/obj/item/natural/stone/sending/paired_with

/obj/item/natural/stone/sending/attack_self(mob/user)
	var/input_text = input(user, "Enter your message:", "Message")
	if(input_text)
		paired_with.say(input_text)
