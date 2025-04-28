say match/round/start

scoreboard players set game status 4
# Round timer 120 secs (2400 ticks)
scoreboard players set round timer 2400
bossbar set ctf:match max 2400

gamemode survival @a[tag=player]
effect clear @a[tag=player] minecraft:regeneration

function ctf:match/map/map_1/round
