//By Vide Noir https://github.com/EaglePhntm.

//The funny itself... Works with retaliate/rogue simple mobs and non simple human mobs.
//To set up proper you need to change seeksfuck var to TRUE
/mob/living

	//You can use this with any living.
	///Will this mob be given genitals and sexcontroller, therefore enabling erp panel, and basically enables everything else, key variable.
	var/erpable = FALSE

	//You can not use the vars below with anything less than retaliate/rogue simple mobs, anything less dont have retaliate ai and required vars.
	///Is this a horny goober that periodically tries to get in people.
	var/seeksfuck = FALSE
	///percent chance at initialize to enable seeksfuck, if normally not enabled in type.
	var/hornychance = 0
	///dumdumdumdum, use for not so smart mobs like goblins for dumb horny talk. "I smell a mate."
	var/lewd_talk = FALSE


	//stuff related to auto sex stuff
	///Dont touch or change those manually, those are set automatically with the process.
	var/isfucking = FALSE
	var/fuckcd = 0
	var/chasesfuck = FALSE
	var/seekboredom = 0


//--------------simple mobs ----------------
//sex stuff brainrot for things like werevolves --vide noir
//talking is not optional here for show of sentience.

/mob/living/simple_animal/hostile/retaliate/rogue/proc/Lewd_Tick()
	if(client)
		return
	if(!erpable)
		return
	if(fuckcd > 0)
		fuckcd -= 1
	if(fuckcd)
		return
	if(isfucking)
		return
	if(retreating)
		return
	if(sexcon && !chasesfuck)
		var/list/around = view(aggro_vision_range, src)
		for(var/mob/living/carbon/human/fucktarg in around)
			var/datum/sex_controller/sc = fucktarg.sexcon
			if(!src.aggressive && fucktarg.cmode) //skip if the target has cmode on and the mob is not aggressive.
				continue
			if(fucktarg.has_quirk(/datum/quirk/monsterhunter) && !sc.beingfucked)
				chasesfuck = TRUE
				if(src.gender == MALE)
					src.visible_message(span_boldwarning("[src] has his eyes on [fucktarg], cock throbbing!"))
					src.say(pick("Come here, mate!", "I smell a mate..!", "I'm going to get in you!",  "You will breed with me!"), language = /datum/language/common)
				else
					src.visible_message(span_boldwarning("[src] has her eyes on [fucktarg], cunt dripping!"))
					src.say(pick("Come here, mate!", "I smell a mate..!", "I'm going to get you in me!", "You will breed with me!"), language = /datum/language/common)
				break
			else
				continue
	if(chasesfuck) //until fuck is acquired, keep chasing.
		seekboredom += 1
		enemies = list()
		target = null
		approaching_target = FALSE
		in_melee = FALSE
		if(prob(10))
			if(src.gender == MALE)
				src.visible_message(span_warning("[src] seeks his mate, cock throbbing!"))
				src.say(pick("I'll catch you yet...", "I smell a mate...", "I'm going to get in you!",  "You will breed with me!"), language = /datum/language/common)
			else
				src.visible_message(span_warning("[src] seeks her mate, cunt dripping!"))
				src.say(pick("I'll catch you yet...", "I smell a mate...", "I'm going to get you in me!", "You will breed with me!"), language = /datum/language/common)
		seeklewd()
	if(seekboredom > 25) //give up after a while and go dormant again, this should also help them get unstuck.
		stoppedfucking(TRUE)
	if(retreating && chasesfuck) //we are outta here
		stoppedfucking(TRUE)

