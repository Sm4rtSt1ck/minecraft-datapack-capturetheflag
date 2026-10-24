# Tag ctf.can.ammo_<type>: the player has the weapon and less than max ammo. type, below (= max - 1)
$tag @s remove ctf.can.ammo_$(type)
$function ctf_inv:limits/count {pred: '*[custom_data~{wpn:"$(type)"}]'}
execute if score #n inv.tmp matches ..0 run return 0
$function ctf_inv:limits/count {pred: '*[custom_data~{ammo:"$(type)"}]'}
$execute if score #n inv.tmp matches ..$(below) run tag @s add ctf.can.ammo_$(type)
