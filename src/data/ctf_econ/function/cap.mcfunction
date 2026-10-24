execute if score @s money > #max econ run scoreboard players operation @s money = #max econ
execute if score @s money matches ..-1 run scoreboard players set @s money 0
