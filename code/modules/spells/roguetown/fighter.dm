// Fighter spells/abilities
// A bard's bread and butter. Maybe jester too?
/obj/effect/proc_holder/spell/self/secondwind
	name = "Second Wind"
	desc = ""
	clothes_req = FALSE
	range = 8
	overlay_state = "null"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE

	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	charge_max = 600 SECONDS //cooldown

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = FALSE //can you use it if you are antimagicked?
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = ""
	invocation_type = "shout" //can be none, whisper, emote and shout

/obj/effect/proc_holder/spell/self/secondwind/cast(mob/user = usr)
	var/mob/living/target = user
	var/mob/living/carbon/M = target
	M.rogfat_add(-100)
	M.rogstam_add(-100)
	user.visible_message("<span class='info'>[user] takes a deep breath in.</span>", "<span class='notice'>I take a deep breath in regaining my stamina.</span>")
