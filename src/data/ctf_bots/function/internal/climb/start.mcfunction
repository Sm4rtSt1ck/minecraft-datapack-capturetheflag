# As a bot at its ladder (marker bot_dest): it climbs. NoAI (no path pulling it away; moved by tp,
# ctf_bots:internal/climb/tick), in the ladder block, facing the wall of the ladder (bot.cdir: the
# wall at 1 +z, 2 -z, 3 +x, 4 -x); up to 10 s
scoreboard players set @s bot.clm 0
tag @s add bot_climb
tag @s remove bot_shoot
scoreboard players set @s bot.clt 200
scoreboard players set @s bot.cdir 0
data merge entity @s {NoAI: 1b}
execute at @n[type=marker, tag=bot_dest] if block ~ ~ ~ minecraft:ladder[facing=north] run scoreboard players set @s bot.cdir 1
execute at @n[type=marker, tag=bot_dest] if block ~ ~ ~ minecraft:ladder[facing=south] run scoreboard players set @s bot.cdir 2
execute at @n[type=marker, tag=bot_dest] if block ~ ~ ~ minecraft:ladder[facing=west] run scoreboard players set @s bot.cdir 3
execute at @n[type=marker, tag=bot_dest] if block ~ ~ ~ minecraft:ladder[facing=east] run scoreboard players set @s bot.cdir 4
execute if score @s bot.cdir matches 1 at @n[type=marker, tag=bot_dest] run tp @s ~ ~ ~ 0 0
execute if score @s bot.cdir matches 2 at @n[type=marker, tag=bot_dest] run tp @s ~ ~ ~ 180 0
execute if score @s bot.cdir matches 3 at @n[type=marker, tag=bot_dest] run tp @s ~ ~ ~ -90 0
execute if score @s bot.cdir matches 4 at @n[type=marker, tag=bot_dest] run tp @s ~ ~ ~ 90 0
