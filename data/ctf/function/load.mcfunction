# Deploy
team leave @a
team add team_1
team add team_2

scoreboard objectives add rounds dummy
scoreboard players set team_1 rounds 0
scoreboard players set team_2 rounds 0

scoreboard objectives add map_vote dummy "Map vote"
scoreboard players reset @a map_vote

# Game status (0 - lobby, 1 - match)
scoreboard objectives add status dummy "Status"
scoreboard players set game status 0

bossbar remove ctf:rounds
bossbar add ctf:rounds "x1 | x2"
bossbar set ctf:rounds visible true
bossbar set ctf:rounds color purple
bossbar set ctf:rounds max 300
bossbar set ctf:rounds style notched_20

# Join to lobby
# tag @a remove lobby
function ctf:lobby/join_all

# Loading notification
title @a[tag=admin] title { \
    "text": "Datapack loaded!", \
    "color": "green", \
    "bold": true \
}
execute as @a[tag=admin] positioned as @s run \
    playsound entity.firework_rocket.launch master @s ~ ~ ~ 1 1
