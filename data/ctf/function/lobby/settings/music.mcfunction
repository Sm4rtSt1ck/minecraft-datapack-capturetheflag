execute if score music settings matches 0 run scoreboard players set music settings 2
execute if score music settings matches 1 run scoreboard players set music settings 0
execute if score music settings matches 2 run scoreboard players set music settings 1

setblock 1 -40 28 air

execute if score music settings matches 0 run setblock 1 -40 28 cherry_wall_sign{front_text:{messages:['{"text":""}','"MUSIC"','{"text":"OFF","shadow_color":-10092544,"color":"red","clickEvent":{"action":"run_command","value":"/function ctf:lobby/settings/music"}}','{"text":""}']}} replace
execute if score music settings matches 1 run setblock 1 -40 28 cherry_wall_sign{front_text:{messages:['{"text":""}','"MUSIC"','{"text":"ON","shadow_color":-16751104,"color":"green","clickEvent":{"action":"run_command","value":"/function ctf:lobby/settings/music"}}','{"text":""}']}} replace

execute if score music settings matches 0 run stopsound @a ambient
execute if score music settings matches 1 run playsound minecraft:music_disc.relic ambient @a[tag=lobby] 0 1000 0 80 2
