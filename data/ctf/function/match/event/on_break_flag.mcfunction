title @a[tag=!lobby] title {"text": "The flag had been broken!", "color": "dark_red"}
execute as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] run data merge entity @s {Glowing:true}

scoreboard players set @s flag_broken 0
