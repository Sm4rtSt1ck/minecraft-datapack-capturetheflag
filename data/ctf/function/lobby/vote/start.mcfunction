scoreboard players operation game state = vote state
scoreboard objectives setdisplay sidebar map_vote_player

scoreboard players set vote timer 600
bossbar set ctf:match max 600
bossbar set ctf:match visible true
bossbar set ctf:match name {"text": "VOTE", "color": "green", "bold": true}
bossbar set ctf:match players @a[tag=lobby]

title @a title {"text": "VOTING BEGINS", "color": "gold"}
title @a subtitle {"text": "select the map", "color": "gold"}

scoreboard players reset * map_vote_player
tag @a remove voted

#########################################
# FIX THE BUG WITH MAPS DISPLAY

item replace entity @a[tag=lobby] container.10 with filled_map[map_id=0]
item replace entity @a[tag=lobby] container.11 with filled_map[map_id=1]
item replace entity @a[tag=lobby] container.12 with filled_map[map_id=2]
item replace entity @a[tag=lobby] container.13 with filled_map[map_id=3]
item replace entity @a[tag=lobby] container.14 with filled_map[map_id=4]
item replace entity @a[tag=lobby] container.15 with filled_map[map_id=5]
item replace entity @a[tag=lobby] container.16 with filled_map[map_id=6]
item replace entity @a[tag=lobby] container.17 with filled_map[map_id=7]
item replace entity @a[tag=lobby] container.18 with filled_map[map_id=8]
item replace entity @a[tag=lobby] container.19 with filled_map[map_id=9]

schedule function ctf:lobby/clear_maps 60t
