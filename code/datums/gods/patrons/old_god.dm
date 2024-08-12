/datum/patron/old_god
	name = "Psydon"
	domain = "God of Ontological Reality"
	desc = "The true God of everything, Psydon is maximally good - He created humen in his image to live in Psydonia."
	worshippers = "Heretics and the Enlightened"
	associated_faith = /datum/faith/old_god
	confess_lines = list(
		"THERE IS ONLY ONE GOD!",
		"THE TEN ARE FALSE GODS!",
		"PSYDON IS MY SHEPHERD!",
	)

/datum/patron/old_god/viking
	name = "The Norse Deities"
	domain = "All Possible Domain's"
	desc = "Old as any other gods of existance. Be it Odin the all father himself, Tyr, Freyja, Loki, Thor, Fenrir or Jormungandr. The true old gods. While not seen as Inhumen evil gods, They are seen by follower of the ten in an aloof dismissive way."
	worshippers = "The Norse, Warrior's, Tho's who wish to die in glory."
	mob_traits = list(TRAIT_NOSTINK, TRAIT_WILD_EATER) //unused trait, lets you eat raw meat and drink shit water shittier than the one beggar gets. removed a t2 spell to balance
	associated_faith = /datum/faith/old_god
	t1 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t3 = /obj/effect/proc_holder/spell/invoked/berserk
	confess_lines = list(
		"I WILL FIND MY SEAT IN VALHALLA!",
		"MY GODS ARE SMILING UPON ME, CAN YOU SAY THE SAME?!",
		"I SERVE THE TRUE OLD GODS!",
	)
