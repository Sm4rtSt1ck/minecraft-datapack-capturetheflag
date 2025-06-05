scoreboard players add @s money 100
title @s actionbar [{"text":"+$100","color":"green"}]

title @s title ""
title @s subtitle {"text": "KILL", "color": "red"}

execute positioned as @s run playsound entity.player.levelup ambient @s ~ ~ ~ 1 1.5

function ctf:match/events/ultimate/add_point {points: 40}

tag @s add just_killed

scoreboard players set @s just_killed 0
