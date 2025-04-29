say match/freeze/start

scoreboard players set game status 3

# 30 secs freeze before round start (600 ticks)
scoreboard players set freeze timer 600
bossbar set ctf:match max 600

gamemode adventure @a[tag=attack]
gamemode survival @a[tag=defence]

# Give flag
clear @a[tag=player] minecraft:yellow_banner
give @r[tag=defence] minecraft:yellow_banner
# Give flag breaker
clear @a[tag=attack] minecraft:stick
give @a[tag=attack] minecraft:stick[\
    can_break={predicates:[{blocks:"yellow_banner"}]},\
    custom_name='{"color":"green","text":"Flag breaker"}'\
] 1

effect clear @a[tag=player]
effect give @a[tag=player] minecraft:saturation infinite 127 true
effect give @a[tag=player] minecraft:regeneration infinite 127 true

kill @e[type=item, nbt={Item:{id:"minecraft:yellow_banner"}}]
kill @e[type=item, nbt={Item:{id:"minecraft:stick"}}]

function ctf:match/map/map_1/freeze
