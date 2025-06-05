title @a[tag=!lobby] title {"text": "The flag has been broken!", "color": "dark_red"}
execute as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] run data merge entity @s {Glowing:true}
execute positioned as @n[type=armor_stand, tag=flag] run summon item ~ ~ ~ {Glowing:true, PickupDelay:10, Invulnerable: true, Tags:["flag"], Item:{id:"minecraft:yellow_banner", count:1, components: {\
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


effect give @a[tag=defense,tag=!spectator,tag=!died] blindness 3 1 false
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1
execute as @a[tag=!lobby] positioned as @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.35 1

execute positioned as @e[type=armor_stand, tag=flag] run particle explosion ~ ~ ~ 0.8 0.8 0.8 0 10 force
execute positioned as @e[type=armor_stand, tag=flag] run playsound entity.generic.explode block @a ~ ~ ~ 5 1

scoreboard players add @s money 69
title @s actionbar [{"text":"+$69","color":"green"}]

function ctf:match/events/ultimate/add_point {points: 40}

kill @e[type=armor_stand, tag=flag]

scoreboard players set @s flag_broken 0
scoreboard players set @s wall_flag_broken 0
