tag @s remove top1
tag @s remove top2
tag @s remove top3
scoreboard players set max1 number 0
scoreboard players set max2 number 0
scoreboard players set max3 number 0

# Top 1
execute if score @s kills > max1 number run scoreboard players operation max1 number = @s kills
execute if score @s kills = max1 number run tag @s add top1

# Top 2
execute if score @s[tag=!top1] kills > max2 number run scoreboard players operation max2 number = @s[tag=!top1] kills
execute if score @s[tag=!top1] kills = max2 number run tag @s[tag=!top1] add top2

# Top 3
execute if score @s[tag=!top1, tag=!top2] kills > max3 number run scoreboard players operation max3 number = @s[tag=!top1, tag=!top2] kills
execute if score @s[tag=!top1, tag=!top2] kills = max3 number run tag @s[tag=!top1, tag=!top2] add top3
