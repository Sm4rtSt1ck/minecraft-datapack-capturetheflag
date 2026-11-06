# The memory of the match: the node nearest to the flag the players hid (once a round: #hidrec bots)
execute if score #hidrec bots matches 1 run return 0
scoreboard players set #hidrec bots 1
execute at @n[type=armor_stand, tag=flag] as @n[type=marker, tag=nav_node] run scoreboard players add @s bot.hide 1
