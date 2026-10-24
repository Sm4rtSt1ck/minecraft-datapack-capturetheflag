# function admin:log/function {name: "match/round/start"}

scoreboard players operation game state = round state
# Round timer 180 secs (3600 ticks)
scoreboard players set round timer 3600
bossbar set ctf:match max 3600

gamerule fallDamage true

title @a[tag=attack] title {"text": "STEAL THE FLAG!", "color": "red"}
title @a[tag=defense] title {"text": "DEFEND THE FLAG!", "color": "blue"}
execute as @a[tag=!lobby] at @s run playsound minecraft:entity.firework_rocket.launch ambient @s ~ ~ ~ 10 1

gamemode adventure @a[tag=defense]

effect clear @a[tag=player] minecraft:resistance
effect clear @a[tag=defense] minecraft:mining_fatigue

kill @e[type=arrow]

# Modules: inventory slots 9-35 are locked, chorus fruits become edible, loot crates disappear,
# the map borders open
function #ctf:on/round_start

# If flag is not set (inventory or dropped) -> attack wins
execute unless entity @e[type=armor_stand, tag=flag] run function ctf:match/round/win_attack
