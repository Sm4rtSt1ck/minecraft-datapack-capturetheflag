# Every tick (ctf_bots:tick/combat): what the game does to a player but the bot's body ignores, played
# for it (registry/bots.bolt BODY_FX). A zombified piglin is undead: the wither trap cloud's wither
# effect doesn't take (bot.wth); it is fire-immune: fire blocks, lava, fire aspect hits and burning
# arrows (ctf_bots:burn_hit / burn_arrow) don't burn it (bot.fire). A sleeping or climbing bot is NoAI
# (no physics): levitation wakes it, so it floats up like a player
from registry:bots import BODY_FX
execute as @e[type=area_effect_cloud, tag=trap.wither_cloud] at @s as @e[type=zombified_piglin, tag=ctf_bot, distance=..2.5] run scoreboard players set @s bot.wth (BODY_FX["wither"])
execute as @e[type=zombified_piglin, tag=ctf_bot, scores={bot.wth=1..}] at @s run function ctf_bots:internal/body/wither
execute as @e[type=zombified_piglin, tag=ctf_bot] at @s if block ~ ~ ~ #ctf_bots:burning run function ctf_bots:internal/body/in_fire
execute as @e[type=zombified_piglin, tag=ctf_bot, scores={bot.fire=1..}] at @s run function ctf_bots:internal/body/burn
execute as @e[type=zombified_piglin, tag=bot_guard] if predicate {condition: "minecraft:entity_properties", entity: "this", predicate: {effects: {"minecraft:levitation": {}}}} run function ctf_bots:internal/brain/unguard
execute as @e[type=zombified_piglin, tag=bot_climb] if predicate {condition: "minecraft:entity_properties", entity: "this", predicate: {effects: {"minecraft:levitation": {}}}} run function ctf_bots:internal/climb/stop
