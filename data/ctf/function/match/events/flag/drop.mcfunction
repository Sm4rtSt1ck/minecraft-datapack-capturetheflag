effect clear @s glowing
execute as @e[type=item] if items entity @s contents magenta_banner run data merge entity @s {Glowing:true, Invulnerable: true, Tags:["flag"]}

scoreboard players set @s flag_dropped 0
