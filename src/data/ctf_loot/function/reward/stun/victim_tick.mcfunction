scoreboard players remove @s loot.stun 1
execute if score @s loot.stun matches 1.. run return 0
attribute @s minecraft:jump_strength modifier remove ctf_loot:stun
scoreboard players reset @s loot.stun
