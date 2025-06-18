title @a[tag=!lobby] title ""
title @a[tag=!lobby] subtitle {"text": "THE FLAG HAS BEEN BROKEN", "color": "red"}
execute as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] run data merge entity @s {Glowing:true}
function ctf:match/helpers/summon_flag {target: '@n[type=armor_stand, tag=flag]'}


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
