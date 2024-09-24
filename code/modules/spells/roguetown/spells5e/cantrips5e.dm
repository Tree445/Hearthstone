/*
// Notes: 
/obj/effect/proc_holder/spell/invoked/REPLACEME
	name = "Replace Me"
	desc = ""
	clothes_req = FALSE
	range = 8
	//projectile_type = /obj/projectile/magic/aoe/fireball/rogue2
	overlay_state = "null"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE //just click it to activate?

	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	charge_max = 3 SECONDS //cooldown

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = FALSE //can you use it if you are antimagicked?
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = TRUE
	miracle = FALSE
// Notes: artificer, sorcerer, wizard

*/

//==============================================
//	ACID SPLASH
//==============================================
// Notes: You hurl a bubble of acid, a slow moving bubble projectile that deals light burn damage in an aoe
/obj/effect/proc_holder/spell/invoked/projectile/acidsplash5e
	name = "Acid Splash"
	desc = ""
	clothes_req = FALSE
	range = 8
	projectile_type = /obj/projectile/magic/aoe/fireball/acidsplash5e
	overlay_state = "fireball_multi"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE

	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	charge_max = 3 SECONDS //cooldown

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = FALSE //can you use it if you are antimagicked?
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = TRUE
	miracle = FALSE

	invocation = ""
	invocation_type = "shout" //can be none, whisper, emote and shout
// Notes: artificer, sorcerer, wizard
///obj/effect/proc_holder/spell/invoked/projectile/acidsplash5e/cast(mob/user = usr)
//	var/mob/living/target = user
//	target.visible_message("<span class='info'>[user] hurls a bubble of acid.</span>", "<span class='notice'>I hurl a bubble of acid.</span>")

/obj/projectile/magic/aoe/fireball/acidsplash5e
	name = "acid bubble"
	speed = 0.3
	exp_heavy = 0
	exp_light = 0
	exp_flash = 0
	exp_fire = -1
	damage = 10
	damage_type = BURN
	nodamage = FALSE
	flag = "magic"
	hitsound = 'sound/blank.ogg'
	aoe_range = 1

//==============================================
//	BLADE WARD
//==============================================
// Notes: You extend your hand and trace a sigil of warding in the air. 
/obj/effect/proc_holder/spell/self/bladeward5e
	name = "Blade Ward"
	desc = ""
	clothes_req = FALSE
	range = 8
	overlay_state = "null"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE

	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	charge_max = 60 SECONDS //cooldown

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = FALSE //can you use it if you are antimagicked?
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = TRUE
	miracle = FALSE

	invocation = ""
	invocation_type = "shout" //can be none, whisper, emote and shout
// Notes: Bard, Sorcerer, Warlock, Wizard

/obj/effect/proc_holder/spell/self/bladeward5e/cast(mob/user = usr)
	var/mob/living/target = user
	target.apply_status_effect(/datum/status_effect/buff/bladeward5e)
	ADD_TRAIT(target, TRAIT_BREADY, TRAIT_GENERIC)
	user.visible_message("<span class='info'>[user] traces a warding sigil in the air.</span>", "<span class='notice'>I trace a a sigil of warding in the air.</span>")

/datum/status_effect/buff/bladeward5e
	id = "blade ward"
	alert_type = /atom/movable/screen/alert/status_effect/buff/bladeward5e
	effectedstats = list("constitution" = 2)
	duration = 20 SECONDS

/atom/movable/screen/alert/status_effect/buff/bladeward5e
	name = "Blade Ward"
	desc = "I am resistant to damage."
	icon_state = "buff"

/datum/status_effect/buff/bladeward5e/on_remove()
	var/mob/living/target = owner
	REMOVE_TRAIT(target, TRAIT_BREADY, TRAIT_GENERIC)
	. = ..()

//==============================================
//	BOOMING BLADE
//==============================================
//skipped until I do weapon attack spells

//==============================================
//	CHILL TOUCH
//==============================================
// Notes: I have taken creative liberties because I don't want to fuck with people's ability to be healed.
// this now attaches a ghost hand to a targeted body part and does different things depending on the part
/obj/effect/proc_holder/spell/invoked/chilltouch5e
	name = "Chill Touch"
	overlay_state = "null"
	releasedrain = 50
	chargetime = 1
	charge_max = 1 SECONDS
	//chargetime = 10
	//charge_max = 30 SECONDS
	range = 6
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = TRUE
	miracle = FALSE

	invocation = ""
	invocation_type = "shout" //can be none, whisper, emote and shout

