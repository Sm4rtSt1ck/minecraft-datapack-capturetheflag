say match/warmup/end

function ctf:match/helpers/update_score_display

scoreboard players set @a[tag=player] deaths 0
scoreboard players set @a[tag=player] kills 0

scoreboard players set @a[tag=player] just_died 0
scoreboard players set @a[tag=player] just_killed 0

scoreboard players set @a[tag=player] flag_placed 0
scoreboard players set @a[tag=player] flag_broken 0
scoreboard players set @a[tag=player] wall_flag_broken 0
scoreboard players set @a[tag=player] flag_dropped 0
scoreboard players set @a[tag=player] flag_pickedup 0

scoreboard objectives setdisplay sidebar kills

gamerule keepInventory false

clear @a[tag=player]

title @a[tag=player] title {"text":"LET'S WIN", "color":"green"}
title @a[tag=defense] subtitle {"text":"Defense", "color":"blue"}
title @a[tag=attack] subtitle {"text":"Attack", "color":"red"}

function ctf:match/freeze/start

execute as @a[tag=!lobby] at @s run playsound minecraft:entity.firework_rocket.launch ambient @s ~ ~ ~ 10 1
