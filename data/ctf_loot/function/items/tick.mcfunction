# Run every tick (ctf_loot:tick): reward items in the world
execute as @e[type=armor_stand, tag=ctf.wall] at @s run particle minecraft:dust{color:[0.45, 0.3, 0.15], scale: 0.6} ~ ~1 ~ 0.25 0.5 0.25 0 1 force @a[tag=!lobby]

execute as @e[type=armor_stand, tag=ctf.stun] at @s run function ctf_loot:reward/stun/tick
execute as @a[scores={loot.stun=1..}] run function ctf_loot:reward/stun/victim_tick

execute as @e[type=marker, tag=ctf.fire_zone] at @s run function ctf_loot:reward/inferno/zone

function ctf_loot:reward/creep/tick
scoreboard players remove @a[scores={loot.cd=1..}] loot.cd 1
execute as @a[scores={loot.cd=0}] at @s run function ctf_loot:reward/inferno/ready
