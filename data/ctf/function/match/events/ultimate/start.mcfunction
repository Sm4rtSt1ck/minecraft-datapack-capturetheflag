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

function ctf:match/helpers/save_inventory
clear @s

effect give @s minecraft:invisibility infinite 1 true
effect give @s minecraft:speed infinite 1 true
effect give @s minecraft:weakness infinite 127 true
effect give @s minecraft:resistance infinite 127 true

scoreboard players set @s timer 200

scoreboard players reset @s ultimate

tag @s add ultimate
