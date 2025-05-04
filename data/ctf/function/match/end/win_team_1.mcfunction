title @a[team=team_1] title {"text": "WIN", "color": "green"}
execute as @a[team=team_1] at @s run playsound minecraft:ui.toast.challenge_complete ambient @s ~ ~ ~ 10 1
title @a[team=team_2] title {"text": "DEFEAT", "color": "red"}
execute as @a[team=team_2] at @s run playsound minecraft:item.goat_horn.sound.7 ambient @s ~ ~ ~ 10 1

function ctf:match/end/start
