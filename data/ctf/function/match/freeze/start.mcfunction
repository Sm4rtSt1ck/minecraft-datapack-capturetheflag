say match/freeze/start

scoreboard players set game status 3

# 60 secs freeze before round start (1200 ticks)
scoreboard players set freeze timer 1200
bossbar set ctf:match max 1200

gamemode adventure @a[tag=attack]
gamemode survival @a[tag=defense]

# kill @e[type=item, nbt={Item:{id:"minecraft:yellow_banner"}}]
# kill @e[type=item, nbt={Item:{id:"minecraft:stick"}}]
kill @e[type=item]
kill @e[type=arrow]
kill @e[type=trident]
# Remove the placed flag if it hadn't been broken
execute positioned as @e[type=armor_stand, tag=flag] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 air replace yellow_banner
execute positioned as @e[type=armor_stand, tag=flag] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 air replace yellow_wall_banner
kill @e[tag=flag]

clear @a[tag=player] minecraft:black_stained_glass_pane

# Give flag breaker
clear @a[tag=attack] minecraft:stick
give @a[tag=attack] minecraft:stick[\
    can_break={predicates:[{blocks:["yellow_banner", "yellow_wall_banner", "tnt", "redstone_wire", "minecraft:pale_oak_pressure_plate"]}]},\
    custom_name='{"color":"green","text":"Flag breaker"}'\
] 1

effect clear @a[tag=player]
effect give @a[tag=player] minecraft:saturation infinite 127 true
effect give @a[tag=player] minecraft:regeneration infinite 127 true
effect give @a[tag=defense] minecraft:mining_fatigue infinite 4 true

execute if score @r[tag=admin] map_vote matches 1 run function ctf:match/map/map_1/freeze
execute if score @r[tag=admin] map_vote matches 2 run function ctf:match/map/map_2/freeze

# Give flag
clear @a[tag=player] minecraft:yellow_banner

# give @r[tag=defense] minecraft:yellow_banner ONLY AFTER CALL MAP FREEZE FUNCTION
# execute positioned as @r[tag=defense] run summon item ~ ~ ~ {Glowing:true, PickupDelay:30, Tags:["flag"],Item:{id:"minecraft:yellow_banner",count:1}}
execute positioned as @r[tag=defense] run summon item ~ ~ ~ {Glowing:true, PickupDelay:30, Tags:["flag"],Item:{id:"minecraft:yellow_banner",count:1, components:{\
  "minecraft:banner_patterns": [\
    {\
      "color": "red",\
      "pattern": "minecraft:curly_border"\
    },\
    {\
      "color": "orange",\
      "pattern": "minecraft:gradient"\
    },\
    {\
      "color": "red",\
      "pattern": "minecraft:circle"\
    },\
    {\
      "color": "red",\
      "pattern": "minecraft:cross"\
    },\
    {\
      "color": "orange",\
      "pattern": "minecraft:flower"\
    },\
    {\
      "color": "red",\
      "pattern": "minecraft:triangle_top"\
    }\
  ]\
}\
}}

give @a chainmail_boots
give @a chainmail_chestplate
give @a chainmail_helmet
give @a chainmail_leggings