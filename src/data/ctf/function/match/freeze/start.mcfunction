function admin:log/function {name: "match/freeze/start"}

scoreboard players operation game state = freeze state

# A death camera of the last round ends right away, players in creepers are back
# (before the gamemodes below)
function #ctf:on/round_cleanup

# 60 secs freeze before round start (1200 ticks)
scoreboard players set freeze timer 1200
bossbar set ctf:match max 1200

gamerule fallDamage false

spawnpoint @a[tag=player] -150 0 -150

gamemode adventure @a[tag=attack]
gamemode survival @a[tag=defense]

kill @e[type=item]
kill @e[type=arrow]
kill @e[type=trident]
kill @e[tag=lastDeathMarker]

effect clear @a[tag=player]
effect give @a[tag=player] minecraft:saturation infinite 127 true
effect give @a[tag=player] minecraft:regeneration 1 127 true
effect give @a[tag=player] minecraft:resistance infinite 127 true
effect give @a[tag=defense] minecraft:mining_fatigue infinite 4 true

# Modules: the old flag is removed, money cap, armor, map spawns, shop, loot crates, ultimate bar,
# hotbar layout, and the new flag at the end
function #ctf:on/freeze_start
