# 1 if the player has a reward secondary weapon AND another secondary weapon
execute unless items entity @s container.* *[custom_data~{ctf_bound:1b, tags:["secondary weapon"]}] unless items entity @s player.cursor *[custom_data~{ctf_bound:1b, tags:["secondary weapon"]}] run return 0
function ctf_inv:limits/count {pred: '*[custom_data~{tags:["secondary weapon"]}, !custom_data~{ctf_bound:1b}]'}
execute if score #n inv.tmp matches 1.. run return 1
return 0
