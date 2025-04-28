say match/freeze/start

scoreboard players set game status 3

# 30 secs freeze before round start (600 ticks)
scoreboard players set freeze timer 600
bossbar set ctf:match max 600

gamemode survival @a[tag=player]

function ctf:match/map/map_1/freeze
