# As a bot at the start of freeze (like a player in ctf:match/freeze/start): asleep until the round,
# full health (no regeneration: a husk is undead), no fire, effects cleared, resistance; the missing
# armor / sword
data merge entity @s {NoAI: 1b, Health: 20.0f, Fire: 0s}
effect clear @s
effect give @s minecraft:resistance infinite 127 true
execute if entity @s[tag=attack] run function ctf_bots:internal/equip_attack
execute if entity @s[tag=defense] run function ctf_bots:internal/equip_defense
