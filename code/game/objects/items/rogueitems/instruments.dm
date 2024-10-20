
/obj/item/rogue/instrument
	name = ""
	desc = ""
	icon = 'icons/roguetown/items/music.dmi'
	icon_state = ""
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK_R|ITEM_SLOT_BACK_L
	can_parry = TRUE
	force = 23
	throwforce = 7
	throw_range = 4
	var/datum/looping_sound/dmusloop/soundloop
	var/list/song_list = list()
	var/playing = FALSE
	improvised = TRUE

/obj/item/rogue/instrument/equipped(mob/living/user, slot)
	. = ..()
	STOP_PROCESSING(SSobj, src)
	if(playing && user.get_active_held_item() != src)
		playing = FALSE
		soundloop.stop()

/obj/item/rogue/instrument/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = 0,"sy" = 2,"nx" = 15,"ny" = -4,"wx" = -1,"wy" = 2,"ex" = 7,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 8,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogue/instrument/Initialize()
	soundloop = new(list(src), FALSE)
//	soundloop.start()
	. = ..()

/obj/item/rogue/instrument/dropped()
	..()
	STOP_PROCESSING(SSobj, src)
	if(soundloop)
		soundloop.stop()

/obj/item/rogue/instrument/attack_self(mob/living/user)
	var/stressevent = /datum/stressevent/music
	STOP_PROCESSING(SSobj, src)
	. = ..()
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	if(!playing)
		var/curfile = input(user, "Which song?", "Roguetown", name) as null|anything in song_list
		if(!user)
			return
		if(user.mind)
			soundloop.stress2give = null
			switch(user.mind.get_skill_level(/datum/skill/misc/music))
				if(1)
					stressevent = /datum/stressevent/music
				if(2)
					stressevent = /datum/stressevent/music/two
				if(3)
					stressevent = /datum/stressevent/music/three
				if(4)
					stressevent = /datum/stressevent/music/four
				if(5)
					stressevent = /datum/stressevent/music/five
				if(6)
					stressevent = /datum/stressevent/music/six
			START_PROCESSING(SSobj, src)

		if(playing)
			playing = FALSE
			soundloop.stop()
			STOP_PROCESSING(SSobj, src)
			return
		if(!(src in user.held_items))
			return
		if(user.get_inactive_held_item())
			playing = FALSE
			soundloop.stop()
			return
		if(curfile)
			curfile = song_list[curfile]
			playing = TRUE
			soundloop.mid_sounds = list(curfile)
			soundloop.cursound = null
			soundloop.start()
		for(var/mob/living/carbon/human/L in viewers(7))
			L.add_stress(stressevent)
	else
		playing = FALSE
		soundloop.stop()

/obj/item/rogue/instrument/process()
	var/datum/component/infusions/infused_instrument = src.GetComponent(/datum/component/infusions)
	if(!infused_instrument)
		STOP_PROCESSING(SSobj, src)
		return
	var/infusion_type = infused_instrument.infusion_name
	switch(infusion_type)
		if("haunting")
			if(prob(5)) //haunt
				playsound(loc, pick('sound/vo/mobs/ghost/laugh (1).ogg','sound/vo/mobs/ghost/laugh (2).ogg','sound/vo/mobs/ghost/laugh (3).ogg'), 300, TRUE)
			if(prob(10)) //flickers
				var/obj/machinery/light/L = locate(/obj/machinery/light) in view(30, src.loc)
				if(L)
					L.flicker()
			if(prob(15)) //poltergeist
				var/list/items = list()
				for(var/turf/T in range(12, src.loc))
					for(var/obj/item/i in T.contents)
						items.Add(i)
				if(items.len)
					var/obj/item/I = pick(items)
					if(I)
						var/direction = pick(NORTH,SOUTH,EAST,WEST,NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST)
						//I.throw_at(src, range = 1, speed = 200)
						step(I,direction)
		if("the sewers")
			//if(prob(50))//follow
			if(prob(20))//follow
				for(var/L in view(12, src.loc))
					if(istype(L, /obj/item/reagent_containers/food/snacks/smallrat) || istype(L, /mob/living/simple_animal/hostile/retaliate/rogue/bigrat) || istype(L, /mob/living/simple_animal/mouse) || istype(L, /mob/living/simple_animal/hostile/retaliate/poison/snake))
						walk_to(L, src, 1, 1.5 SECONDS)
			if(prob(10))//dance
				var/list/nearby_mobs = list()
				for(var/mob/living/L in view(12, src.loc))
					if(istype(L, /obj/item/reagent_containers/food/snacks/smallrat) || istype(L, /mob/living/simple_animal/hostile/retaliate/rogue/bigrat) || istype(L, /mob/living/simple_animal/mouse) || istype(L, /mob/living/simple_animal/hostile/retaliate/poison/snake))
						nearby_mobs.Add(L)
				if(nearby_mobs.len)
					var/mob/living/T = pick(nearby_mobs)
					var/list/emotes = list("smile", "flip")
					T.emote(pick(emotes))

