say match/round/start

scoreboard players set game status 4
# Round timer 180 secs (3600 ticks)
scoreboard players set round timer 3600
bossbar set ctf:match max 3600

title @a[tag=attack] title {"text": "STEAL THE FLAG!", "color": "green"}
title @a[tag=defense] title {"text": "DEFEND THE FLAG!", "color": "green"}
execute as @a[tag=player] at @s run playsound minecraft:entity.player.levelup ambient @s ~ ~ ~ 10 1

scoreboard players set @a[tag=player] flag_broken 0
scoreboard players set @a[tag=player] wall_flag_broken 0
scoreboard players set @a[tag=player] flag_pickedup 0

gamemode adventure @a[tag=defense]

effect clear @a[tag=player] minecraft:regeneration
effect clear @a[tag=defense] minecraft:mining_fatigue

# If flag is not set (inventory or dropped) -> attack wins
execute if entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:yellow_banner"}]}] run function ctf:match/round/win_attack
execute if entity @e[type=item, nbt={Item:{id:"minecraft:yellow_banner"}}] run function ctf:match/round/win_attack

function ctf:match/map/map_1/round
