# function admin:log/function {name: "match/round/start"}

scoreboard players operation game state = round state
# Round timer 180 secs (3600 ticks)
scoreboard players set round timer 3600
bossbar set ctf:match max 3600

gamerule fallDamage true

title @a[tag=attack] title {"text": "STEAL THE FLAG!", "color": "red"}
title @a[tag=defense] title {"text": "DEFEND THE FLAG!", "color": "blue"}
execute as @a[tag=!lobby] at @s run playsound minecraft:entity.firework_rocket.launch ambient @s ~ ~ ~ 10 1

scoreboard players set @a[tag=player] flag_broken 0
scoreboard players set @a[tag=player] wall_flag_broken 0
scoreboard players set @a[tag=player] flag_pickedup 0
scoreboard players set @a[tag=player] just_threw_grenade 0

gamemode adventure @a[tag=defense]

# Lock inventory slots 9-35
execute as @a[tag=player] run function ctf_shop:lock
# Chorus fruits become edible
execute as @a[tag=player] at @s run function ctf_inv:limits/normalize_chorus
execute as @a[tag=player] run function ctf:match/events/ultimate/render
execute as @a[tag=player] run function ctf_inv:api/refresh

effect clear @a[tag=player] minecraft:resistance
effect clear @a[tag=defense] minecraft:mining_fatigue

kill @e[type=arrow]

# If flag is not set (inventory or dropped) -> attack wins
# execute if entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:magenta_banner"}]}] run function ctf:match/round/win_attack
# execute if entity @e[type=item, nbt={Item:{id:"minecraft:magenta_banner"}}] run function ctf:match/round/win_attack
execute unless entity @e[type=armor_stand, tag=flag] run function ctf:match/round/win_attack

# Loot crates disappear
function ctf_loot:round_start

function ctf:match/maps/call_current {function: "round"}
