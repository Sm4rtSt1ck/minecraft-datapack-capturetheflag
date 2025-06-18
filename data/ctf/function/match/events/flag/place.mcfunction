scoreboard players set @s flag_placed 0

# execute at @s run summon minecraft:armor_stand ^ ^ ^ {Tags:["flag"], Invisible:true, Invulnerable:true, Marker:true}

execute if score freeze timer matches 202.. run scoreboard players set freeze timer 201
title @a[tag=!lobby] subtitle {"text": "THE FLAG HAS BEEN PLACED", "color": "blue"}

execute as @e[type=armor_stand,tag=flag] positioned as @s unless block ~ ~-1 ~ air run function ctf:match/events/flag/place/place_fallen
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air run function ctf:match/events/flag/place/fall_loop
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air if score freeze timer matches ..60 run title @a[tag=!lobby] subtitle {"text": "THE FLAG IS BEING PLACED"}
