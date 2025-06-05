#########################################
# TELEPORT

execute in minecraft:overworld run tp @s 0 -40 0 90 0
spreadplayers 0.5 0.5 1 1 under -40 false @s

#########################################
# TAGS

tag @s add lobby
tag @s remove player
tag @s remove spectator
tag @s remove attack
tag @s remove defense
tag @s remove dead
tag @s remove just_used_totem
tag @s remove just_died
tag @s remove just_killed

#########################################
# OTHER PLAYER SETTINGS

function ctf:match/events/ultimate/stop
# ONLY AFTER ULTIMATE STOPPING
clear @s
team join lobby @s
gamemode adventure @s
execute positioned as @s run spawnpoint @s

#########################################
# EFFECTS

effect clear @s
effect give @s minecraft:regeneration 1 127 true
effect give @s minecraft:resistance infinite 127 true
effect give @s minecraft:jump_boost infinite 1 true
effect give @s minecraft:speed infinite 0 true
effect give @s minecraft:saturation infinite 127 true

#########################################
# FIX BUG WITH MAPS DISPLAY

item replace entity @s container.10 with filled_map[map_id=0]
item replace entity @s container.11 with filled_map[map_id=1]
item replace entity @s container.12 with filled_map[map_id=2]
item replace entity @s container.13 with filled_map[map_id=3]
item replace entity @s container.14 with filled_map[map_id=4]
item replace entity @s container.15 with filled_map[map_id=5]
item replace entity @s container.16 with filled_map[map_id=6]
item replace entity @s container.17 with filled_map[map_id=7]
item replace entity @s container.18 with filled_map[map_id=8]
item replace entity @s container.19 with filled_map[map_id=9]

schedule function ctf:lobby/clear_maps 60t

#########################################
# OTHER

stopsound @s
execute if score music settings matches 1 run playsound minecraft:music_disc.relic ambient @s 0 1000 0 80 2
execute at @s run playsound entity.firework_rocket.launch ambient @s ~ ~ ~ 1 1
execute at @s run particle minecraft:firework ~ ~1 ~ 0.1 0.1 0.1 0.07 15 normal
