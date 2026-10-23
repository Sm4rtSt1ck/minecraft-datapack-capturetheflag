# The weapon was dropped: its ammo is dropped where the weapon is and flies with it. type
$function ctf_inv:limits/one {pred: '*[custom_data~{ammo:"$(type)"}]', max: 0}
$execute as @e[type=item, distance=..6] if items entity @s contents *[custom_data~{wpn:"$(type)"}] run tag @s add ctf.wpn_drop
$execute as @e[type=item, tag=!ctf.seen, distance=..3] if items entity @s contents *[custom_data~{ammo:"$(type)"}] at @s run function ctf_inv:ammo/follow
tag @e[type=item, tag=ctf.wpn_drop] remove ctf.wpn_drop
