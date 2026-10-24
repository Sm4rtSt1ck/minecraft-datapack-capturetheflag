kill @e[type=potion, tag=ctf.smoke_new]
execute at @s run kill @e[type=marker, tag=ctf.smoke_fly, distance=..5]
function ctf_inv:give/smoke {count: 1}
tellraw @s {"text": "You cannot use this now!", "color": "red"}
