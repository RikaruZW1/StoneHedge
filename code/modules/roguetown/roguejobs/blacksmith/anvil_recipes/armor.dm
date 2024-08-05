/datum/anvil_recipe/armor
	appro_skill = /datum/skill/craft/armorsmithing
	craftdiff = 1

/datum/anvil_recipe/armor/ichainmail
	name = "Chainmail"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	i_type = "Armor"

/datum/anvil_recipe/armor/ichaincoif
	name = "Iron Chain Coif"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/neck/roguetown/chaincoif/iron
	i_type = "Armor"

/datum/anvil_recipe/armor/gorget
	name = "Gorget"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/neck/roguetown/gorget
	i_type = "Armor"

/datum/anvil_recipe/armor/ibreastplate
	name = "Breastplate (+1 Iron)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
	i_type = "Armor"

/datum/anvil_recipe/armor/ichainglove
	name = "Chain Gauntlets"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/gloves/roguetown/chain/iron
	i_type = "Armor"

/datum/anvil_recipe/armor/ichainleg
	name = "Chain Chausses"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/under/roguetown/chainlegs/iron
	i_type = "Armor"

/datum/anvil_recipe/armor/studdedskirt
	name = "Studded Skirt (+1 Leather Skirt)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/clothing/under/roguetown/trou/skirt)
	created_item = /obj/item/clothing/under/roguetown/chainlegs/iron/studdedskirt
	i_type = "Armor"

/datum/anvil_recipe/armor/platemask
	name = "Mask"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/facemask
	i_type = "Armor"

/datum/anvil_recipe/armor/skullcap
	name = "Skullcap"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/head/roguetown/helmet/skullcap
	i_type = "Armor"

/datum/anvil_recipe/armor/studded
	name = "Studded Leather Armor (+Leather Armor)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/clothing/suit/roguetown/armor/leather)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/studded
	i_type = "Armor"

/datum/anvil_recipe/armor/studdedbikini
	name = "Studded Leather Bikini (+Leather Armor/Bikini/Bra)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/clothing/suit/roguetown/armor/leather)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/studded/bikini
	i_type = "Armor"

/datum/anvil_recipe/armor/studdedbra
	name = "Studded Leather Bra (+Leather Armor/Bikini/Bra)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/clothing/suit/roguetown/armor/leather)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/studded/bikini/bra
	i_type = "Armor"

/datum/anvil_recipe/armor/helmetgoblin
	name = "Goblin Helmet (+1 Iron)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron)
	created_item = /obj/item/clothing/head/roguetown/helmet/goblin
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/plategoblin
	name = "Goblin Mail (+1 Iron)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/goblin
	craftdiff = 2
	i_type = "Armor"

// --------- STEEL -----------

/datum/anvil_recipe/armor/haubergeon
	name = "Haubergeon"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail
	i_type = "Armor"

/datum/anvil_recipe/armor/chainkini
	name = "Chainmail Bikini (+1 Cloth)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
	i_type = "Armor"

/datum/anvil_recipe/armor/chainbra
	name = "Chainmail Bra"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini/bra
	i_type = "Armor"


/datum/anvil_recipe/armor/hauberk
	name = "Hauberk (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/plate
	name = "Half-Plate Armour (+2 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate
	craftdiff = 3
	i_type = "Armor"

/datum/anvil_recipe/armor/platefull
	name = "Full-Plate Armour (+3 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/full
	craftdiff = 4
	i_type = "Armor"

/datum/anvil_recipe/armor/platebikini
	name = "Half-Plate Bikini (+2 Steel +1 Cloth)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/bikini
	craftdiff = 3
	i_type = "Armor"

/datum/anvil_recipe/armor/platebra
	name = "Half-Plate Bra (+2 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/bikini/bra
	craftdiff = 3
	i_type = "Armor"

/datum/anvil_recipe/armor/platefullbikini
	name = "Full-Plate Bikini (+3 Steel +1 Cloth)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/full/bikini
	craftdiff = 4
	i_type = "Armor"

/datum/anvil_recipe/armor/platefullbra
	name = "Full-Plate Bikini (+3 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/full/bikini/bra
	craftdiff = 4
	i_type = "Armor"

