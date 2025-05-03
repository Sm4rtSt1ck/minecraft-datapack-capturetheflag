title @a[tag=!lobby] title {"text": "The flag had been broken!", "color": "dark_red"}
execute as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] run data merge entity @s {Glowing:true}

kill @e[type=armor_stand, tag=flag]

scoreboard players set @s flag_broken 0
scoreboard players set @s wall_flag_broken 0
