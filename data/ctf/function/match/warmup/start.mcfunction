function admin:log/function {name: "match/warmup/start"}

gamerule fallDamage true

scoreboard objectives setdisplay sidebar kills

# Warmup game state
scoreboard players set game state 2
bossbar set ctf:match name {"text": "WARM-UP", "color": "green"}

# 30 secs warmup timer (600 ticks)
scoreboard players set warmup timer 600
bossbar set ctf:match max 600
title @a[tag=!lobby] title {"text":"WARM-UP", "color": "green"}
title @a[tag=!lobby] subtitle {"text":"30 seconds", "color": "yellow"}

gamemode adventure @a[tag=player]

tp @a[tag=attack] -87 -51 27 -90 0
tp @a[tag=defense] -74 -51 26 90 0

execute as @a[tag=attack] positioned as @s run spawnpoint @s ~ ~ ~ -90
execute as @a[tag=defense] positioned as @s run spawnpoint @s ~ ~ ~ 90

gamerule keepInventory true

item replace entity @a[tag=defense] weapon.offhand with firework_rocket[fireworks={explosions:[{shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"}]}] 64
item replace entity @a[tag=attack] weapon.offhand with firework_rocket[fireworks={explosions:[{shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"}]}] 64
give @a[tag=player] crossbow[custom_name='{"text":"Firework shooter", "italic": false, "color": "red"}']
give @a[tag=player] minecraft:stone_sword
