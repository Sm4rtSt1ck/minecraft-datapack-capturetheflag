scoreboard players set @s flag_placed 0

execute at @s run summon minecraft:armor_stand ^ ^ ^ {Tags:["flag"], Invisible:true, Invulnerable:true, Marker:true}

execute if score freeze timer matches 200.. run scoreboard players set freeze timer 200


function ctf:match/helpers/find_flag_position
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air if block ~ ~-2 ~ air run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 air replace yellow_wall_banner
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air if block ~ ~-2 ~ air run function ctf:match/helpers/fall_flag_loop
