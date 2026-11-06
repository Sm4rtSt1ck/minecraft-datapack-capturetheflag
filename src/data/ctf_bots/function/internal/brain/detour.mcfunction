from registry:bots import NAV
# As a bot on a detour (bot.det thinks left) to the player whose player_id is bot.dp: to him along the
# graph (ctf_bots:internal/brain/lure_here: the shortest way); within NAV "chase_near" of him, or he can
# be chased straight now (near, in sight: ctf_bots:internal/nav/direct_chase), he is gone / dead or the time is over: the detour ends
# and it thinks as usual again (it fights him)
scoreboard players remove @s bot.det 1
scoreboard players operation #dp bots = @s bot.dp
execute as @a[tag=player, tag=!dead, gamemode=!spectator] if score @s player_id = #dp bots run tag @s add bot_dtp
execute unless entity @a[tag=bot_dtp] run scoreboard players set @s bot.det 0
execute if entity @a[tag=bot_dtp, distance=(f"..{NAV['chase_near']}")] run scoreboard players set @s bot.det 0
execute if score @s bot.det matches 1.. at @p[tag=bot_dtp] if function ctf_bots:internal/nav/direct_chase run scoreboard players set @s bot.det 0
execute if score @s bot.det matches 1.. at @p[tag=bot_dtp] run function ctf_bots:internal/brain/lure_here
tag @a remove bot_dtp