// Notes: sorcerer, warlock, wizard
/obj/effect/proc_holder/spell/invoked/chilltouch5e/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/obj/item/bodypart/bodypart = target.get_bodypart(user.zone_selected)
		if(!bodypart)
			return FALSE
		var/obj/item/chilltouch5e/hand = new(target)
		hand.host = target
		hand.bodypart = bodypart
		hand.forceMove(target)
		var/choice = alert(target, "A skeletal hand attempts to grapple your nether region!", "", "Accept it!", "Fight it!")
		bodypart.add_embedded_object(hand, silent = TRUE, crit_message = FALSE)
		switch(choice)
		//IF YOU CHOOSE Accept it! - YOU RECIEVE PLEASURE
			if("Accept it!")
				hand.pleasureaccepted = TRUE
			if("Fight it!")
				hand.pleasureaccepted = FALSE
		return TRUE
	return FALSE

/obj/item/chilltouch5e
	name = "Skeletal Hand"
	desc = "A ghostly, skeletal hand which moves on of it's own accord."
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "bounty"
	
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	throwforce = 0
	max_integrity = 10

	var/oxy_drain = 2
	var/pleasure = 1
	var/curprocs = 0
	var/procsmax = 50
	var/pleasureaccepted = FALSE
	var/mob/living/host //who are we stuck to?
	var/obj/item/bodypart/bodypart //where are we stuck to?

	embedding = list(
		"embedded_unsafe_removal_time" = 20,
		"embedded_pain_chance" = 0,
		"embedded_pain_multiplier" = 0,
		"embed_chance" = 100,
		"embedded_fall_chance" = 0)
	item_flags = DROPDEL
	destroy_sound = 'sound/magic/vlightning.ogg'

/obj/item/chilltouch5e/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/chilltouch5e/on_embed(obj/item/bodypart/bodypart)
	to_chat(bodypart.owner, "<span class='warning'>hand attached to [bodypart.owner]'s [bodypart]!</span>")
	if(bodypart.owner)
		host = bodypart.owner
		START_PROCESSING(SSobj, src)

