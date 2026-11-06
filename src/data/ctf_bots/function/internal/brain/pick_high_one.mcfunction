# A free defend spot: the highest so far?
execute store result score #y bots run data get entity @s Pos[1] 10
execute unless score #y bots > #hy bots run return 0
scoreboard players operation #hy bots = #y bots
tag @e[type=marker, tag=bot_pick] remove bot_pick
tag @s add bot_pick
