execute at @s run summon minecraft:armor_stand ^ ^ ^2 {Tags:["flag"], Invisible:true, Invulnerable:true, Marker:true}

execute if score freeze timer matches 200.. run scoreboard players set freeze timer 200

scoreboard players set @s flag_placed 0
