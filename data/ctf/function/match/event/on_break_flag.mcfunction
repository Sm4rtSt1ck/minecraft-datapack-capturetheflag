title @a[tag=!lobby] title {"text": "The flag had been broken!", "color": "dark_red"}
execute as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] run data merge entity @s {Glowing:true}

kill @e[type=armor_stand, tag=flag]

scoreboard players add @s money 400
title @s actionbar [{"text":"Money: ","color":"yellow"},{"score":{"name":"@s","objective":"money"},"color":"green"},{"text":"$","color":"green"}]

scoreboard players set @s flag_broken 0
scoreboard players set @s wall_flag_broken 0