/mob/living/simple_animal/hostile/retaliate/rogue/proc/seeklewd()
	var/mob/living/carbon/human/L
	var/list/around = view(aggro_vision_range, src)
	var/list/foundfuckmeat = list()
	if(isfucking && fuckcd > 0)
		return
	for(var/mob/living/carbon/human/fucktarg in around)
		if(!src.retreating && fucktarg.has_quirk(/datum/quirk/monsterhunter))
			foundfuckmeat += fucktarg
			L = fucktarg
			if(src.Adjacent(L))
				if(iscarbon(L))
					isfucking = TRUE
					chasesfuck = FALSE
					if(attack_sound)
						playsound(src, pick(attack_sound), 100, TRUE, -1)
					stop_automated_movement = TRUE
					if(L.cmode)
						L.SetImmobilized(20)
						L.SetKnockdown(20)
					else //sneak attacked i guess.
						L.SetImmobilized(50)
						L.SetKnockdown(50)
					if(!L.lying)
						L.emote("gasp")
					if(!L.cmode && L.wear_pants) //pants off if not in cmode
						src.visible_message(span_danger("[src] manages to rip [L]'s [L.wear_pants.name] off!"))
						var/obj/item/clothing/thepants = L.wear_pants
						L.dropItemToGround(thepants)
						thepants.throw_at(orange(2, get_turf(L)), 2, 1, src, TRUE)
					else if(L.cmode && L.wear_pants)
						src.visible_message(span_danger("[src] manages to tug [L]'s [L.wear_pants.name] out of the way!"))
					enemies = list()
					target = null
					approaching_target = FALSE
					in_melee = FALSE
					var/datum/sex_controller/sc = src.sexcon
					toggle_ai(AI_OFF)
					if(aggressive)
						sc.force = SEX_FORCE_MAX
					else
						sc.force = SEX_FORCE_MID
					src.throw_at(get_turf(L.loc), 3, 3, spin = FALSE)
					if(!get_turf(src) == get_turf(L)) //are we at the same tile?
						walk_to(src, get_turf(L.loc), 1, move_to_delay) //get on them.
					start_pulling(L)
					src.visible_message(span_danger("[src] starts to breed [L]!"))
					if(sc.force == SEX_FORCE_MAX)
						src.visible_message(span_danger("[src] pins [L] down for a savage fucking!"))
					else
						src.visible_message(span_info("[src] climbs on [L] to breed."))
					sc.speed = SEX_SPEED_MAX
					if(gender == MALE)
						sc.manual_arousal = SEX_MANUAL_AROUSAL_MAX
					log_admin("[src] is trying to init sex on [L]")
					var/current_action = /datum/sex_action/npc_rimming
					if(src.gender == FEMALE && L.gender == MALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_facesitting
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_ride_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_vaginal_ride_sex
					if(src.gender == MALE && L.gender == MALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_anal_sex
					if(src.gender == MALE && L.gender == FEMALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_vaginal_sex
					if(src.gender == FEMALE && L.gender == FEMALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_facesitting
							if(2) //anal
								current_action = /datum/sex_action/npc_rimming
							if(3) //vaginal
								current_action = /datum/sex_action/npc_cunnilingus
					sc.do_until_finished = TRUE
					sc.target = L
					sc.try_start_action(current_action)
					return
		else if(foundfuckmeat == list())
			fuckcd = rand(20,80)
	for(var/mob/living/fucktarg in foundfuckmeat)
		var/turf/T = get_turf(fucktarg)
		Goto(T,move_to_delay,0)
		break
	return 

/mob/living/simple_animal/hostile/retaliate/rogue/proc/stoppedfucking(timedout = FALSE)
	walk_away(src, get_turf(src.loc), 4, move_to_delay)
	isfucking = FALSE
	chasesfuck = FALSE
	seekboredom = 0
	toggle_ai(AI_ON)
	var/datum/sex_controller/sc = src.sexcon
	if(sc.just_ejaculated() || timedout) //is it satisfied or given up
		fuckcd = rand(50,350)
	else
		fuckcd = rand(20,80)
		if(aggressive)
			//if its in combat and unsatisfied by prey slipping off, it will wanna try again. But with some delay so the person can actually get up
			// and if they are taking turns with multiple seeksfuck mobs around this may help a bit.
			fuckcd = rand(10,20)
	stop_automated_movement = 0

/mob/living/simple_animal/hostile/retaliate/rogue/Retaliate()
	. = ..()
	if(isfucking)
		stoppedfucking()

/mob/living/simple_animal/hostile/retaliate/rogue/Life()
	if(seeksfuck)
		Lewd_Tick()
	. = ..()

/mob/living/simple_animal/Initialize()
	. = ..()
	if(erpable)
		give_genitals()
	if(prob(hornychance))
		seeksfuck = TRUE

//--------------not so simple mobs ----------------
//gonna be conversion of the simple mob stuff i made before somehow -videnoir
//those should not tackle down but only pounce laying mobs.
//those mobs may instantly refresh their cooldown if a mob is laying or is handcuffed nearby while seeking targets.

/mob/living/carbon/human/proc/Lewd_Tick()
	if(client)
		return
	if(!erpable)
		return
	if(fuckcd > 0)
		fuckcd -= 1
	if(fuckcd)
		return
	if(isfucking)
		return
	if(sexcon && !chasesfuck)
		var/list/around = view(10, src)
		for(var/mob/living/carbon/human/fucktarg in around)
			var/datum/sex_controller/sc = fucktarg.sexcon
			if(!src.aggressive && fucktarg.cmode) //skip if the target has cmode on and the mob is not aggressive.
				continue
			if(fucktarg.has_quirk(/datum/quirk/monsterhunter) && !sc.beingfucked)
				chasesfuck = TRUE
				if(lewd_talk)
					if(src.gender == MALE)
						src.visible_message(span_boldwarning("[src] has his eyes on [fucktarg], cock throbbing!"))
						src.say(pick("Come here, mate!", "I smell a mate..!", "I'm going to get in you!",  "You will breed with me!"), language = /datum/language/common)
					else
						src.visible_message(span_boldwarning("[src] has her eyes on [fucktarg], cunt dripping!"))
						src.say(pick("Come here, mate!", "I smell a mate..!", "I'm going to get you in me!", "You will breed with me!"), language = /datum/language/common)
				break
			else
				continue
	if(chasesfuck && (get_complex_pain() < ((STAEND * 10)*0.9))) //until fuck is acquired, keep chasing.
		seekboredom += 1
		enemies = list()
		target = null
		mode = AI_IDLE
		if(prob(10) && lewd_talk)
			if(src.gender == MALE)
				src.visible_message(span_warning("[src] seeks his mate, cock throbbing!"))
				src.say(pick("I'll catch you yet...", "I smell a mate...", "I'm going to get in you!",  "You will breed with me!"), language = /datum/language/common)
			else
				src.visible_message(span_warning("[src] seeks her mate, cunt dripping!"))
				src.say(pick("I'll catch you yet...", "I smell a mate...", "I'm going to get you in me!", "You will breed with me!"), language = /datum/language/common)
		seeklewd()
	if(seekboredom > 25) //give up after a while and go dormant again, this should also help them get unstuck.
		stoppedfucking(timedout = TRUE)
	if((get_complex_pain() >= ((STAEND * 10)*0.9)) && chasesfuck) //we are outta here due pain.
		stoppedfucking(timedout = TRUE)

/mob/living/carbon/human/proc/seeklewd()
	var/mob/living/carbon/human/L
	var/list/around = view(10, src)
	var/list/foundfuckmeat = list()
	if(isfucking && fuckcd > 0)
		return
	for(var/mob/living/carbon/human/fucktarg in around)
		if((get_complex_pain() < ((STAEND * 10)*0.9)) && fucktarg.has_quirk(/datum/quirk/monsterhunter))
			foundfuckmeat += fucktarg
			L = fucktarg
			if(src.Adjacent(L))
				if(iscarbon(L))
					isfucking = TRUE
					chasesfuck = FALSE
					mode = AI_OFF
					wander = FALSE
					if(L.cmode)
						L.SetImmobilized(20)
						L.SetKnockdown(20)
					else //sneak attacked i guess.
						L.SetImmobilized(50)
						L.SetKnockdown(50)
					if(!L.lying) //i guess if already targeted but got up somehow.
						L.emote("gasp")
					if(!L.cmode && L.wear_pants) //pants off if not in cmode
						src.visible_message(span_danger("[src] manages to rip [L]'s [L.wear_pants.name] off!"))
						var/obj/item/clothing/thepants = L.wear_pants
						L.dropItemToGround(thepants)
						thepants.throw_at(orange(2, get_turf(L)), 2, 1, src, TRUE)
					else if(L.cmode && L.wear_pants)
						src.visible_message(span_danger("[src] manages to tug [L]'s [L.wear_pants.name] out of the way!"))
					enemies = list()
					target = null
					var/datum/sex_controller/sc = src.sexcon
					if(aggressive)
						sc.force = SEX_FORCE_MAX
					else
						sc.force = SEX_FORCE_MID
					src.throw_at(get_turf(L.loc), 3, 3, spin = FALSE)
					if(!get_turf(src) == get_turf(L)) //are we at the same tile?
						walk2derpless(L) //get on them.
					start_pulling(L)
					src.visible_message(span_danger("[src] starts to breed [L]!"))
					if(sc.force == SEX_FORCE_MAX)
						src.visible_message(span_danger("[src] pins [L] down for a savage fucking!"))
					else
						src.visible_message(span_info("[src] climbs on [L] to breed."))
					sc.speed = SEX_SPEED_MAX
					if(gender == MALE)
						sc.manual_arousal = SEX_MANUAL_AROUSAL_MAX
					log_admin("[src] is trying to init sex on [L]")
					var/current_action = /datum/sex_action/npc_rimming
					if(src.gender == FEMALE && L.gender == MALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_facesitting
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_ride_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_vaginal_ride_sex
					if(src.gender == MALE && L.gender == MALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_anal_sex
					if(src.gender == MALE && L.gender == FEMALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_vaginal_sex
					if(src.gender == FEMALE && L.gender == FEMALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_facesitting
							if(2) //anal
								current_action = /datum/sex_action/npc_rimming
							if(3) //vaginal
								current_action = /datum/sex_action/npc_cunnilingus
					sc.do_until_finished = TRUE
					sc.target = L
					sc.try_start_action(current_action)
					return
		else if(foundfuckmeat == list())
			fuckcd = rand(20,80)
	for(var/mob/living/carbon/human/fucktarg in foundfuckmeat)
		var/turf/T = get_turf(fucktarg)
		walk2derpless(T)
		break
	return 

/mob/living/carbon/human/proc/stoppedfucking(mob/living/carbon/target, timedout = FALSE)
	//try to bind after sex.
	if(!target && !timedout)
		if(aggressive && !target.handcuffed && target.lying) //aggro mob, not handcuffed, lying.
			for(var/obj/item/rope/ropey in src.held_items)
				start_pulling(target)
				ropey.attack(target, src)
				if(target.cmode)
					visible_message(span_info("[src] struggles with [target]!"))
					src.adjustStaminaLoss(50, TRUE)
					target.adjustStaminaLoss(50, TRUE)
				emote("laugh")
				break
		else if(target.handcuffed)
			emote("laugh")
			target.adjustStaminaLoss(25, TRUE)
			src.adjustStaminaLoss(25, TRUE)
	else if(target)
		walk_away(src, get_turf(src.loc), 4, 1)
	isfucking = FALSE
	chasesfuck = FALSE
	seekboredom = 0
	mode = AI_ON
	wander = initial(wander)
	var/datum/sex_controller/sc = src.sexcon
	if(sc.just_ejaculated() || timedout) //is it satisfied or given up
		fuckcd = rand(50,350)
	else
		fuckcd = rand(20,80)
		if(aggressive)
			//if its in combat and unsatisfied by prey slipping off, it will wanna try again. But with some delay so the person can actually get up
			// and if they are taking turns with multiple seeksfuck mobs around this may help a bit.
			fuckcd = rand(10,20)


/mob/living/carbon/human/should_target(mob/living/L)
	if(!L)
		return
	//those are here for proc dependancy.
	if(L.lying && L.held_items == list()) //laying with no items in hand, no threat.
		if(prob(4) && L.has_quirk(/datum/quirk/monsterhunter) && erpable) //tiny chance to trigger abuss.
			fuckcd = 0
			seeklewd()
		return FALSE
	. = ..()

	var/mob/living/carbon/lcarbon = L
	if(istype(lcarbon, /mob/living/carbon)) //leave alone if handcuffed.
		if(lcarbon.handcuffed)
			if(prob(8) && lcarbon.has_quirk(/datum/quirk/monsterhunter) && erpable) //small chance to trigger abuss.
				fuckcd = 0
				seeklewd()
			return FALSE
	. = ..()

/mob/living/carbon/human/Life()
	. = ..()
	if(seeksfuck)
		Lewd_Tick()

/mob/living/carbon/human/Initialize()
	. = ..()
	if(erpable)
		give_genitals()
	if(prob(hornychance))
		seeksfuck = TRUE

//maybe if we make some monsters that would be similiar to werewolves as is, These will take existing gender var on src and use it to assign genitals.
//internal organs so sixtuplet or whatever the fuck breasts etc shouldnt matter probably, no graphic. Maybe can use for monstergirls or something too.
//Call this proc to give genitals automatically where needed.
//hidden organs are on by default due to coloring issues.
/mob/living/proc/give_genitals(hidden_organs = TRUE)
	defiant = 0
	erpable = TRUE
	if(sexcon == null)
		sexcon = new /datum/sex_controller(src)
	if(!issimple(src))
		if(!src.getorganslot(ORGAN_SLOT_ANUS))
			var/obj/item/organ/filling_organ/anus/ass = src.getorganslot(ORGAN_SLOT_ANUS)
			ass = new /obj/item/organ/filling_organ/anus
			ass.Insert(src)
		if(gender == MALE)
			var/obj/item/organ/filling_organ/testicles/testicles = src.getorganslot(ORGAN_SLOT_TESTICLES)
			testicles = new /obj/item/organ/filling_organ/testicles/internal
			testicles.organ_size = rand(3)
			testicles.Insert(src)
			var/obj/item/organ/penis/penis = src.getorganslot(ORGAN_SLOT_PENIS)
			if(hidden_organs)
				penis = new /obj/item/organ/penis/internal
			else
				penis = new /obj/item/organ/penis
			penis.penis_size = rand(3)
			penis.Insert(src)
		if(gender == FEMALE)
			var/obj/item/organ/filling_organ/breasts/breasts = src.getorganslot(ORGAN_SLOT_BREASTS)
			if(hidden_organs)
				breasts = new /obj/item/organ/filling_organ/breasts/internal
			else
				breasts = new /obj/item/organ/filling_organ/breasts
			breasts.organ_size = rand(10)
			breasts.Insert(src)
			var/obj/item/organ/filling_organ/vagina/vagina = src.getorganslot(ORGAN_SLOT_VAGINA)
			if(hidden_organs)
				vagina = new /obj/item/organ/filling_organ/vagina/internal
			else
				vagina = new /obj/item/organ/filling_organ/vagina
			vagina.Insert(src)
			if(prob(3)) //3 chance to be dickgirl.
				var/obj/item/organ/filling_organ/testicles/testicles = src.getorganslot(ORGAN_SLOT_TESTICLES)
				if(hidden_organs)
					testicles = new /obj/item/organ/filling_organ/testicles/internal
				else
					testicles = new /obj/item/organ/filling_organ/testicles
				testicles.organ_size = rand(3)
				testicles.Insert(src)
				var/obj/item/organ/penis/penis = src.getorganslot(ORGAN_SLOT_PENIS)
				if(hidden_organs)
					penis = new /obj/item/organ/penis/internal
				else
					penis = new /obj/item/organ/penis
				penis.penis_size = rand(3)
				penis.Insert(src)
	src.sexcon.manual_arousal = 4
