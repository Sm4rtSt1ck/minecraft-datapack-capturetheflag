# #ctf:on/round_start: the bots wake up, the resistance of freeze ends (like the players)
execute as @e[type=husk, tag=ctf_bot] run data merge entity @s {NoAI: 0b}
effect clear @e[type=husk, tag=ctf_bot] minecraft:resistance
