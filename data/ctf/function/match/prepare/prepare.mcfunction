function admin:log/function {name: "match/prepare/prepare"}

title @a[tag=!lobby] subtitle {"text":"Preparing the map...", "color": "yellow"}

stopsound @a[tag=!lobby]

kill @e[tag=clone_marker]
execute if score result map_vote matches 1 run function ctf:match/maps/test_map/prepare
execute if score result map_vote matches 2 run function ctf:match/maps/green_mine/prepare
execute if score result map_vote matches 3 run function ctf:match/maps/night_club/prepare
execute if score result map_vote matches 4 run function ctf:match/maps/farm/prepare
execute if score result map_vote matches 5 run function ctf:match/maps/railway_station/prepare

schedule function ctf:match/prepare/prepare_2 20t
