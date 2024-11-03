/area/rogue/under/cavewet/bogcaves/chapel
	first_time_text = "FLOODED CHAPEL"
	spookysounds = SPOOKY_MYSTICAL
	spookynight = SPOOKY_MYSTICAL
	droning_sound = 'sound/music/area/magiciantower.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/cavewet/bogcaves/sunkencity
	first_time_text = "MELTED UNTERCITY"
	spookysounds = SPOOKY_MYSTICAL
	spookynight = SPOOKY_MYSTICAL
	droning_sound = 'sound/music/area/underworlddrone.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/cavewet/bogcaves/sunkencity/psydon
	first_time_text = "CRADLE OF LIFE"
	spookysounds = null
	spookynight = null
	droning_sound = 'sound/music/area/psydondeath.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

// Viking Land
/area/rogue/outdoors/vikingarea
	name = "vikingarea"
	icon_state = "viking"
	ambientsounds = AMB_BOGDAY
	ambientnight = AMB_BOGNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/viking.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass,
				/turf/open/water)
	first_time_text = "The Deep North"
	converted_type = /area/rogue/indoors/shelter/bog


///Unnamed Tomb
/area/rogue/under/cavewet/bogcaves/tomb
	icon = 'modular_hearthstone/icons/areas/areas.dmi'
	icon_state = "tomb"
	first_time_text = "Unnamed Tomb"
	spookysounds = SPOOKY_MYSTICAL
	spookynight = SPOOKY_MYSTICAL
	droning_sound = 'sound/music/area/underworlddrone.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/cavewet/bogcaves/tomb/martyr
	first_time_text = "Crypt of the Martyred"
	icon_state = "tomb2"
