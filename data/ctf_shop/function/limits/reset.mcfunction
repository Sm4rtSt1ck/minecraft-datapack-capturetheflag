# Freeze start: the round limits count the items the player already carries
function ctf_inv:limits/enforce
function ctf_inv:limits/count {pred: '*[custom_data~{tags:["he_grenade"]}]'}
scoreboard players operation @s shop.lim.he = #n inv.tmp
function ctf_inv:limits/count {pred: 'totem_of_undying'}
scoreboard players operation @s shop.lim.totem = #n inv.tmp
function ctf_inv:limits/count {pred: 'shield'}
scoreboard players operation @s shop.lim.shield = #n inv.tmp
function ctf_inv:limits/count {pred: 'potion[custom_data~{lim:"regen"}]'}
scoreboard players operation @s shop.lim.regen = #n inv.tmp
function ctf_inv:limits/count {pred: 'potion[custom_data~{lim:"speed"}]'}
scoreboard players operation @s shop.lim.speed = #n inv.tmp
function ctf_inv:limits/count {pred: 'chorus_fruit'}
scoreboard players operation @s shop.lim.chorus = #n inv.tmp
function ctf_inv:limits/count {pred: '*[custom_data~{tags:["smoke_grenade"]}]'}
scoreboard players operation @s shop.lim.smoke = #n inv.tmp
