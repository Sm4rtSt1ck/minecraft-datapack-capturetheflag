# Runs as the marker following a flying smoke grenade
execute if entity @e[type=potion, tag=ctf.smoke_potion, distance=..6] run return run tp @s @n[type=potion, tag=ctf.smoke_potion]

# The grenade broke: the smoke appears where it was last seen
summon marker ~ ~ ~ {Tags:["ctf.smoke", "ctf.smoke_new"]}
scoreboard players set @e[type=marker, tag=ctf.smoke_new] smoke.t 400
tag @e[type=marker, tag=ctf.smoke_new] remove ctf.smoke_new
playsound minecraft:block.fire.extinguish neutral @a[tag=!lobby] ~ ~ ~ 2 0.6
playsound minecraft:entity.generic.extinguish_fire neutral @a[tag=!lobby] ~ ~ ~ 2 0.5
kill @s
