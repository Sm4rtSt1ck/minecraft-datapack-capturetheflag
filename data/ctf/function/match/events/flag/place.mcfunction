scoreboard players set @s flag_placed 0

execute at @s run summon minecraft:armor_stand ^ ^ ^ {Tags:["flag"], Invisible:true, Invulnerable:true, Marker:true}

execute if score freeze timer matches 202.. run scoreboard players set freeze timer 201
title @a[tag=!lobby] subtitle {"text": "THE FLAG HAS BEEN PLACED", "color": "green"}


function ctf:match/events/flag/place/find_position
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air if block ~ ~-2 ~ air run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 air replace yellow_wall_banner
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air if block ~ ~-2 ~ air run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 air replace yellow_banner
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air if block ~ ~-2 ~ air run function ctf:match/events/flag/place/fall_loop
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air if block ~ ~-2 ~ air if score freeze timer matches ..60 run title @a[tag=!lobby] subtitle {"text": "THE FLAG IS BEING PLACED"}