/obj/item/chilltouch5e/process()
	var/hand_proc = pick(1,2,3,4,5)
	var/mult = pick(1,2)
	var/mob/living/target = host
	if(!is_embedded)
		host = null
		return PROCESS_KILL
	if(curprocs >= procsmax)
		host = null
		return PROCESS_KILL
	if(!host)
		qdel(src)
		return FALSE
	curprocs++
	if(hand_proc == 1)
		switch(bodypart.name)
			if(BODY_ZONE_HEAD) //choke
				to_chat(host, "<span class='warning'>[host] chokes!</span>")
				playsound(get_turf(host), pick('sound/combat/shove.ogg'), 100, FALSE, -1)
				playsound(get_turf(host), pick('sound/vo/throat.ogg','sound/vo/throat2.ogg','sound/vo/throat3.ogg'), 100, FALSE, -1)

				target.adjustOxyLoss(oxy_drain*mult*2)
			if(BODY_ZONE_CHEST) //pleasure if erp, hurt if not
				//if erp allowed & said yes to prompt pleasure them & combat mode OFF
				if(target.client.prefs.sexable == TRUE && pleasureaccepted)
					to_chat(host, "<span class='warning'>[host] feels otherworld pleasure!</span>")
					playsound(get_turf(host), pick('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 100, FALSE, -1)
					target.sexcon.perform_sex_action(host, pleasure*mult*3, 0, TRUE)
				else //damage
					to_chat(host, "<span class='warning'>[host] is pummeled!</span>")
					playsound(get_turf(host), pick('sound/combat/hits/punch/punch_hard (1).ogg','sound/combat/hits/punch/punch_hard (2).ogg','sound/combat/hits/punch/punch_hard (3).ogg'), 100, FALSE, -1)
					target.adjustBruteLoss(oxy_drain*mult*3)
			else
				to_chat(host, "<span class='warning'>[host]'s [bodypart] is twisted!</span>")
				playsound(get_turf(host), pick('sound/combat/hits/punch/punch (1).ogg','sound/combat/hits/punch/punch (2).ogg','sound/combat/hits/punch/punch (3).ogg'), 100, FALSE, -1)
				target.apply_damage(oxy_drain*mult*3, BRUTE, bodypart)
				bodypart.update_disabled()
	return FALSE

/*
Acid Splash	Conjuration	1 Action	60 Feet	Instantaneous	V, S
Blade Ward	Abjuration	1 Action	Self	1 round	V, S
Booming Blade	Evocation	1 Action	Self (5-foot radius)	1 round	S, M
Chill Touch	Necromancy	1 Action	120 feet	1 round	V, S
Control Flames	Transmutation	1 Action	60 Feet	Instantaneous or 1 hour	S
Create Bonfire	Conjuration	1 Action	60 Feet	Concentration, up to 1 minute	V, S
Dancing Lights	Evocation	1 Action	120 feet	Concentration up to 1 minute	V, S, M
Decompose (HB)	Necromancy	1 Action	Touch	1 minute	V, S
Druidcraft	Transmutation	1 Action	30 Feet	Instantaneous	V, S
Eldritch Blast	Evocation	1 Action	120 Feet	Instantaneous	V, S
Encode Thoughts	Enchantment	1 Action	Self	8 hours	S
Fire Bolt	Evocation	1 Action	120 feet	Instantaneous	V, S
Friends	Enchantment	1 Action	Self	Concentration, up to 1 minute	S, M
Frostbite	Evocation	1 Action	60 feet	Instantaneous	V, S
Green-Flame Blade	Evocation	1 Action	Self (5-foot radius)	Instantaneous	S, M
Guidance	Divination	1 Action	Touch	Concentration up to 1 minute	V, S
Gust	Transmutation	1 Action	30 feet	Instantaneous	V, S
Hand of Radiance (UA)	Evocation	1 Action	5 feet	Instantaneous	V, S
Infestation	Conjuration	1 Action	30 feet	Instantaneous	V, S, M
Light	Evocation	1 Action	Touch	1 hour	V, M
Lightning Lure	Evocation	1 Action	Self (15-foot radius)	Instantaneous	V
Mage Hand	Conjuration	1 Action	30 feet	1 minute	V, S
Magic Stone	Transmutation	1 Bonus Action	Touch	1 minute	V, S
Mending	Transmutation	1 Minute	Touch	Instantaneous	V, S, M
Message	Transmutation	1 Action	120 feet	1 round	V, S, M
Mind Sliver	Enchantment	1 Action	60 feet	1 round	V
Minor Illusion	Illusion	1 Action	30 feet	1 minute	S, M
Mold Earth	Transmutation	1 Action	30 feet	Instantaneous or 1 hour	S
On/Off (UA)	Transmutation T	1 Action	60 feet	Instantaneous	V, S
Poison Spray	Conjuration	1 Action	10 feet	Instantaneous	V, S
Prestidigitation	Transmutation	1 Action	10 feet	Up to 1 hour	V, S
Primal Savagery	Transmutation	1 Action	Self	Self	S
Produce Flame	Conjuration	1 Action	Self	10 minutes	V, S
Ray of Frost	Evocation	1 Action	60 feet	Instantaneous	V, S
Resistance	Abjuration	1 Action	Touch	Concentration up to 1 minute	V, S, M
Sacred Flame	Evocation	1 Action	60 feet	Instantaneous	V, S
Sapping Sting	Necromancy D	1 Action	30 feet	Instantaneous	V, S
Shape Water	Transmutation	1 Action	30 feet	Instantaneous or 1 hour	S
Shillelagh	Transmutation	1 Bonus Action	Touch	1 minute	V, S, M
Shocking Grasp	Evocation	1 Action	Touch	Instantaneous	V, S
Spare the Dying	Necromancy	1 Action	Touch	Instantaneous	V, S
Sword Burst	Conjuration	1 Action	Self (5-foot radius)	Instantaneous	V
Thaumaturgy	Transmutation	1 Action	30 feet	Up to 1 minute	V
Thorn Whip	Transmutation	1 Action	30 feet	Instantaneous	V, S, M
Thunderclap	Evocation	1 Action	Self (5-foot radius)	Instantaneous	S
Toll the Dead	Necromancy	1 Action	60 feet	Instantaneous	V, S
True Strike	Divination	1 Action	30 feet	Concentration up to 1 round	S
Vicious Mockery	Enchantment	1 Action	60 feet	Instantaneous	V
Virtue (UA)	Abjuration	1 Action	Touch	1 round	V, S
Word of Radiance	Evocation	1 Action	5 feet	Instantaneous	V, M
*/
