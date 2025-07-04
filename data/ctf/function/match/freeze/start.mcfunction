function admin:log/function {name: "match/freeze/start"}

scoreboard players operation game state = freeze state

# 60 secs freeze before round start (1200 ticks)
scoreboard players set freeze timer 1200
bossbar set ctf:match max 1200

gamerule fallDamage false

spawnpoint @a[tag=player] -150 0 -150

gamemode adventure @a[tag=attack]
gamemode survival @a[tag=defense]

# kill @e[type=item, nbt={Item:{id:"minecraft:yellow_banner"}}]
# kill @e[type=item, nbt={Item:{id:"minecraft:stick"}}]
kill @e[type=item]
kill @e[type=arrow]
kill @e[type=trident]
kill @e[tag=lastDeathMarker]
# Remove the placed flag if it hadn't been broken
execute positioned as @e[type=armor_stand, tag=flag] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 air replace yellow_banner
kill @e[tag=flag]

scoreboard players reset * just_used_chorus
scoreboard players reset * just_threw_grenade

clear @a[tag=player] minecraft:black_stained_glass_pane

execute as @a[scores={money=1500..}] run scoreboard players set @s money 1500

# Give flag breaker
# clear @a[tag=attack] minecraft:stick
give @a[tag=attack, nbt=!{Inventory:[{id: "minecraft:stick"}]}] minecraft:stick[\
    can_break={predicates:[{blocks:[\
        "yellow_banner"\
        ]}], show_in_tooltip: false\
    },\
    custom_name='{"color":"#31fff5","text":"FLAG BREAKER", "italic": false}',\
    enchantments={knockback:1b}\
] 1


# Give chainmail armor if player doesn't have it
# tag @a[nbt={Inventory:[{id:"minecraft:leather_helmet"}]}] add has_helmet
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:golden_helmet"}]}] add has_helmet
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:chainmail_helmet"}]}] add has_helmet
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:iron_helmet"}]}] add has_helmet
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:diamond_helmet"}]}] add has_helmet
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:netherite_helmet"}]}] add has_helmet
# tag @a[nbt={Inventory:[{id:"minecraft:leather_chestplate"}]}] add has_chestplate
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:golden_chestplate"}]}] add has_chestplate
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:chainmail_chestplate"}]}] add has_chestplate
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:iron_chestplate"}]}] add has_chestplate
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:diamond_chestplate"}]}] add has_chestplate
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:netherite_chestplate"}]}] add has_chestplate
# tag @a[nbt={Inventory:[{id:"minecraft:leather_leggings"}]}] add has_leggings
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:golden_leggings"}]}] add has_leggings
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:chainmail_leggings"}]}] add has_leggings
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:iron_leggings"}]}] add has_leggings
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:diamond_leggings"}]}] add has_leggings
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:netherite_leggings"}]}] add has_leggings
# tag @a[nbt={Inventory:[{id:"minecraft:leather_boots"}]}] add has_boots
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:golden_boots"}]}] add has_boots
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:chainmail_boots"}]}] add has_boots
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:iron_boots"}]}] add has_boots
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:diamond_boots"}]}] add has_boots
tag @a[tag=player, nbt={Inventory:[{id:"minecraft:netherite_boots"}]}] add has_boots

item replace entity @a[tag=player, tag=!has_helmet, tag=attack] armor.head with leather_helmet[minecraft:dyed_color={rgb:16711799}]
item replace entity @a[tag=player, tag=!has_chestplate, tag=attack] armor.chest with leather_chestplate[minecraft:dyed_color={rgb:16711799}]
item replace entity @a[tag=player, tag=!has_leggings, tag=attack] armor.legs with leather_leggings[minecraft:dyed_color={rgb:16711799}]
item replace entity @a[tag=player, tag=!has_boots, tag=attack] armor.feet with leather_boots[minecraft:dyed_color={rgb:16711799}, enchantments={feather_falling:1}]
item replace entity @a[tag=player, tag=!has_helmet, tag=defense] armor.head with leather_helmet[minecraft:dyed_color={rgb:47103}]
item replace entity @a[tag=player, tag=!has_chestplate, tag=defense] armor.chest with leather_chestplate[minecraft:dyed_color={rgb:47103}]
item replace entity @a[tag=player, tag=!has_leggings, tag=defense] armor.legs with leather_leggings[minecraft:dyed_color={rgb:47103}]
item replace entity @a[tag=player, tag=!has_boots, tag=defense] armor.feet with leather_boots[minecraft:dyed_color={rgb:47103}, enchantments={feather_falling:1}]
tag @a remove has_helmet
tag @a remove has_chestplate
tag @a remove has_leggings
tag @a remove has_boots

give @a[tag=player, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["main weapon"]}}}]}, nbt=!{Inventory:[{id:"minecraft:golden_sword"}]}] golden_sword[custom_data={tags:["main weapon"]}]


effect clear @a[tag=player]
effect give @a[tag=player] minecraft:saturation infinite 127 true
effect give @a[tag=player] minecraft:regeneration 1 127 true
effect give @a[tag=player] minecraft:resistance infinite 127 true
effect give @a[tag=defense] minecraft:mining_fatigue infinite 4 true

execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.tnt"]}}}]}] run scoreboard players set tnt_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.anvil"]}}}]}] run scoreboard players set anvil_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.web"]}}}]}] run scoreboard players set web_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.levitation"]}}}]}] run scoreboard players set levitation_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.wither"]}}}]}] run scoreboard players set wither_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.detector"]}}}]}] run scoreboard players set detector_trap bought.item 0

execute as @a[tag=player] run function ctf:match/maps/call_current {function: "freeze"}
scoreboard players set @a[tag=player] shop_category 1

# Give flag
clear @a[tag=player] minecraft:yellow_banner
clear @a[tag=player] minecraft:armor_stand[item_model="minecraft:yellow_banner"]

# give @r[tag=defense] minecraft:yellow_banner ONLY AFTER CALL MAP FREEZE FUNCTION
# execute positioned as @r[tag=defense] run summon item ~ ~ ~ {Glowing:true, PickupDelay:30, Tags:["flag"],Item:{id:"minecraft:yellow_banner",count:1}}
# give @p minecraft:armor_stand[item_model=yellow_banner, entity_data={id:"minecraft:armor_stand", Tags: ["flag"], Marker: true}]
# summon item ~ ~ ~ {Item: {components:{item_model:"minecraft:yellow_banner", entity_data: {id: "minecraft:armor_stand", Marker: true}}}}
execute positioned as @r[tag=defense] run summon item ~ ~ ~ {Glowing:true, Invulnerable: true, PickupDelay:20, Tags:["flag"], Item:{id:"minecraft:armor_stand", count:1,  components: {\
  custom_name: '{"text": "FLAG", "color":"red", "italic": false}',\
  entity_data: {id: "minecraft:armor_stand", Marker: true, Invisible: true, Tags: ["flag"]},\
  item_model:"minecraft:yellow_banner",\
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
