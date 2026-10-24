scoreboard players remove freeze timer 1
execute store result bossbar ctf:match value run scoreboard players get freeze timer

execute if score freeze timer matches 200 run title @a[tag=!lobby] title {"text": "10 SECONDS LEFT", "color": "green"}
execute if score freeze timer matches 200 as @a[tag=!lobby] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.4
execute if score freeze timer matches 60 run title @a[tag=!lobby] title {"text": "❸", "color": "red"}
execute if score freeze timer matches 60 as @a[tag=!lobby] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.6
execute if score freeze timer matches 40 run title @a[tag=!lobby] title {"text": "❷", "color": "gold"}
execute if score freeze timer matches 40 as @a[tag=!lobby] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.8
execute if score freeze timer matches 20 run title @a[tag=!lobby] title {"text": "❶", "color": "green"}
execute if score freeze timer matches 20 as @a[tag=!lobby] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 1

execute as @a[scores={flag_placed=1..}] run function ctf:match/events/flag/place
execute as @a[scores={just_placed_trap=1..}] run function ctf:match/events/traps/place
execute as @a[scores={just_used_chorus=1..}] run function ctf:match/events/misc/chorus/chorus
execute as @a[scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data={tags:["trap", "detector"]}] run function ctf:match/events/traps/detector/place
execute as @e[type=armor_stand, tag=trap_display] positioned as @s unless entity @n[type=frog, tag=trap_marker, distance=1.2..1.5] run kill @s

# Grenades
execute as @a[scores={just_threw_grenade=1..}] run function ctf:match/events/grenades/throw
execute as @a[scores={just_threw_smoke=1..}] run function ctf:match/events/grenades/smoke/throw
function ctf:match/events/grenades/smoke/tick
execute as @e[type=armor_stand, tag=he_grenade] run function ctf:match/events/grenades/fly

# ATTACK TEAM TRAPS
function ctf:match/events/traps/detector/trigger

# ULTIMATE
execute as @a[tag=player, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data~{action:"ultimate"}] run function ctf:match/events/ultimate/check_points

function ctf_shop:tick
function ctf_sniper:tick
function ctf_guns:tick
# Bows and crossbows can't shoot
function ctf_inv:freeze_shots

# Exit button in the crafting grid
execute as @a[tag=player, gamemode=!spectator] run function ctf_inv:exit/tick

# Hotbar layout and items on the ground
function ctf_inv:tick

execute if score freeze timer matches -2147483648..0 run function ctf:match/round/start
