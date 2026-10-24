# Runs as a buffer with a reward
execute store result score #o inv.tmp run data get entity @s Item.components."minecraft:custom_data".ctf_owner
tag @s add ctf.returning
execute as @e[type=marker, tag=ctf.loot_box] run function ctf_inv:owned/find_box
execute if entity @s[tag=ctf.returning] run function ctf_inv:stash/drop
tag @s remove ctf.returning
