# Ammo without its weapon is dropped (it leaves together with the dropped weapon),
# ammo above max is dropped too. type, max
$function ctf_inv:limits/count {pred: '*[custom_data~{wpn:"$(type)"}]'}
scoreboard players operation #w inv.tmp = #n inv.tmp
$execute if score #w inv.tmp matches 1.. run function ctf_inv:limits/one {pred: '*[custom_data~{ammo:"$(type)"}]', max: $(max)}
$execute if score #w inv.tmp matches ..0 run function ctf_inv:limits/one {pred: '*[custom_data~{ammo:"$(type)"}]', max: 0}
