execute positioned as @s[nbt={Inventory:[{id:"minecraft:yellow_banner"}]}] run summon item ~ ~ ~ {Glowing:true, PickupDelay:10, Invulnerable: true, Tags:["flag"], Item:{id:"minecraft:yellow_banner", count:1, components: {\
  custom_name: '{"text": "FLAG", "color":"red", "italic": false}',\
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
clear @s yellow_banner

scoreboard players reset @s ultimate

tag @s add ultimate

execute if score @s ultimate_category matches 1 run function ctf:match/events/ultimate/categories/ghost
execute if score @s ultimate_category matches 2 run function ctf:match/events/ultimate/categories/scale
execute if score @s ultimate_category matches 3 run function ctf:match/events/ultimate/categories/trident
