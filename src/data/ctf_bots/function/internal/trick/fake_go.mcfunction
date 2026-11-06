# As the fake (role 7): to its node (bot.fkn) along the graph; there (within 4): noise every TRICKS
# "noise" ticks (shots heard by the players), it says so once (bot_faked)
from registry:bots import TRICKS
scoreboard players operation #fk bots = @s bot.fkn
execute as @e[type=marker, tag=nav_node] if score @s nav.id = #fk bots run tag @s add bk_fkd
execute unless entity @e[type=marker, tag=bk_fkd] run return run scoreboard players set @s bot.role 1
execute if entity @e[type=marker, tag=bk_fkd, distance=..4] run function ctf_bots:internal/trick/noise
execute unless entity @e[type=marker, tag=bk_fkd, distance=..4] at @n[type=marker, tag=bk_fkd] run function ctf_bots:internal/brain/lure_here
tag @e[type=marker, tag=bk_fkd] remove bk_fkd
return 1
