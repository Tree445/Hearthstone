//HIDDENDOOR
/obj/structure/mineral_door/secret
	name = "wall"
	desc = ""
	icon_state = "woodhandle" //change me
	openSound = 'sound/foley/doors/creak.ogg'
	closeSound = 'sound/foley/doors/shut.ogg'
	sheetType = null
	resistance_flags = FLAMMABLE
	max_integrity = 9999
	damage_deflection = 30
	layer = ABOVE_MOB_LAYER
	keylock = FALSE
	locked = TRUE
	icon = 'icons/roguetown/misc/doors.dmi'
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	flags_1 = HEAR_1

	can_add_lock = FALSE
	
	var/over_state = "woodover"

	var/speaking_distance = 2
	var/open_phrase = "open sesame"
	var/close_phrase = "close sesame"
	var/lang = /datum/language/common
	var/list/vip
	var/vipmessage
	var/defenses = FALSE

/obj/structure/mineral_door/secret/vault
	vip = list("King", "Queen", "Steward", "Hand")
	vipmessage = "King, Queen, Steward and Hand"

/obj/structure/mineral_door/secret/keep
	vip = list("King", "Queen", "Royal Heir", "Hand")
	vipmessage = "King, Queen, Royal Heir and Hand"

/obj/structure/mineral_door/secret/merchant
	vip = list("Merchant", "Shop Hand")
	vipmessage = "Merchant and Shop Hand"

/obj/structure/mineral_door/secret/wizard //for wizard tower
	vip = list("Court Magician", "Magicians Apprentice", "Archivist")
	vipmessage = "Court Magician, Magicians Apprentice and Archivist"
	//make me look like an arcane door
	//icon = 'icons/turf/walls/stonebrick.dmi'
	//icon_state = "stonebrick" //change me

/obj/structure/mineral_door/secret/rogue //for seedy sewer bar / black market?
	vip = list("Vagabond", "Thug", "Rogue", "Nightmaster", "Nightmistress", "Beggar")
	vipmessage = "Vagabond, Thug, Rogue, Nightmaster, Nightmistress and Beggar"
	lang = /datum/language/thievescant
	icon = 'icons/turf/walls/stonebrick.dmi'
	icon_state = "stonebrick"

/obj/structure/mineral_door/secret/Initialize()
	//set password
	open_phrase = open_word() + " " + magic_word()
	close_phrase = close_word() + " " + magic_word()
	. = ..()

/obj/structure/mineral_door/secret/Hear(message, atom/movable/speaker, message_language, raw_message, radio_freq, list/spans, message_mode, original_message)
	var/mob/living/carbon/human/H = speaker
	if(speaker == src) //door speaking to itself
		return
	var/distance = get_dist(speaker, src)
	if(distance > speaking_distance)
		return
	if(obj_broken) //door is broken
		return
	if(!ishuman(speaker))
		return
	
	var/message2recognize = sanitize_hear_message(original_message)
	var/isvip = FALSE
	if (vip.Find(H.job) || vip.Find(H.get_role_title()))
		isvip = TRUE

	if(findtext(message2recognize, "help"))
		say("My commands are: 'help', 'say phrases', 'set open', 'set close', 'set language', 'set defenses'. My masters are: [vipmessage]", )

	if(findtext(message2recognize, "say phrases"))
		if(isvip)
			say("Open: '[open_phrase]', Close: '[close_phrase]'.", language = lang)
		else
			say("I don't know you, "+flavor_name()+".", language = lang)
			triggerdefenses(H, defenses)

	if(findtext(message2recognize, open_phrase))
		if(locked)
			locked = FALSE
			force_open()
			say("The way is now open, "+flavor_name()+".", language = lang)

	if(findtext(message2recognize, close_phrase))
		if(!locked)
			force_closed()
			locked = TRUE
			say("The way is now closed, "+flavor_name()+".", language = lang)

	if(findtext(message2recognize, "set open"))
		if(isvip || !locked)
			var/new_pass = stripped_input(H, "What should the new open phrase be?")
			open_phrase = new_pass
			say("Open phrase has been set, "+flavor_name()+".", language = lang)
		else
			say("I don't know you, "+flavor_name()+".", language = lang)
			triggerdefenses(H, defenses)
		

	if(findtext(message2recognize, "set close"))
		if(isvip || !locked)
			var/new_pass = stripped_input(H, "What should the new close phrase be?")
			close_phrase = new_pass
			say("Close phrase has been set, "+flavor_name()+".", language = lang)
		else
			say("I don't know you, "+flavor_name()+".", language = lang)
			triggerdefenses(H, defenses)
	
	if(findtext(message2recognize, "set language"))
		if(isvip || !locked)
			var/list/langresult = list()
			for(var/ld in GLOB.all_languages)
				if (H.mind.language_holder.has_language(ld))
					langresult.Add(ld)
			if(langresult)
				var/datum/language/language_choice = input("Choose the new language", "Available languagess") as anything in langresult
				lang = language_choice
		else
			say("I don't know you, "+flavor_name()+".", language = lang)
			triggerdefenses(H, defenses)

	if(findtext(message2recognize, "set defenses"))
		if(isvip || !locked)
			defenses = !defenses
			if(defenses)
				say("Arcyne defenses activated, "+flavor_name()+".", language = lang)
			else
				say("Arcyne defenses deactivated, "+flavor_name()+".", language = lang)
		else
			say("I don't know you, "+flavor_name()+".", language = lang)
			triggerdefenses(H, defenses)

