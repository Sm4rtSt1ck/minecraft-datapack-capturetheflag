say match/warmup/start

# Warmup game status
scoreboard players set game status 2
bossbar set ctf:match name {"text": "WARM-UP", "color": "green"}

# 30 secs warmup timer (600 ticks)
scoreboard players set warmup timer 600
bossbar set ctf:match max 600

scoreboard players set @a[tag=player] deaths 0
scoreboard players set @a[tag=player] just_died 0
scoreboard players set @a[tag=player] kills 0
scoreboard players set @a[tag=player] just_killed 0

effect clear @a[tag=player]
effect give @a[tag=player] minecraft:saturation infinite 127 true

gamemode adventure @a[tag=player]

function ctf:match/map/map_1/prepare
