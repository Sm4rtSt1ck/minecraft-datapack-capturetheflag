# Which ammo the player may pick up: only for his weapon and below max
function ctf_inv:ammo/cap {type: "bow", below: 29}
function ctf_inv:ammo/cap {type: "fire_bow", below: 23}
function ctf_inv:ammo/cap {type: "punch_bow", below: 23}
function ctf_inv:ammo/cap {type: "rifle", below: 89}
function ctf_inv:ammo/cap {type: "sniper", below: 19}
function ctf_inv:ammo/cap {type: "crossbow", below: 4}

# Wind charges: at most 10 in the inventory
tag @s remove ctf.can.wind
function ctf_inv:limits/count {pred: 'wind_charge'}
execute if score #n inv.tmp matches ..9 if entity @s[tag=ctf.can.off] run tag @s add ctf.can.wind
execute if score #n inv.tmp matches 1..9 run tag @s add ctf.can.wind
