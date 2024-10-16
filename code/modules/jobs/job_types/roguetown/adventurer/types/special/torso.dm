//No Limbs, Good Stats/Skills - Less OP now
/datum/advclass/torso
	name = "Torso"
	tutorial = "Some horrible accident in the forest did away with all of your limbs!\nSurvival will be a true TRIUMPH."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/torso
	category_tags = list(CTAG_CHALLENGE)



/datum/outfit/job/roguetown/adventurer/torso/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Bodybuilder","Handyman") // To Do - Make better names
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes
		switch(classchoice)

			if("Bodybuilder")
				H.set_blindness(0)
				traits_applied = list(TRAIT_ZJUMP, TRAIT_LEAPER, TRAIT_DODGEEXPERT)
				//Stats over Skills
				to_chat(H, span_warning("You conditioned your body, and trained your muscles! Unfortunately, your mind recieved less training - your foolishness cost you your limbs."))
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
				H.change_stat("strength", 3)
				H.change_stat("endurance", 3)
				H.change_stat("constitution", 2)
				H.change_stat("intelligence", -3)
				H.change_stat("speed", 3)
				pants = /obj/item/clothing/under/roguetown/tights/black
				belt = /obj/item/storage/belt/rogue/leather
				neck = /obj/item/storage/belt/rogue/pouch/coins/poor
				backl = /obj/item/storage/backpack/rogue/satchel
				beltl = /obj/item/rogueweapon/huntingknife

				var/static/list/safe_bodyzones = list(
					BODY_ZONE_HEAD,
					BODY_ZONE_CHEST,
				)
				for(var/obj/item/bodypart/limb in H.bodyparts)
					if(limb.body_zone in safe_bodyzones)
						continue
					limb.drop_limb()
					qdel(limb)
			if("Handyman")
				H.set_blindness(0)
				traits_applied = list(TRAIT_EMPATH, TRAIT_SEEDKNOW, TRAIT_SEEPRICES_SHITTY)
				//Skills over Stats
				to_chat(H, span_warning("You conditioned your soul, and trained your mind! Unfortunately, your muscles recieved less training - your weakness cost you your limbs."))
				H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/weaving, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/skincrafting, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/smelting, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 5, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/masonry, 4, TRUE)
				H.mind.adjust_skillrank(/datum/skill/labor/mining, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 2, TRUE)
				H.change_stat("strength", -2)
				H.change_stat("endurance", -1)
				H.change_stat("constitution", -1)
				H.change_stat("intelligence", 3)
				H.change_stat("fortune", 2)
				pants = /obj/item/clothing/under/roguetown/tights/black
				belt = /obj/item/storage/belt/rogue/leather
				neck = /obj/item/storage/belt/rogue/pouch/coins/poor
				backl = /obj/item/storage/backpack/rogue/satchel

				var/static/list/safe_bodyzones = list(
					BODY_ZONE_HEAD,
					BODY_ZONE_CHEST,
				)
				for(var/obj/item/bodypart/limb in H.bodyparts)
					if(limb.body_zone in safe_bodyzones)
						continue
					limb.drop_limb()
					qdel(limb)

