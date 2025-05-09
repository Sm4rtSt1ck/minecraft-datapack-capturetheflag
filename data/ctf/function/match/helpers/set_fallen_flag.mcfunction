execute positioned as @e[type=armor_stand,tag=flag] unless block ~ ~ ~-1 air run setblock ~ ~ ~ yellow_banner[rotation=0]
execute positioned as @e[type=armor_stand,tag=flag] unless block ~1 ~ ~ air run setblock ~ ~ ~ yellow_banner[rotation=4]
execute positioned as @e[type=armor_stand,tag=flag] unless block ~ ~ ~1 air run setblock ~ ~ ~ yellow_banner[rotation=8]
execute positioned as @e[type=armor_stand,tag=flag] unless block ~-1 ~ ~ air run setblock ~ ~ ~ yellow_banner[rotation=12]
execute positioned as @e[type=armor_stand,tag=flag] if block ~ ~ ~-1 air if block ~1 ~ ~ air if block ~ ~ ~1 air if block ~-1 ~ ~ air run setblock ~ ~ ~ yellow_banner
playsound block.stone.place block @a ~ ~ ~ 1 1
