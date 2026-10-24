# #ctf:on/freeze_start (the last one): give the flag
clear @a[tag=player] minecraft:magenta_banner
clear @a[tag=player] minecraft:armor_stand[item_model="minecraft:magenta_banner"]

execute positioned as @r[tag=defense] run summon item ~ ~ ~ {Glowing:true, Invulnerable: true, PickupDelay:20, Tags:["flag", "ctf.flag_new"], Item:{id:"minecraft:armor_stand", count:1, components: {\
  custom_name: '{"text": "FLAG", "color":"red", "italic": false}',\
  entity_data: {id: "minecraft:armor_stand", Marker: true, Invisible: true, Tags: ["flag"]},\
  item_model:"minecraft:magenta_banner"\
}}}
# The banner patterns: ctf:match/helpers/flag/config
execute as @e[type=item, tag=ctf.flag_new] run function ctf:match/helpers/flag/apply_item
