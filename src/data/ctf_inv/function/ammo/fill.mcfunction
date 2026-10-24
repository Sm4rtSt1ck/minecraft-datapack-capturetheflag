# Fills the ammo of a weapon up to max, if the player has this weapon. type, max
$function ctf_inv:limits/count {pred: '*[custom_data~{wpn:"$(type)"}]'}
execute if score #n inv.tmp matches ..0 run return 0
$function ctf_inv:limits/count {pred: '*[custom_data~{ammo:"$(type)"}]'}
$scoreboard players set #m inv.tmp $(max)
scoreboard players operation #m inv.tmp -= #n inv.tmp
execute if score #m inv.tmp matches ..0 run return 0
execute store result storage ctf_inv:tmp ammo.count int 1 run scoreboard players get #m inv.tmp
$function ctf_inv:ammo/give/$(type) with storage ctf_inv:tmp ammo
