title @a[tag=!lobby] title {"text": "Flag had been broken!", "color": "dark_red"}
execute as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] run data merge entity @s {Glowing:true}
