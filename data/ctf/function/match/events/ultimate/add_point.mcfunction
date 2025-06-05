$scoreboard players add @s ultimate $(points)
xp set @s 40 levels
$xp add @s $(points) points
execute if entity @s[level=41] run function ctf:combine_commands {command_1: "xp set @s 40 levels", command_2: "xp set @s 200"}
xp set @s 0 levels
