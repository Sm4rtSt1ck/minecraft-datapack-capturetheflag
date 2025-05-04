scoreboard players add @s money 500
title @s actionbar [{"text":"Money: ","color":"yellow"},{"score":{"name":"@s","objective":"money"},"color":"green"},{"text":"$","color":"green"}]

teleport @a[scores={just_died=1}] @s

scoreboard players set @s just_killed 0
