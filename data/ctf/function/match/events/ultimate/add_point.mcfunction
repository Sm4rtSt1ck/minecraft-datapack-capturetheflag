$scoreboard players add @s ultimate $(points)
execute if score @s ultimate >= max ultimate run scoreboard players operation @s ultimate = max ultimate
xp set @s 40 levels
$execute unless score @s ultimate >= max ultimate run xp add @s $(points) points
execute if score @s ultimate = max ultimate run xp set @s 200
xp set @s 0 levels
