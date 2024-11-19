//traits with no real impact that can be taken freely
//MAKE SURE THESE DO NOT MAJORLY IMPACT GAMEPLAY. those should be positive or negative traits.

/*
/datum/quirk/pineapple_liker
	name = "Ananas Affinity"
	desc = "Has no effect but breaks the game if we remove it."
	value = 0
	gain_text = span_notice("I feel an intense craving for pineapple.")
	lose_text = span_notice("My feelings towards pineapples seem to return to a lukewarm state.")
	medical_record_text = "Patient demonstrates a pathological love of pineapple."

/datum/quirk/pineapple_liker/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= PINEAPPLE

/datum/quirk/pineapple_liker/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food &= ~PINEAPPLE

/datum/quirk/pineapple_hater
	name = "Ananas Aversion"
	desc = "Has no effect but breaks the game if we remove it."
	value = 0
	gain_text = span_notice("I find myself pondering what kind of idiot actually enjoys pineapples...")
	lose_text = span_notice("My feelings towards pineapples seem to return to a lukewarm state.")
	medical_record_text = "Patient is correct to think that pineapple is disgusting."

/datum/quirk/pineapple_hater/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food |= PINEAPPLE

/datum/quirk/pineapple_hater/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.disliked_food &= ~PINEAPPLE

/datum/quirk/deviant_tastes
	name = "Deviant Tastes"
	desc = "Stuff you like is now the stuff you hate, and other way around. (probably) Has no effect."
	value = 0
	gain_text = span_notice("I start craving something that tastes strange.")
	lose_text = span_notice("I feel like eating normal food again.")
	medical_record_text = "Patient demonstrates irregular nutrition preferences."

/datum/quirk/deviant_tastes/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	var/liked = species.liked_food
	species.liked_food = species.disliked_food
	species.disliked_food = liked

/datum/quirk/deviant_tastes/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)
*/

/datum/quirk/monsterhunter
	name = "Monster \"Hunter\""
	desc = "Allows targeting by specific monsters (such as werewolves, goblins and minotaurs etc.) for something very lewd. May be unfair to you in combat."
	value = 0
	gain_text = span_notice("I want to feel a monster inside.. or inside a monster.")
	lose_text = span_notice("I no longer am a degenerate.")

/datum/quirk/selfawaregeni
	name = "Sensitiveness"
	desc = "I can tell more about my private bits (may be spammy, exact liquid information and alerts etc.)"
	value = 0

//damn snowflakes.
/datum/quirk/weirdo
	name = "Freeky"
	desc = "I can use my 'orifices' to store things and do more strange sexual things that wouldn't come to sane mind."
	value = 0
