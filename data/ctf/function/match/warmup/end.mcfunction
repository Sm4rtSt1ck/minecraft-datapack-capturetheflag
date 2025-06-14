function admin:log/function {name: "match/warmup/end"}


#########################################
# GLOBAL

gamerule keepInventory false

#########################################
# PLAYER

# Fight events
scoreboard players set @a[tag=player] deaths 0
scoreboard players set @a[tag=player] kills 0
scoreboard players set @a[tag=player] just_died 0
scoreboard players set @a[tag=player] just_killed 0
scoreboard players set @a[tag=player] just_used_totem 0
scoreboard players set @a[tag=player] just_threw_grenade 0
# Flag events
scoreboard players set @a[tag=player] flag_placed 0
scoreboard players set @a[tag=player] flag_broken 0
scoreboard players set @a[tag=player] wall_flag_broken 0
scoreboard players set @a[tag=player] flag_dropped 0
scoreboard players set @a[tag=player] flag_pickedup 0
# Traps events
scoreboard players set @a[tag=player] just_placed_trap 0

# Other
clear @a[tag=player]

#########################################
# VISUAL

scoreboard objectives setdisplay sidebar kills

title @a[tag=player] title {"text":"LET'S WIN", "color":"green"}
title @a[tag=defense] subtitle {"text":"Defense", "color":"blue"}
title @a[tag=attack] subtitle {"text":"Attack", "color":"red"}

function ctf:match/helpers/update_score_display

#########################################
# OTHER

function ctf:match/freeze/start

execute as @a[tag=!lobby] at @s run playsound minecraft:entity.firework_rocket.launch ambient @s ~ ~ ~ 10 1