/obj/item/rogue/instrument/lute
	name = "lute"
	desc = "Its graceful curves were designed to weave joyful melodies."
	icon_state = "lute"
	song_list = list("Song 1" = 'sound/music/instruments/lute (1).ogg',
	"Song 2" = 'sound/music/instruments/lute (2).ogg',
	"Song 3" = 'sound/music/instruments/lute (3).ogg',
	"Song 4" = 'sound/music/instruments/lute (4).ogg',
	"Song 5" = 'sound/music/instruments/lute (5).ogg',
	"Song 6" = 'sound/music/instruments/lute (6).ogg',
	"Song 7" = 'sound/music/instruments/lute (7).ogg')

/obj/item/rogue/instrument/accord
	name = "accordion"
	desc = "A harmonious vessel of nostalgia and celebration."
	icon_state = "accordion"
	song_list = list("Song 1" = 'sound/music/instruments/accord (1).ogg',
	"Song 2" = 'sound/music/instruments/accord (2).ogg',
	"Song 3" = 'sound/music/instruments/accord (3).ogg',
	"Song 4" = 'sound/music/instruments/accord (4).ogg',
	"Song 5" = 'sound/music/instruments/accord (5).ogg',
	"Song 6" = 'sound/music/instruments/accord (6).ogg')

/obj/item/rogue/instrument/guitar
	name = "guitar"
	desc = "This is a guitar." // i do not like this instrument, i refuse to describe it any better.
	icon_state = "guitar"
	song_list = list("Song 1" = 'sound/music/instruments/guitar (1).ogg',
	"Song 2" = 'sound/music/instruments/guitar (2).ogg',
	"Song 3" = 'sound/music/instruments/guitar (3).ogg',
	"Song 4" = 'sound/music/instruments/guitar (4).ogg',
	"Song 5" = 'sound/music/instruments/guitar (5).ogg',
	"Song 6" = 'sound/music/instruments/guitar (6).ogg')

/obj/item/rogue/instrument/harp
	name = "harp"
	desc = "A harp of elven craftsmanship."
	icon_state = "harp"
	song_list = list("Song 1" = 'sound/music/instruments/harb (1).ogg',
	"Song 2" = 'sound/music/instruments/harb (2).ogg',
	"Song 3" = 'sound/music/instruments/harb (3).ogg')

/obj/item/rogue/instrument/flute
	name = "flute"
	desc = "A slender flute carefully carved from a smooth wood piece."
	icon_state = "flute"
	song_list = list("Song 1" = 'sound/music/instruments/flute (1).ogg',
	"Song 2" = 'sound/music/instruments/flute (2).ogg',
	"Song 3" = 'sound/music/instruments/flute (3).ogg',
	"Song 4" = 'sound/music/instruments/flute (4).ogg',
	"Song 5" = 'sound/music/instruments/flute (5).ogg',
	"Song 6" = 'sound/music/instruments/flute (6).ogg')

/obj/item/rogue/instrument/drum
	name = "drum"
	desc = "Fashioned from taut skins across a sturdy frame, pulses like a giant heartbeat."
	icon_state = "drum"
	song_list = list("Song 1" = 'sound/music/instruments/drum (1).ogg',
	"Song 2" = 'sound/music/instruments/drum (2).ogg',
	"Song 3" = 'sound/music/instruments/drum (3).ogg')
