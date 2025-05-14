say match/round/start

scoreboard players set game status 4
# Round timer 180 secs (3600 ticks)
scoreboard players set round timer 3600
bossbar set ctf:match max 3600

gamerule fallDamage true

title @a[tag=attack] title {"text": "STEAL THE FLAG!", "color": "green"}
title @a[tag=defense] title {"text": "DEFEND THE FLAG!", "color": "green"}
execute as @a[tag=!lobby] at @s run playsound minecraft:entity.firework_rocket.launch ambient @s ~ ~ ~ 10 1

scoreboard players set @a[tag=player] flag_broken 0
scoreboard players set @a[tag=player] wall_flag_broken 0
scoreboard players set @a[tag=player] flag_pickedup 0

gamemode adventure @a[tag=defense]

effect clear @a[tag=player] minecraft:resistance
effect clear @a[tag=defense] minecraft:mining_fatigue

# If flag is not set (inventory or dropped) -> attack wins
# execute if entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:yellow_banner"}]}] run function ctf:match/round/win_attack
# execute if entity @e[type=item, nbt={Item:{id:"minecraft:yellow_banner"}}] run function ctf:match/round/win_attack
execute unless entity @e[type=armor_stand, tag=flag] run function ctf:match/round/win_attack

execute if score @r[tag=admin] map_vote matches 1 run function ctf:match/maps/test_map/round
execute if score @r[tag=admin] map_vote matches 2 run function ctf:match/maps/green_mine/round
execute if score @r[tag=admin] map_vote matches 3 run function ctf:match/maps/night_club/round
