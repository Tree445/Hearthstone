/obj/item/organ/penis
	name = "penis"
	icon_state = "penis"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_PENIS
	organ_size = DEFAULT_PENIS_SIZE
	organ_dna_type = /datum/organ_dna/penis
	accessory_type = /datum/sprite_accessory/penis/human
	var/sheath_type = SHEATH_TYPE_NONE
	var/erect_state = ERECT_STATE_NONE
	var/penis_type = PENIS_TYPE_PLAIN
	var/always_hard = FALSE
	var/strapon = FALSE

/obj/item/organ/penis/proc/update_erect_state()
	if(istype(src, /obj/item/organ/penis/internal))
		return
	var/oldstate = erect_state
	var/new_state = ERECT_STATE_NONE
	if(owner)
		var/mob/living/carbon/human/human = owner
		if(always_hard || (human.sexcon.arousal > 20 && human.sexcon.manual_arousal == 1) || human.sexcon.manual_arousal == 4)
			new_state = ERECT_STATE_HARD
		else if(human.sexcon.arousal > 10 && human.sexcon.manual_arousal == 1 || human.sexcon.manual_arousal == 3)
			new_state = ERECT_STATE_PARTIAL
		else
			new_state = ERECT_STATE_NONE

	erect_state = new_state
	if(oldstate != erect_state && owner)
		owner.update_body_parts(TRUE)

/obj/item/organ/penis/knotted
	name = "knotted penis"
	penis_type = PENIS_TYPE_KNOTTED
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "knotpenis"

/obj/item/organ/penis/knotted/big
	organ_size = 5

/obj/item/organ/penis/equine
	name = "equine penis"
	penis_type = PENIS_TYPE_EQUINE
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "equinepenis"

/obj/item/organ/penis/tapered_mammal
	name = "tapered penis"
	penis_type = PENIS_TYPE_TAPERED
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "taperedpenis"

/obj/item/organ/penis/tapered
	name = "tapered penis"
	penis_type = PENIS_TYPE_TAPERED
	sheath_type = SHEATH_TYPE_SLIT
	icon_state = "taperedpenis"

/obj/item/organ/penis/tapered_double
	name = "hemi tapered penis"
	penis_type = PENIS_TYPE_TAPERED_DOUBLE
	sheath_type = SHEATH_TYPE_SLIT
	icon_state = "hemipenis"

/obj/item/organ/penis/tapered_double_knotted
	name = "hemi knotted tapered penis"
	penis_type = PENIS_TYPE_TAPERED_DOUBLE_KNOTTED
	sheath_type = SHEATH_TYPE_SLIT
	icon_state = "hemiknotpenis"

/obj/item/organ/penis/barbed
	name = "barbed penis"
	penis_type = PENIS_TYPE_BARBED
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "barbpenis"

/obj/item/organ/penis/barbed_knotted
	name = "barbed knotted penis"
	penis_type = PENIS_TYPE_BARBED_KNOTTED
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "barbpenis"

/obj/item/organ/penis/tentacle
	name = "tentacle penis"
	penis_type = PENIS_TYPE_TENTACLE
	sheath_type = SHEATH_TYPE_NONE
	icon_state = "tentapenis"

/obj/item/organ/filling_organ/anus
	//absorbs faster than womb, less capacity.
	name = "anus"
	icon = 'modular_stonehedge/icons/obj/surgery.dmi'
	icon_state = "anus"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_ANUS
	accessory_type = /datum/sprite_accessory/none
	max_reagents = 20 //less size than vagene in turn for more effective absorbtion
	absorbing = TRUE
	absorbmult = 1.5 //more effective absorb than others i guess.
	altnames = list("ass", "asshole", "butt", "butthole", "guts") //used in thought messages.
	spiller = TRUE
	blocker = ITEM_SLOT_PANTS
	bloatable = TRUE

/obj/item/organ/filling_organ/vagina
	name = "vagina"
	icon = 'modular_stonehedge/icons/obj/surgery.dmi'
	icon_state = "vagina"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_VAGINA
	accessory_type = /datum/sprite_accessory/vagina/human
	max_reagents = 40 //big cap, ordinary absorbtion.
	absorbing = TRUE
	fertility = TRUE
	pregnantaltorgan = /obj/item/organ/belly
	altnames = list("vagina", "cunt", "womb", "pussy", "slit", "kitty", "snatch") //used in thought messages.
	spiller = TRUE
	blocker = ITEM_SLOT_PANTS
	bloatable = TRUE

/obj/item/organ/filling_organ/breasts
	name = "breasts"
	icon = 'modular_stonehedge/icons/obj/surgery.dmi'
	icon_state = "breasts"
	dropshrink = 0.8
	visible_organ = TRUE
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	organ_dna_type = /datum/organ_dna/breasts
	accessory_type = /datum/sprite_accessory/breasts/pair
	organ_size = DEFAULT_BREASTS_SIZE
	reagent_to_make = /datum/reagent/consumable/milk
	hungerhelp = TRUE
	organ_sizeable = TRUE
	absorbing = FALSE //funny liquid tanks
	altnames = list("breasts", "tits", "milkers", "tiddies", "badonkas", "boobas") //used in thought messages.
	startsfilled = TRUE
	blocker = ITEM_SLOT_SHIRT

/obj/item/organ/filling_organ/breasts/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(!refilling)
		reagents.clear_reagents()

/obj/item/organ/belly
	name = "belly"
	icon = 'modular_stonehedge/icons/obj/surgery.dmi'
	icon_state = "belly"
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_STOMACH
	slot = ORGAN_SLOT_BELLY
	organ_dna_type = /datum/organ_dna/belly
	accessory_type = /datum/sprite_accessory/belly
	organ_size = DEFAULT_BELLY_SIZE

/obj/item/organ/filling_organ/testicles
	name = "testicles"
	icon = 'modular_stonehedge/icons/obj/surgery.dmi'
	icon_state = "testicles"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TESTICLES
	organ_dna_type = /datum/organ_dna/testicles
	accessory_type = /datum/sprite_accessory/testicles/pair
	organ_size = DEFAULT_TESTICLES_SIZE
	reagent_to_make = /datum/reagent/consumable/cum
	refilling = TRUE
	hungerhelp = FALSE //balls dont be dry if you starve
	reagent_generate_rate = 0.2
	organ_sizeable = TRUE
	altnames = list("balls", "testicles", "testes", "orbs", "cum tanks", "seed tanks") //used in thought messages.
	startsfilled = TRUE
	blocker = ITEM_SLOT_PANTS
	var/virility = TRUE

/obj/item/organ/filling_organ/testicles/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(!virility)
		reagent_to_make = /datum/reagent/consumable/cum/sterile
		reagents.clear_reagents()
		reagents.add_reagent(reagent_to_make, reagents.maximum_volume)

/obj/item/organ/butt
	name = "butt"
	icon = 'modular_stonehedge/icons/obj/surgery.dmi'
	icon_state = "butt"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_STOMACH
	slot = ORGAN_SLOT_BUTT
	organ_dna_type = /datum/organ_dna/butt
	accessory_type = /datum/sprite_accessory/butt/pair
	organ_size = DEFAULT_BUTT_SIZE


/obj/item/organ/filling_organ/testicles/internal
	name = "internal testicles"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/penis/internal
	name = "internal penis"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/filling_organ/vagina/internal
	name = "internal vagina"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/filling_organ/breasts/internal
	name = "internal breasts"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/belly/internal
	name = "internal belly"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/butt/internal
	name = "internal butt"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none
