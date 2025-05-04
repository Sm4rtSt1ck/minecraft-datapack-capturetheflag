say match/freeze/start

scoreboard players set game status 3

# 60 secs freeze before round start (1200 ticks)
scoreboard players set freeze timer 1200
bossbar set ctf:match max 1200

gamemode adventure @a[tag=attack]
gamemode survival @a[tag=defense]

kill @e[type=item]
kill @e[type=arrow]
kill @e[type=trident]
kill @e[type=armor_stand, tag=flag]

clear @a[tag=player] minecraft:black_stained_glass_pane
# Give flag
clear @a[tag=player] minecraft:yellow_banner
give @r[tag=defense] minecraft:yellow_banner
# Give flag breaker
clear @a[tag=attack] minecraft:stick
give @a[tag=attack] minecraft:stick[\
    can_break={predicates:[{blocks:["yellow_banner", "yellow_wall_banner", "tnt", "redstone_wire", "stone_pressure_plate"]}]},\
    custom_name='{"color":"green","text":"Flag breaker"}'\
] 1

effect clear @a[tag=player]
effect give @a[tag=player] minecraft:saturation infinite 127 true
effect give @a[tag=player] minecraft:regeneration infinite 127 true
effect give @a[tag=defense] minecraft:mining_fatigue infinite 4 true

kill @e[type=item, nbt={Item:{id:"minecraft:yellow_banner"}}]
kill @e[type=item, nbt={Item:{id:"minecraft:stick"}}]


# Remove the placed flag
fill -200 -52 -200 -169 -21 -169 air replace yellow_banner
fill -168 -52 -200 -137 -21 -169 air replace yellow_banner
fill -136 -52 -200 -105 -21 -169 air replace yellow_banner
fill -104 -52 -200 -101 -21 -169 air replace yellow_banner

fill -200 -52 -168 -169 -21 -137 air replace yellow_banner
fill -168 -52 -168 -137 -21 -137 air replace yellow_banner
fill -136 -52 -168 -105 -21 -137 air replace yellow_banner
fill -104 -52 -168 -101 -21 -137 air replace yellow_banner

fill -200 -52 -136 -169 -21 -105 air replace yellow_banner
fill -168 -52 -136 -137 -21 -105 air replace yellow_banner
fill -136 -52 -136 -105 -21 -105 air replace yellow_banner
fill -104 -52 -136 -101 -21 -105 air replace yellow_banner

fill -200 -52 -104 -169 -21 -101 air replace yellow_banner
fill -168 -52 -104 -137 -21 -101 air replace yellow_banner
fill -136 -52 -104 -105 -21 -101 air replace yellow_banner
fill -104 -52 -104 -101 -21 -101 air replace yellow_banner

fill -200 -52 -200 -169 -21 -169 air replace yellow_wall_banner
fill -168 -52 -200 -137 -21 -169 air replace yellow_wall_banner
fill -136 -52 -200 -105 -21 -169 air replace yellow_wall_banner
fill -104 -52 -200 -101 -21 -169 air replace yellow_wall_banner

fill -200 -52 -168 -169 -21 -137 air replace yellow_wall_banner
fill -168 -52 -168 -137 -21 -137 air replace yellow_wall_banner
fill -136 -52 -168 -105 -21 -137 air replace yellow_wall_banner
fill -104 -52 -168 -101 -21 -137 air replace yellow_wall_banner

fill -200 -52 -136 -169 -21 -105 air replace yellow_wall_banner
fill -168 -52 -136 -137 -21 -105 air replace yellow_wall_banner
fill -136 -52 -136 -105 -21 -105 air replace yellow_wall_banner
fill -104 -52 -136 -101 -21 -105 air replace yellow_wall_banner

fill -200 -52 -104 -169 -21 -101 air replace yellow_wall_banner
fill -168 -52 -104 -137 -21 -101 air replace yellow_wall_banner
fill -136 -52 -104 -105 -21 -101 air replace yellow_wall_banner
fill -104 -52 -104 -101 -21 -101 air replace yellow_wall_banner

function ctf:match/map/map_1/freeze
