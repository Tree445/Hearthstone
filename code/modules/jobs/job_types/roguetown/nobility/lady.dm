/datum/job/roguetown/lady
	title = "Duke Courtier"
	f_title = "Duchess Courtier"
	flag = LADY
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = "With the help of foreign matchmakers, you have been paired with the Ruler of Rockhill as a potential candidate to take the side of the Ruler. It is your duty to gain the favor of the King/Queen to unite your kingdoms."

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/servant,
	/obj/effect/proc_holder/spell/self/grant_nobility,
	/obj/effect/proc_holder/spell/self/convertrole/mercenary)
	

	display_order = JDO_LADY
	give_bank_account = TRUE
	min_pq = 1
	max_pq = null
	advclass_cat_rolls = list(CTAG_LADY = 20)
	
	
/datum/job/roguetown/lady/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(ishuman(H))
		var/mob/living/carbon/human/Q = H
		Q.advsetup = 1
		Q.invisibility = INVISIBILITY_MAXIMUM
		Q.become_blind("advsetup")
		
/datum/advclass/lady/war  //Warrior-esque, for people who want to play a queen that's a bit more heavy-handed
	name = "War"
	tutorial = "You came from a land filled with war. Where other potential rulers, lords, and ladies saw to hone their skills in the art of court, you focused on tactics and swordplay. Only a fierce and strong ruler can rule properly."
	outfit = /datum/outfit/job/roguetown/lady/war
	category_tags = list(CTAG_LADY)
	
/datum/outfit/job/roguetown/lady/war/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	armor = /obj/item/clothing/suit/roguetown/armor/armordress
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltl = /obj/item/rogueweapon/sword
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	backr = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/clothing/ring/silver
	backpack_contents = list(/obj/item/storage/keyring/royal)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("constitution", 3)
		H.change_stat("endurance", 3)
		H.change_stat("strength", 1)
		H.change_stat("perception", 3)
		H.change_stat("fortune", 5)
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)  //THOUGHT about giving them heavy but.. medium should be fine, keep them from front-lining too bad, but also allowing them to participate in fights.
		
/datum/advclass/lady/intrigue
	name = "Intrigue"
	tutorial = "Since you were young, you were gifted with a silver tongue and a ear that is always listening. You spent your life learning the trade that is secrets, any loose lip and overheard conversation can be put to good use in a court. Only a wise and observant ruler can rule properly."
	outfit = /datum/outfit/job/roguetown/lady/intrigue
	category_tags = list(CTAG_LADY)
	
/datum/outfit/job/roguetown/lady/intrigue/pre_equip(mob/living/carbon/human/H)  //Hand-esque, spymaster archetype for those who prefer being a sneaky candidate whispering into their king/queens ear
	..()
	pants = /obj/item/clothing/under/roguetown/tights/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/hand
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather/hand
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	backl = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/clothing/ring/silver
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/storage/keyring/royal = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
		H.change_stat("intelligence", 3)
		H.change_stat("endurance", 3)
		H.change_stat("speed", 2)
		H.change_stat("perception", 2)
		H.change_stat("fortune", 3) //Slightly less fortune because they have Dodge Expert
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC) //good at reading people? Doesn't do TOO much really, just for flavor

/datum/advclass/lady/courtliness  //Steward-esque, fame, fortune, money, events, if money can buy it, they love it.
	name = "Courtliness"
	tutorial = "Appearances are everything, a fact that you know vehemently. No good lord or lady should have anything but the upmost decorum, and you will be there to ensure that that standard is held to its highest. Only a proper and courtly ruler can properly rule"
	outfit = /datum/outfit/job/roguetown/lady/courtliness
	category_tags = list(CTAG_LADY)
	
/datum/outfit/job/roguetown/lady/courtliness/pre_equip(mob/living/carbon/human/H)
	..()
	beltl = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	neck = /obj/item/clothing/neck/roguetown/psicross/ornate
	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress
	head = /obj/item/clothing/head/roguetown/nyle
	pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random	//Added Silk Stockings for the female nobles
	id = /obj/item/clothing/ring/gold
	cloak = /obj/item/clothing/cloak/lordcloak
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogue/instrument/lute
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/storage/keyring/royal = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3 , TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/music, rand(3,5), TRUE)
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
		
/obj/effect/proc_holder/spell/self/convertrole/servant
	name = "Recruit Servant"
	new_role = "Servant"
	overlay_state = "recruit_servant"
	recruitment_faction = "Servants"
	recruitment_message = "Serve the crown, %RECRUIT!"
	accept_message = "FOR THE CROWN!"
	refuse_message = "I refuse."
	charge_max = 100

/obj/effect/proc_holder/spell/self/convertrole/mercenary
	name = "Recruit Mercenary"
	new_role = "Mercenary"
	overlay_state = "recruit_guard"
	recruitment_faction = "MERCENARIES"
	recruitment_message = "Serve the Guild, %RECRUIT!"
	accept_message = "FOR THE GUILD!"
	refuse_message = "I refuse."
	charge_max = 100