proc/triggerdefenses(var/mob/living/carbon/human/H, var/D)
	if (D)
		if (H)
		/*
			LATER MAKE IT LIGHTNING LURE 
			var/range = 3 SECONDS
			var/delay = 3 SECONDS
			var/sprite_changes = 10
			var/datum/beam/current_beam = null
			playsound(src, 'sound/items/stunmace_gen (2).ogg', 100)

			var/x 
			for(x=1; x < sprite_changes; x++)
				current_beam = new(src, H, time=30/sprite_changes, beam_icon_state="lightning[rand(1,12)]", btype=/obj/effect/ebeam, maxdistance=10)
				INVOKE_ASYNC(current_beam, TYPE_PROC_REF(/datum/beam, Start))
				sleep(delay/sprite_changes)

			var/dist = get_dist(src, H)
			if (dist <= range)
				H.electrocute_act(1, src) //just shock	
			else
				playsound(src, 'sound/items/stunmace_toggle (3).ogg', 100)
		*/
			H.electrocute_act(30, src) //just shock	
			playsound(src, 'sound/items/stunmace_toggle (3).ogg', 100)

proc/open_word()
	var/list/open_word = list(
		"open", 
		"pass", 
		"part", 
		"break", 
		"reveal", 
		"unbar", 
		"gape", 
		"extend", 
		"widen", 
		"unfold", 
		"rise"
		)
	return pick(open_word)

proc/close_word()
	var/list/close_word = list(
		"close", 
		"seal", 
		"still", 
		"fade", 
		"retreat", 
		"consume", 
		"envelope", 
		"hide", 
		"halt", 
		"cease", 
		"vanish", 
		"end" 
		)
	return pick(close_word)

proc/magic_word()
	var/list/magic_word = list(
		"sesame", 
		"abyss", 
		"fire", 
		"wind", 
		"earth", 
		"shadow", 
		"night", 
		"oblivion", 
		"void", 
		"time", 
		"dead", 
		"decay", 
		"gods", 
		"ancient", 
		"twisted", 
		"corrupt", 
		"secrets", 
		"lore", 
		"text", 
		"ritual", 
		"sacrifice", 
		"deal", 
		"pact", 
		"bargain", 
		"ritual", 
		"dream", 
		"nightmare", 
		"vision", 
		"hunger", 
		"lust", 
		"necra", 
		"noc", 
		"psydon", 
		"zizo"
		)
	return pick(magic_word)

proc/flavor_name()
	var/list/flavor_name = list(
		"my friend", 
		"love", 
		"my love", 
		"honey", 
		"darling", 
		"stranger", 
		"habibi", 
		"companion", 
		"mate", 
		"you harlot", 
		"comrade", 
		"fellow", 
		"chum", 
		"bafoon"
		)
	return pick(flavor_name)
