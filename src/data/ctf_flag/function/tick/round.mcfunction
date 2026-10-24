# #ctf:tick/round: blindness near the flag
execute at @e[type=armor_stand, tag=flag] run effect give @a[tag=attack, distance=..5] minecraft:darkness 2 1 true
execute at @e[type=armor_stand, tag=flag] run particle minecraft:white_smoke ~ ~0.8 ~ 0.3 0.6 0.3 0.01 5 normal
