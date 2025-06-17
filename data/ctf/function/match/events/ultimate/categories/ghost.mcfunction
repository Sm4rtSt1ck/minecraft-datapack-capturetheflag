scoreboard players set @s timer 200


function ctf:match/helpers/save_inventory
clear @s

tag @s add invisible

effect give @s minecraft:invisibility infinite 1 true
effect give @s minecraft:speed infinite 1 true
effect give @s minecraft:weakness infinite 127 true
effect give @s minecraft:resistance infinite 127 true
