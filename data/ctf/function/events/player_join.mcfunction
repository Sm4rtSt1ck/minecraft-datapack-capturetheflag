title @s title {"text":"WELCOME TO", "color": "#ff00bf"}
title @s subtitle [\
    {"text":"C", "color": "#0000ff"},\
    {"text":"a", "color": "#2600ff"},\
    {"text":"p", "color": "#4400ff"},\
    {"text":"t", "color": "#5900ff"},\
    {"text":"u", "color": "#7700ff"},\
    {"text":"r", "color": "#9900ff"},\
    {"text":"e", "color": "#ae00ff"},\
    {"text":"T", "color": "#b700ff"},\
    {"text":"h", "color": "#d400ff"},\
    {"text":"e", "color": "#ea00ff"},\
    {"text":"F", "color": "#ff00f2"},\
    {"text":"l", "color": "#ff00bf"},\
    {"text":"a", "color": "#ff006a"},\
    {"text":"g", "color": "#ff0037"}\
]


execute unless score @s match_id = match match_id run function ctf:lobby/join
execute if score game status matches 0..1 run function ctf:lobby/join

execute if score @s[tag=player] match_id = match match_id if score game status matches 2 positioned as @s run tp @s @a[tag=player, sort=furthest, limit=1]

execute if score @s match_id = match match_id if score game status matches 3..5 run function ctf:match/spectate

scoreboard players set @s had_left 0
