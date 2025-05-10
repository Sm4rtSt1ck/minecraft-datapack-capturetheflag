say match/warmup/start

scoreboard objectives setdisplay sidebar kills

# Warmup game status
scoreboard players set game status 2
bossbar set ctf:match name {"text": "WARM-UP", "color": "green"}

# 30 secs warmup timer (600 ticks)
scoreboard players set warmup timer 600
bossbar set ctf:match max 600
title @a[tag=!lobby] title {"text":"WARM-UP", "color": "green"}
title @a[tag=!lobby] subtitle {"text":"30 seconds", "color": "yellow"}

effect clear @a[tag=player]
effect give @a[tag=player] minecraft:saturation infinite 127 true

gamemode adventure @a[tag=player]

tp @a[tag=attack] -87 -51 27 -90 0
tp @a[tag=defense] -74 -51 26 90 0

execute as @a positioned as @s run spawnpoint @s

gamerule keepInventory true

give @a[tag=player] minecraft:stone_sword
