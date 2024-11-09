/datum/patron/norse/odin
	name = "Odin"
	domain = "God of War and Wisdom"
	desc = "It is said that Odin created the first Northmen and giants from which all life came on Midgard."
	worshippers = "Kings, Warriors, Chieftains."
	associated_faith = /datum/faith/norse
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY, TRAIT_VIKINGCAMP, TRAIT_NORTHMAN)
	undead_hater = FALSE
	confess_lines = list(
		"ODIN SMILES UPON ME AND THE VALYKRIES WILL SUMMON ME HOME!",
		"THIS WORLD IS BUT ONE OF MANY! ODIN HAS SHOWN ME!",
		"NINE WORLDS I KNEW AND NINE SHALL WELCOME ME! ODIN, MY SHEPARD!",
		"ODIN, WISE AND POWERFUL RULER OF ASGAR!",
	)

/datum/patron/norse/loki
	name = "Loki"
	domain = "God of Evil and Mischief"
	desc = "Loki is not a God to be worshipped, but a god to be delivered from. Often mistaken for Zizo, he is a being that arose from the depths of hell, who brought evil and mischief to the mortal world."
	worshippers = "Heathens, Murders, Inhumen Analogues."
	associated_faith = /datum/faith/norse
	mob_traits = list(TRAIT_ORGAN_EATER, TRAIT_VIKINGCAMP, TRAIT_NORTHMAN)
	undead_hater = FALSE
	confess_lines = list(
		"THE MADNESS SHALL NEVER END! LOKI GUIDES ME!",
		"I FEAR NOT DEATH! LOKI SHALL WELCOME ME!",
		"NINE WORLDS I KNEW AND NINE SHALL WELCOME ME! LOKI, MY SHEPARD!",
		"THIS WORLD IS BUT ONE OF MANY! LOKI HAS SHOWN ME THE TRUTH!",
	)
