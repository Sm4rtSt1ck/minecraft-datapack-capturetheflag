# Runs as a thrown potion (once): is it a smoke grenade? (NBT check only once per potion)
tag @s add ctf.smoke_checked
execute unless data entity @s Item.components."minecraft:custom_data"{tags:["smoke_grenade"]} run return 0
tag @s add ctf.smoke_potion
tag @s add ctf.smoke_new
execute at @s run summon marker ~ ~ ~ {Tags:["ctf.smoke_fly"]}
