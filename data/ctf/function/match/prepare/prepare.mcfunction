say match/prepare/prepare

title @a[tag=player] subtitle {"text":"Preparing the map...", "color": "yellow"}

kill @e[tag=clone_marker]
execute if score @r[tag=admin] map_vote matches 1 run function ctf:match/map/map_1/prepare
execute if score @r[tag=admin] map_vote matches 2 run function ctf:match/map/map_2/prepare

schedule function ctf:match/prepare/prepare_2 20t
