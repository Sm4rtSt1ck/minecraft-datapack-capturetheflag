function ctf:match/helpers/summon_flag {target: '@s[nbt={Inventory:[{id:"minecraft:yellow_banner"}]}]'}
clear @s yellow_banner

scoreboard players reset @s ultimate

tag @s add ultimate

execute if score @s ultimate_category matches 1 run function ctf:match/events/ultimate/categories/ghost
execute if score @s ultimate_category matches 2 run function ctf:match/events/ultimate/categories/scale
execute if score @s ultimate_category matches 3 run function ctf:match/events/ultimate/categories/trident
execute if score @s ultimate_category matches 4 run function ctf:match/events/ultimate/categories/bomber
