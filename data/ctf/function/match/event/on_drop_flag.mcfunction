effect clear @s glowing
execute as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] run data merge entity @s {Glowing:true}

scoreboard players set @s flag_dropped 0
