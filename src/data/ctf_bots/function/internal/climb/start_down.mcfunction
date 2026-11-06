# As a bot at the top of its ladder down (marker bot_dest): it goes down (NoAI, moved by tp:
# ctf_bots:internal/climb/tick), in the column above the ladder; up to 20 s
scoreboard players set @s bot.clm 0
tag @s add bot_climb
tag @s add bot_down
tag @s remove bot_shoot
scoreboard players set @s bot.clt 400
data merge entity @s {NoAI: 1b}
execute at @n[type=marker, tag=bot_dest] run tp @s ~ ~ ~
