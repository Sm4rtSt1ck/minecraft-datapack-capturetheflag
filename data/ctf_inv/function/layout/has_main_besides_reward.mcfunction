# 1 if the player has a reward main weapon AND another main weapon (the golden sword doesn't count)
execute unless items entity @s container.* *[custom_data~{ctf_bound:1b, tags:["main weapon"]}] unless items entity @s player.cursor *[custom_data~{ctf_bound:1b, tags:["main weapon"]}] run return 0
function ctf_inv:limits/count {pred: '*[custom_data~{tags:["main weapon"]}, !custom_data~{ctf_bound:1b}]'}
scoreboard players operation #m inv.tmp = #n inv.tmp
function ctf_inv:limits/count {pred: 'golden_sword[custom_data~{tags:["main weapon"]}]'}
scoreboard players operation #m inv.tmp -= #n inv.tmp
execute if score #m inv.tmp matches 1.. run return 1
return 0
