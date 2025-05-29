# 1) Снимаем все старые теги
tag @s remove top1
tag @s remove top2
tag @s remove top3
scoreboard players set max1 number 0
scoreboard players set max2 number 0
scoreboard players set max3 number 0

# 2) Находим первый максимум (max1)
execute as @s run \
  execute if score @s kills > max1 number run scoreboard players operation max1 number = @s kills
execute if score @s kills = max1 number run tag @s add top1

# 5) Второй максимум (max2) среди игроков без top1
execute as @s[tag=!top1] run \
  execute if score @s kills > max2 number run scoreboard players operation max2 number = @s kills
execute if score @s[tag=!top1] kills = max2 number run tag @s add top2

# 8) Третий максимум (max3) среди игроков без top1 и top2
execute as @s[tag=!top1, tag=!top2] run \
  execute if score @s kills > max3 number run scoreboard players operation max3 number = @s kills
execute if score @s[tag=!top1, tag=!top2] kills = max3 number run tag @s add top3
