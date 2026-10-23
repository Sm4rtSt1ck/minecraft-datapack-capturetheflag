# 1 if the player already owns a main weapon (the default golden sword doesn't count: it is replaced)
function ctf_inv:limits/count {pred: '*[custom_data~{tags:["main weapon"]}]'}
scoreboard players operation #m inv.tmp = #n inv.tmp
function ctf_inv:limits/count {pred: 'golden_sword[custom_data~{tags:["main weapon"]}]'}
scoreboard players operation #m inv.tmp -= #n inv.tmp
execute if score #m inv.tmp matches 1.. run return 1
return 0
