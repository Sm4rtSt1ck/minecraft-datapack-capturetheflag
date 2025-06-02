execute unless score game state matches 4 run effect clear @s glowing
execute as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] run data merge entity @s {Glowing:true, Invulnerable: true, Tags:["flag"]}

scoreboard players set @s flag_dropped 0
