execute as @e[type=armor_stand,tag=flag] positioned as @s if block ~ ~-1 ~ air run tp @s ~ ~-0.3 ~
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air run particle effect ~ ~ ~ 0.3 1 0.3 1 50 force
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air run playsound entity.allay.item_thrown block @a ~ ~ ~ 1 0

execute positioned as @e[type=armor_stand,tag=flag] unless block ~ ~-1 ~ air run function ctf:match/helpers/set_fallen_flag

execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air run schedule function ctf:match/helpers/fall_flag_loop 1t
