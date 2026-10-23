effect give @s minecraft:slowness 3 6 true
effect give @s minecraft:weakness 3 255 true
effect give @s minecraft:mining_fatigue 3 255 true
effect give @s minecraft:nausea 4 0 true
attribute @s minecraft:jump_strength modifier remove ctf_loot:stun
attribute @s minecraft:jump_strength modifier add ctf_loot:stun -1 add_multiplied_total
scoreboard players set @s loot.stun 60
