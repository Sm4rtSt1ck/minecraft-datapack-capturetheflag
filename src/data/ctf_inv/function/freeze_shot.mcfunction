scoreboard players reset @s bow_used
scoreboard players reset @s xbow_used
title @s actionbar {"text": "You can't shoot now", "color": "red"}
function ctf_inv:ammo/fill_all
execute if items entity @s weapon.mainhand bow[custom_data~{wpn: "creep"}] run function ctf_loot:reward/creep/refund
