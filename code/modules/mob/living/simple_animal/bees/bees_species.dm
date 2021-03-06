//Beekeeping 3.5 by Deity Link

//SPECIES DATUM

//BUG DATUM

//QUEEN BUG DATUM

//QUEEN BUG PACKET

//BUG CORPSES

//TYPES FOR CASUAL SPAWNS

//the framework will be expanded later for bugs other than bees, ones that don't have queens, hives...

//////////////////////////////////////
//           NORMAL BEES            //
//////////////////////////////////////

/datum/bee_species
	var/name = "apis mellifera"
	var/common_name = BEESPECIES_NORMAL
	var/prefix = ""
	var/worker_product = HONEY
	var/queen_product = ROYALJELLY
	var/list/toxic_reagents = list(
		TOXIN = 2,
		STOXIN = 1,
		FLUORINE = 1,
		RADIUM = 3,
		FUEL = 2,
		VOMIT = 1,
		BLEACH = 2,
		PLANTBGONE = 3,
		PLASMA = 2,
		SACID = 1,
		PACID = 3,
		CYANIDE = 4,
		AMATOXIN = 2,
		AMANATIN = 3,
		POISONBERRYJUICE = 2,
		CARPOTOXIN = 2,
		ZOMBIEPOWDER = 3,
		MINDBREAKER = 1,
		PLASTICIDE = 2,
	)
	var/angery = 1
	var/max_queen_inside = 1
	var/queen_wanders = 1
	var/toxic_threshold_anger = 33//percentage of apiary toxicity before bees that come out feel like killing stuff instead of pollinating.
	var/toxic_threshold_death = 50//percentage of apiary toxicity before bees outside the hive start dying of toxicity.
	var/bee_type = /datum/bee
	var/queen_type = /datum/bee/queen_bee

	var/min_oxy = 5
	var/max_oxy = 0
	var/min_tox = 0
	var/max_tox = 1
	var/min_co2 = 0
	var/max_co2 = 5
	var/min_n2 = 0
	var/max_n2 = 0
	var/minbodytemp = 0
	var/maxbodytemp = 360
	var/corpse = /obj/effect/decal/cleanable/bee

//////////////////////////////////////
//             VOX BEES             //
//////////////////////////////////////

/datum/bee_species/chill
	name = "apis chiliverax"
	common_name = BEESPECIES_VOX
	prefix = "chill_"
	worker_product = CHILLWAX
	queen_product = CHILLWAX
	toxic_reagents = list(
		BLEACH = 2,
		PLANTBGONE = 3,
		CYANIDE = 4,
		PLASTICIDE = 2,
	)
	angery = 0//never gets mad ever
	toxic_threshold_anger = 90//unless you're really pushing it
	max_queen_inside = 2
	queen_wanders = 0
	bee_type = /datum/bee/chill
	queen_type = /datum/bee/queen_bee/chill

	min_oxy = 0
	max_oxy = 1
	min_n2 = 5
	maxbodytemp = 400
	corpse = /obj/effect/decal/cleanable/bee/chill

/////////////////BUG DATUM
/datum/bee/chill
	corpse = /obj/effect/decal/cleanable/bee/chill

/datum/bee/chill/New()
	..()
	species = bees_species[BEESPECIES_VOX]

/////////////////QUEEN BUG DATUM
/datum/bee/queen_bee/chill
	corpse = /obj/effect/decal/cleanable/bee/queen_bee/chill

/datum/bee/queen_bee/chill/New()
	..()
	species = bees_species[BEESPECIES_VOX]

/////////////////QUEEN BUG PACKET
/obj/item/queen_bee/chill
	name = "chill bug queen packet"
	desc = "Place her into an apiary so she can get busy. This species is particularly non-violent. Produces wax with calming properties."
	icon = 'icons/obj/insects_etc.dmi'
	icon_state = "chill_queen_larvae"
	w_class = W_CLASS_TINY
	species = null

/obj/item/queen_bee/chill/New()
	..()
	initialize()

/obj/item/queen_bee/chill/initialize()
	species = bees_species[BEESPECIES_VOX]

/////////////////BUG CORPSES
/obj/effect/decal/cleanable/bee/chill
	name = "dead chill bug"
	desc = "This one stung for the last time."
	icon_state = "chill_bee_dead"

/obj/effect/decal/cleanable/bee/queen_bee/chill
	name = "dead chill bug queen"
	icon_state = "chill_queen_bee_dead"

/////////////////TYPES FOR CASUAL SPAWNS
/mob/living/simple_animal/bee/adminSpawned_chill/New(loc, var/obj/machinery/apiary/new_home)
	..()
	initialize()

/mob/living/simple_animal/bee/adminSpawned_chill/initialize()
	var/datum/bee/chill/B = new()
	addBee(B)
	update_icon()

/mob/living/simple_animal/bee/adminSpawnedQueen_chill/New(loc, var/obj/machinery/apiary/new_home)
	..()
	initialize()

/mob/living/simple_animal/bee/adminSpawnedQueen_chill/initialize()
	var/datum/bee/queen_bee/chill/B = new()
	B.colonizing = 1//so it can start a colony if someone places it in an empty hive
	addBee(B)
	update_icon()
