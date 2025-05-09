say match/end_round/start

scoreboard players set game status 5

scoreboard players add match rounds 1

execute if score match rounds < swap rounds run \
    bossbar set ctf:match name [\
        {"color":"blue","score":{"name":"team_2","objective":"rounds"}},\
        {"color":"dark_purple","text":" | "},\
        {"color":"red","score":{"name":"team_1","objective":"rounds"}}\
    ]
execute if score match rounds >= swap rounds run \
    bossbar set ctf:match name [\
        {"color":"blue","score":{"name":"team_1","objective":"rounds"}},\
        {"color":"dark_purple","text":" | "},\
        {"color":"red","score":{"name":"team_2","objective":"rounds"}}\
    ]
# Timer to restart 5 secs (100 ticks)
scoreboard players set end_round timer 100
bossbar set ctf:match max 100

execute if score @r[tag=admin] map_vote matches 1 run function ctf:match/map/map_1/end_round
execute if score @r[tag=admin] map_vote matches 2 run function ctf:match/map/map_2/end_round
