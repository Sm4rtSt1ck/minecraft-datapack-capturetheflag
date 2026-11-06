# As a bot in cover from a sniper (bot.cov thinks left): an enemy within 3: it fights (0); else to its
# cover node (bot.cvn), on guard there; 1
scoreboard players remove @s bot.cov 1
execute if entity @a[tag=bk_seen, distance=..3] run return 0
scoreboard players operation #cv bots = @s bot.cvn
execute as @e[type=marker, tag=nav_node] if score @s nav.id = #cv bots run tag @s add bk_cvd
execute unless entity @e[type=marker, tag=bk_cvd] run scoreboard players set @s bot.cov 0
execute if entity @e[type=marker, tag=bk_cvd, distance=..1.5] run function ctf_bots:internal/brain/guard
execute if entity @e[type=marker, tag=bk_cvd] unless entity @e[type=marker, tag=bk_cvd, distance=..1.5] at @n[type=marker, tag=bk_cvd] run function ctf_bots:internal/brain/lure_here
tag @e[type=marker, tag=bk_cvd] remove bk_cvd
execute if score @s bot.cov matches 1.. run return 1
return 0
