title @s title {"text":"WELCOME TO", "color": "#ff00bf"}
title @s subtitle [\
    {"color":"#0000FF","text":"C", "shadow_color": 1693581554},\
    {"color":"#1200ED","text":"a"},\
    {"color":"#2400DB","text":"p"},\
    {"color":"#3700C8","text":"t"},\
    {"color":"#4900B6","text":"u"},\
    {"color":"#5B00A4","text":"r"},\
    {"color":"#6D0092","text":"e"},\
    {"color":"#800080","text":"T"},\
    {"color":"#92006D","text":"h"},\
    {"color":"#A4005B","text":"e"},\
    {"color":"#B60049","text":"F"},\
    {"color":"#C80037","text":"l"},\
    {"color":"#DB0024","text":"a"},\
    {"color":"#FF0000","text":"g"}\
]


execute unless score @s match_id = match match_id run function ctf:lobby/join
execute if score game status matches 0..1 run function ctf:lobby/join

execute if score @s[tag=player] match_id = match match_id if score game status matches 2 positioned as @s run tp @s @a[tag=player, sort=furthest, limit=1]

execute if score @s match_id = match match_id if score game status matches 3..5 run function ctf:match/spectate

scoreboard players set @s had_left 0
