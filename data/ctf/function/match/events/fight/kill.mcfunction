scoreboard players add @s money 5
title @s actionbar [{"text":"+$500","color":"green"}]

title @s title ""
title @s subtitle {"text": "KILL", "color": "red"}

execute positioned as @s run playsound entity.player.levelup ambient @s ~ ~ ~ 1 1.5

tag @s add just_killed

scoreboard players set @s just_killed 0
