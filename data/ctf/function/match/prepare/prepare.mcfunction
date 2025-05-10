say match/prepare/prepare

title @a[tag=player] subtitle {"text":"Preparing the map...", "color": "yellow"}

kill @e[tag=clone_marker]
execute if score @r[tag=admin] map_vote matches 1 positioned as @n[tag=map_marker, tag=map_1] run summon armor_stand ~ ~ ~ {Marker:true, Tags:["clone_marker"]}
execute if score @r[tag=admin] map_vote matches 2 positioned as @n[tag=map_marker, tag=map_2] run summon armor_stand ~ ~ ~ {Marker:true, Tags:["clone_marker"]}

execute positioned as @e[tag=clone_marker] run forceload add ~ ~ ~127 ~127

execute if score @r[tag=admin] map_vote matches 1 run function ctf:match/map/map_1/prepare
execute if score @r[tag=admin] map_vote matches 2 run function ctf:match/map/map_2/prepare

schedule function ctf:match/prepare/clone 20t
