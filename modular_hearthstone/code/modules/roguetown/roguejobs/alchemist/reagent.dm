/datum/reagent/medicine/paralysispot                           // This is a tool of a hot topic. This may be removed entirely if people can abuse it in one way or another. 
	name = "Paralysis Potion"
	description = "Paralyzes those it enters."
	reagent_state = LIQUID
	color = "#fcefa8"
	taste_description = "stiffness"
	overdose_threshold = 5
	metabolization_rate = 1 * REAGENTS_METABOLISM
	alpha = 225

/datum/reagent/medicine/paralysispot/overdose_process(mob/living/L)
	L.Paralyze(200)
	..()
	. = 1 

/datum/reagent/medicine/fortitudepot
	name = "Fortitude Potion"
	description = "Increases one's Strength and Constitution."
	reagent_state = LIQUID
	color = "#d46000"
	taste_description = "raw fortitude"
	overdose_threshold = 19
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	alpha = 200

/datum/reagent/medicine/fortitudepot/overdose_process(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/buff/fortitudebuff)
	..()
	. = 1 

/datum/reagent/medicine/swiftnesspot
	name = "Swiftness Potion"
	description = "Increases one's Speed and Dexterity."
	reagent_state = LIQUID
	color = "#7efff9"
	taste_description = "fleeting swirls"
	overdose_threshold = 19
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	alpha = 225

/datum/reagent/medicine/swiftnesspot/overdose_process(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/buff/swiftnessbuff)
	..()
	. = 1 

/datum/reagent/medicine/intellectpot
	name = "Intellect Potion"
	description = "Increases one's Intelligence and Perception."
	reagent_state = LIQUID
	color = "#922296"
	taste_description = "whispering insight"
	overdose_threshold = 19
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	alpha = 225

/datum/reagent/medicine/intellectpot/overdose_process(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/buff/intellectbuff)
	..()
	. = 1 

/datum/reagent/medicine/virilitypot
	name = "Virlity Potion"
	description = "Increases one's virility."
	reagent_state = LIQUID
	color = "#ffa6f8"
	taste_description = "aching virility"
	overdose_threshold = 9
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	alpha = 225

/datum/reagent/medicine/virilitypot/overdose_process(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/buff/virilitybuff)
	.. ()
	. = 1 
