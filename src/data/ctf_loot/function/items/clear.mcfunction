# End of the round (end_round ends), start of freeze: walls, stun traps and fire areas are removed
kill @e[type=armor_stand, tag=ctf.wall]
kill @e[type=armor_stand, tag=ctf.stun]
execute as @e[type=marker, tag=ctf.fire_zone] at @s run function ctf_loot:reward/inferno/zone_end
execute as @a[scores={loot.stun=1..}] run attribute @s minecraft:jump_strength modifier remove ctf_loot:stun
scoreboard players reset * loot.stun
scoreboard players reset * loot.cd