/datum/anvil_recipe/armor/coatplates
	name = "Coat Of Plates (+1 Cloth)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/brigandine
	name = "Brigandine (+1 Steel +2 Cloth)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/natural/cloth, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine
	craftdiff = 3
	i_type = "Armor"

/datum/anvil_recipe/armor/chaincoif
	name = "Steel chain Coif"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/chaincoif
	i_type = "Armor"

/datum/anvil_recipe/armor/chainglove
	name = "Chain Gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/chain
	i_type = "Armor"

/datum/anvil_recipe/armor/plateglove
	name = "Plate Gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/plate
	i_type = "Armor"

/datum/anvil_recipe/armor/chainleg
	name = "Chain Chausses"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/chainlegs
	i_type = "Armor"


/datum/anvil_recipe/armor/chainskirt
	name = "Chain Skirt"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/chainlegs/skirt
	i_type = "Armor"

/datum/anvil_recipe/armor/chainskirt
	name = "Chain Fishnet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/tights/stockings/fishnet/chain
	i_type = "Armor"

/datum/anvil_recipe/armor/ichainfishnet
	name = "Chain Fishnet"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/under/roguetown/tights/stockings/fishnet/chain/iron
	i_type = "Armor"

/datum/anvil_recipe/armor/plateskirt
	name = "Plated Skirt (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/under/roguetown/platelegs/skirt
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/brayette
	name = "Brayette"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/brayette
	i_type = "Armor"

/datum/anvil_recipe/armor/platelegs
	name = "Plated Chausses (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/under/roguetown/platelegs
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/hplate
	name = "Cuirass (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/half
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/scalemail
	name = "Scalemail"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/scale
	i_type = "Armor"

/datum/anvil_recipe/armor/platebracer
	name = "Plate Bracers"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/wrists/roguetown/bracers
	i_type = "Armor"

/datum/anvil_recipe/armor/helmetnasal
	name = "Nasal Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet
	i_type = "Armor"

/datum/anvil_recipe/armor/helmetsavoyard
	name = "Savoyard Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/guard
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/helmetbarred
	name = "Barred Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/sheriff
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/helmetkettle
	name = "Kettle Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/kettle
	i_type = "Armor"

/datum/anvil_recipe/armor/helmetbarbute
	name = "Barbute Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/bervor
	name = "Bervor"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/bervor
	i_type = "Armor"

/datum/anvil_recipe/armor/kettle
	name = "Kettle"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/kettle
	i_type = "Armor"

/datum/anvil_recipe/armor/winged
	name = "Winged cap"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/winged
	i_type = "Armor"

/datum/anvil_recipe/armor/horned
	name = "Horned cap"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/horned
	i_type = "Armor"

/datum/anvil_recipe/armor/helmetsall
	name = "Sallet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/sallet
	i_type = "Armor"

/datum/anvil_recipe/armor/helmetsallv
	name = "Sallet Visored (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/sallet/visored
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/helmetbuc
	name = "Bucket Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/helmetpig
	name = "Bascinet Pigface Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/helmetbars
	name = "Barred Bascinet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/helmetbars
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/bascinet
	name = "Bascinet Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/bascinet
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/heavy/beakhelmet
	name = "Beak Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/beakhelmet
	craftdiff = 2
	i_type = "Armor"	

/datum/anvil_recipe/armor/helmetknight
	name = "Knight's Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/knight
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/plateironboot
	name = "Iron Plated Boots"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/shoes/roguetown/boots/armoriron
	i_type = "Armor"

/datum/anvil_recipe/armor/platesteelboot
	name = "Steel Plated Boots"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor
	i_type = "Armor"

/datum/anvil_recipe/armor/platemask/steel
	name = "Mask"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/mask/rogue/facemask/steel
	i_type = "Armor"

/datum/anvil_recipe/armor/astratahelm
	name = "Astrata Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/astratahelm
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/eorahelm
	name = "Eora Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/eorahelm
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/necrahelm
	name = "Necra Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/necrahelm
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/nochelm
	name = "Noc Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/nochelm
	craftdiff = 2
	i_type = "Armor"

/datum/anvil_recipe/armor/dendorhelm
	name = "Dendor Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/dendorhelm
	craftdiff = 2
	i_type = "Armor"
