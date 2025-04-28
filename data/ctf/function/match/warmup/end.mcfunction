say match/warmup/end

bossbar set ctf:match name [\
    {"text": "0", "color": "blue"},\
    {"text": " | ", "color": "dark_purple"},\
    {"text": "0", "color": "red"}\
]

scoreboard players set @a[tag=player] deaths 0
scoreboard players set @a[tag=player] just_died 0
scoreboard players set @a[tag=player] kills 0
scoreboard players set @a[tag=player] just_killed 0

function ctf:match/freeze/start
