scoreboard players set @s flag_placed 0

# execute at @s run summon minecraft:armor_stand ^ ^ ^ {Tags:["flag"], Invisible:true, Invulnerable:true, Marker:true}

execute if score freeze timer matches 202.. run scoreboard players set freeze timer 201
title @a[tag=!lobby] subtitle {"text": "THE FLAG HAS BEEN PLACED", "color": "blue"}

execute positioned as @e[type=armor_stand,tag=flag, tag=!placed] if block ~ ~ ~ short_grass run setblock ~ ~ ~ air
execute positioned as @e[type=armor_stand,tag=flag, tag=!placed] if block ~ ~ ~ tall_grass run setblock ~ ~ ~ air
execute positioned as @e[type=armor_stand,tag=flag, tag=!placed] if block ~ ~ ~ #crops run setblock ~ ~ ~ air
execute positioned as @e[type=armor_stand,tag=flag, tag=!placed] if block ~ ~ ~ #flowers run setblock ~ ~ ~ air
execute as @e[type=armor_stand,tag=flag, tag=!placed] positioned as @s unless block ~ ~-1 ~ air run function ctf:match/events/flag/place/place_fallen
execute positioned as @e[type=armor_stand,tag=flag, tag=!placed] if block ~ ~-1 ~ air run function ctf:match/events/flag/place/fall_loop
execute positioned as @e[type=armor_stand,tag=flag, tag=!placed] if block ~ ~-1 ~ air if score freeze timer matches ..60 run title @a[tag=!lobby] subtitle {"text": "THE FLAG IS BEING PLACED", "color": "yellow"}
