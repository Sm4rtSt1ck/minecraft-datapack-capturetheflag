say match/warmup/start

# Warmup game status
scoreboard players set game status 2
bossbar set ctf:match name {"text": "WARM-UP", "color": "green"}

# 30 secs warmup timer (600 ticks)
scoreboard players set warmup timer 600
bossbar set ctf:match max 600


effect clear @a[tag=player]
effect give @a[tag=player] minecraft:saturation infinite 127 true

gamemode adventure @a[tag=player]
