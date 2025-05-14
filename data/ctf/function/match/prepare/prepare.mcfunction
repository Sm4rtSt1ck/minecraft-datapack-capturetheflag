say match/prepare/prepare

title @a[tag=player] subtitle {"text":"Preparing the map...", "color": "yellow"}

kill @e[tag=clone_marker]
execute if score @r[tag=admin] map_vote matches 1 run function ctf:match/maps/test_map/prepare
execute if score @r[tag=admin] map_vote matches 2 run function ctf:match/maps/green_mine/prepare
execute if score @r[tag=admin] map_vote matches 3 run function ctf:match/maps/night_club/prepare

schedule function ctf:match/prepare/prepare_2 20t
