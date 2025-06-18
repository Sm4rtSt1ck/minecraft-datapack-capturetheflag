function admin:log/function {name: "match/warmup/start"}

#########################################
# GLOBAL SETTINGS

gamerule fallDamage true
gamerule keepInventory true

gamemode adventure @a[tag=player]

# Warmup game state
scoreboard players operation game state = warmup state

# 30 secs warmup timer (600 ticks)
scoreboard players set warmup timer 600
bossbar set ctf:match max 600

#########################################
# VISUAL

bossbar set ctf:match name {"text": "WARM-UP", "color": "green", "bold": true}

title @a[tag=!lobby] title {"text":"WARM-UP", "color": "green"}
title @a[tag=!lobby] subtitle {"text":"30 seconds", "color": "yellow"}

#########################################
# PLAYER

tp @a[tag=attack] -87 -51 27 -90 0
tp @a[tag=defense] -74 -51 26 90 0

execute as @a[tag=attack] positioned as @s run spawnpoint @s ~ ~ ~ -90
execute as @a[tag=defense] positioned as @s run spawnpoint @s ~ ~ ~ 90

effect give @a[tag=player] minecraft:resistance 1 127 true

#########################################
# GIVE ITEMS

# Weapons
item replace entity @a[tag=defense] weapon.offhand with firework_rocket[fireworks={explosions:[{shape:"small_ball",colors:[I;1114367],fade_colors:[I;48127]},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"}]}] 64
item replace entity @a[tag=attack] weapon.offhand with firework_rocket[fireworks={explosions:[{shape:"small_ball",colors:[I;16714250],fade_colors:[I;16711850]},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"},{shape:"small_ball"}]}] 64
item replace entity @a[tag=player] hotbar.0 with crossbow[custom_name='{"text":"Firework shooter", "italic": false, "color": "red"}']
item replace entity @a[tag=player] hotbar.1 with minecraft:stone_sword

# Menu items
item replace entity @a[tag=player] hotbar.7 with carrot_on_a_stick[minecraft:custom_data={action:"skip"}, item_model=nether_star, custom_name='[{"text":"SKIP WARM-UP (all players need to click) [", "color": "gold", "bold": true, "italic": false}, {"keybind":"key.use"}, {"text": "]"}]']
item replace entity @a[tag=player] hotbar.8 with carrot_on_a_stick[minecraft:custom_data={action:"exit"}, item_model=red_bed, custom_name='[{"text":"EXIT TO LOBBY [", "color": "red", "bold": true, "italic": false}, {"keybind":"key.use"}, {"text": "]"}]']
