# As a bot at the start of freeze (like a player in ctf:match/freeze/start): asleep until the round,
# full health (no regeneration: a zombified piglin is undead), no fire, effects cleared, resistance; the missing
# armor / sword
data merge entity @s {NoAI: 1b, Health: 20.0f, Fire: 0s}
effect clear @s
# The game treats it as a player (the tag player: the selectors @e[type=#ctf:fighter, tag=player] of the
# traps, grenades, ultimates, loot...); no burning / withering left (ctf_bots:internal/body)
tag @s add player
scoreboard players set @s bot.fire 0
scoreboard players set @s bot.wth 0
function ctf_bots:internal/spawn/body
tag @s remove bot_carrier
# The main weapon in the hand, nothing being aimed
tag @s remove bot_shoot
function ctf_bots:internal/combat/hold_melee
scoreboard players set @s bot.cd 0
scoreboard players set @s bot.aim 0
effect give @s minecraft:resistance infinite 127 true
execute if entity @s[tag=attack] run function ctf_bots:internal/equip_attack
execute if entity @s[tag=defense] run function ctf_bots:internal/equip_defense
# A free wind charge every round (soft landings, wind charge jumps: ctf_bots:internal/nav), up to the
# shop limit
function ctf_bots:internal/free_wind
# Its trait for the match (ctf_bots:internal/trick)
function ctf_bots:internal/trick/my_trait
