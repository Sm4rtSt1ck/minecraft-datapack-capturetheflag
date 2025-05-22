say match/freeze/start

scoreboard players set game state 3

# 60 secs freeze before round start (1200 ticks)
scoreboard players set freeze timer 1200
bossbar set ctf:match max 1200

gamerule fallDamage false

spawnpoint @a[tag=player] -190 -30 -190

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

execute as @a[scores={money=50..}] run scoreboard players set @s money 50

# Give flag breaker
# clear @a[tag=attack] minecraft:stick
give @a[tag=attack, nbt=!{Inventory:[{id: "minecraft:stick"}]}] minecraft:stick[\
    can_break={predicates:[{blocks:[\
        "yellow_banner",\
        "yellow_wall_banner",\
        "cobweb"\
        ]}]\
    },\
    custom_name='{"color":"green","text":"Flag breaker"}',\
    enchantments={knockback:1b}\
] 1


# Give chainmail armor if player doesn't have it
tag @a[nbt={Inventory:[{id:"minecraft:leather_helmet"}]}] add has_helmet
# tag @a[nbt={Inventory:[{id:"minecraft:golden_helmet"}]}] add has_helmet
tag @a[nbt={Inventory:[{id:"minecraft:chainmail_helmet"}]}] add has_helmet
tag @a[nbt={Inventory:[{id:"minecraft:iron_helmet"}]}] add has_helmet
tag @a[nbt={Inventory:[{id:"minecraft:diamond_helmet"}]}] add has_helmet
tag @a[nbt={Inventory:[{id:"minecraft:netherite_helmet"}]}] add has_helmet
item replace entity @a[tag=player, tag=!has_helmet] armor.head with golden_helmet
tag @a remove has_helmet
tag @a[nbt={Inventory:[{id:"minecraft:leather_chestplate"}]}] add has_boots
# tag @a[nbt={Inventory:[{id:"minecraft:golden_chestplate"}]}] add has_boots
tag @a[nbt={Inventory:[{id:"minecraft:chainmail_chestplate"}]}] add has_chestplate
tag @a[nbt={Inventory:[{id:"minecraft:iron_chestplate"}]}] add has_chestplate
tag @a[nbt={Inventory:[{id:"minecraft:diamond_chestplate"}]}] add has_chestplate
tag @a[nbt={Inventory:[{id:"minecraft:netherite_chestplate"}]}] add has_chestplate
item replace entity @a[tag=player, tag=!has_chestplate] armor.chest with golden_chestplate
tag @a remove has_chestplate
tag @a[nbt={Inventory:[{id:"minecraft:leather_leggings"}]}] add has_boots
# tag @a[nbt={Inventory:[{id:"minecraft:golden_leggings"}]}] add has_boots
tag @a[nbt={Inventory:[{id:"minecraft:chainmail_leggings"}]}] add has_leggings
tag @a[nbt={Inventory:[{id:"minecraft:iron_leggings"}]}] add has_leggings
tag @a[nbt={Inventory:[{id:"minecraft:diamond_leggings"}]}] add has_leggings
tag @a[nbt={Inventory:[{id:"minecraft:netherite_leggings"}]}] add has_leggings
item replace entity @a[tag=player, tag=!has_leggings] armor.legs with golden_leggings
tag @a remove has_leggings
tag @a[nbt={Inventory:[{id:"minecraft:leather_boots"}]}] add has_boots
# tag @a[nbt={Inventory:[{id:"minecraft:golden_boots"}]}] add has_boots
tag @a[nbt={Inventory:[{id:"minecraft:chainmail_boots"}]}] add has_boots
tag @a[nbt={Inventory:[{id:"minecraft:iron_boots"}]}] add has_boots
tag @a[nbt={Inventory:[{id:"minecraft:diamond_boots"}]}] add has_boots
tag @a[nbt={Inventory:[{id:"minecraft:netherite_boots"}]}] add has_boots
item replace entity @a[tag=player, tag=!has_boots] armor.feet with golden_boots
tag @a remove has_boots

effect clear @a[tag=player]
effect give @a[tag=player] minecraft:saturation infinite 127 true
effect give @a[tag=player] minecraft:regeneration 1 127 true
effect give @a[tag=player] minecraft:resistance infinite 127 true
effect give @a[tag=defense] minecraft:mining_fatigue infinite 4 true
effect give @a[tag=attack] minecraft:haste infinite 40 true

execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.tnt"]}}}]}] run scoreboard players set tnt_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.anvil"]}}}]}] run scoreboard players set anvil_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.web"]}}}]}] run scoreboard players set web_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.levitation"]}}}]}] run scoreboard players set levitation_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.wither"]}}}]}] run scoreboard players set wither_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.detector"]}}}]}] run scoreboard players set detector_trap bought.item 0

execute if score result map_vote matches 1 run function ctf:match/maps/test_map/freeze
execute if score result map_vote matches 2 run function ctf:match/maps/green_mine/freeze
execute if score result map_vote matches 3 run function ctf:match/maps/night_club/freeze
execute if score result map_vote matches 4 run function ctf:match/maps/farm/freeze


# Give flag
clear @a[tag=player] minecraft:yellow_banner

# give @r[tag=defense] minecraft:yellow_banner ONLY AFTER CALL MAP FREEZE FUNCTION
# execute positioned as @r[tag=defense] run summon item ~ ~ ~ {Glowing:true, PickupDelay:30, Tags:["flag"],Item:{id:"minecraft:yellow_banner",count:1}}
execute positioned as @r[tag=defense] run summon item ~ ~ ~ {Glowing:true, PickupDelay:20, Tags:["flag"], Item:{id:"minecraft:yellow_banner", count:1, components: {\
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
}}}
