
GLOBAL_DATUM_INIT(hunted_indicator, /mutable_appearance, mutable_appearance('modular_hearthstone/icons/mob/indicator.dmi', "hunted", FLY_LAYER))

/mob/living/carbon/human
	var/list/hunting = list() //list of enemies, can kos? once?
	var/list/hunters = list() //hunted by player, can kos? once?


/mob/living/carbon/human/proc/mark_target()
	set name = "Mark Target"
	set category = "Emotes"

	var/mob/living/carbon/human/H = src

	if(length(H.mind.known_people))
		var/already_enemy = FALSE
		var/enemy_name = input("Who should I mark for death?", "Known people") as anything in H.mind.known_people
		var/mob/living/carbon/human/enemy

		for(var/mob/living/carbon/human/HL in GLOB.human_list)
			if(HL.real_name == enemy_name)
				enemy = HL

		if(enemy)
			if(length(H.hunting)) 
				if(H.hunting.Find(enemy))
					already_enemy = TRUE
			
			if(!already_enemy)
				H.hunting.Add(enemy)
				enemy.hunters.Add(H)		
				H.visible_message(span_danger("[H] has a malicious look!"), span_danger("I get ready to attack."))
				to_chat(enemy, span_danger("You sense malicious intent."))
				enemy.add_overlay(GLOB.hunted_indicator)
				sleep(3 SECONDS)
				to_chat(enemy, span_danger("FIGHT, FLEA OR YIELD!."))
				H.visible_message(span_danger("[H] is ready to fight!"), span_danger("The fight is on!"))
				H.emote("warcry", intentional = TRUE)
				sleep(6 SECONDS)
				enemy.cut_overlay(GLOB.hunted_indicator)
			else //if you target the same person again, remove them from your enemies list
				H.hunting.Remove(enemy)
				enemy.hunters.Remove(H)
				to_chat(enemy, span_danger("An air of mercy puts you at ease."))
				enemy.emote("sigh", intentional = TRUE)
				H.visible_message(span_danger("[H] has a forgiving look."), span_info("I forgive [enemy]."))
				H.emote("sigh", intentional = TRUE)

		else
			to_chat(H, span_info("[enemy_name] escapes my memoryy."))
	else
		to_chat(H, span_warning("I don't know anyone."))
