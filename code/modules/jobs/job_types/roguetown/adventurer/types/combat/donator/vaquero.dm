
/datum/advclass/vaquero
	name = "Vaquero"
	tutorial = "Vaquero are tiefling swashbucklers who have their origins as skilled horse-tamers of and pistoliers. It's hard to find horses these days..."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(/datum/species/tieberian)
	outfit = /datum/outfit/job/roguetown/adventurer/vaquero
	horse = /mob/living/simple_animal/hostile/retaliate/rogue/saigabuck/tame/saddled
	cmode_music = 'sound/music/combat_vaquero.ogg'
	category_tags = list(CTAG_ADVENTURER)

/datum/advclass/vaquero/equipme(mob/living/carbon/human/H)
	if(H.gender == FEMALE)
		horse = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/tame/saddled
	return ..()

/datum/outfit/job/roguetown/adventurer/vaquero/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/tanning, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/music, rand(1,2), TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)//because gun uses crossbow and we gave em' the license to shoot.
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 3, TRUE)//It's the age of fun and gun baybee.
	head = /obj/item/clothing/head/roguetown/bardhat
	shoes = /obj/item/clothing/shoes/roguetown/boots
	pants = /obj/item/clothing/under/roguetown/tights/random
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/ammopouch/bullets
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	cloak = /obj/item/clothing/cloak/half/red
	if(prob(33))
		cloak = /obj/item/clothing/cloak/half
	if(prob(33))
		cloak = /obj/item/clothing/cloak/half/orange
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/sword/rapier
	backr = /obj/item/rogue/instrument/guitar
	backpack_contents = list(/obj/item/gun/ballistic/arquebus_pistol = 1, /obj/item/gun/ballistic/arquebus_pistol = 1, /obj/item/powderflask = 1)
	H.change_stat("intelligence", 2)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 2)
