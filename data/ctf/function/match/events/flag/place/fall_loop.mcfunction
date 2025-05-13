execute as @e[type=armor_stand,tag=flag] positioned as @s if block ~ ~-1 ~ air run tp @s ~ ~-0.3 ~
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air run particle dust_color_transition{from_color:[0.000,0.000,1.000],scale:1,to_color:[1.000,0.000,0.000]} ~ ~ ~ 0.3 1 0.3 1 50 normal
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air run playsound entity.allay.item_thrown block @a ~ ~ ~ 1 0

execute positioned as @e[type=armor_stand,tag=flag] unless block ~ ~-1 ~ air run function ctf:match/events/flag/place/place_fallen

execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~-1 ~ air run schedule function ctf:match/events/flag/place/fall_loop 1t
