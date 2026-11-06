# As a bot stuck chasing the player tagged bot_jt: it goes to the bot marker (copied annotation: any
# kind, all reachable) nearest to him, not one next to the bot itself, for up to 10 s (40 thinks);
# no marker on the map: nothing
scoreboard players set @s bot.stk 0
tag @e[type=marker, tag=bot_nav, distance=..4] add bot_skip
scoreboard players operation #dt bots = @s bot.n
scoreboard players add #dt bots 1
scoreboard players reset @e[type=marker, tag=bot_nav] bot.dt
execute at @p[tag=bot_jt] as @e[type=marker, tag=bot_nav, tag=!bot_skip, sort=nearest, limit=1] run scoreboard players operation @s bot.dt = #dt bots
tag @e[type=marker, tag=bot_skip] remove bot_skip
execute as @e[type=marker, tag=bot_nav] if score @s bot.dt = #dt bots run scoreboard players set #ok bots 3
execute if score #ok bots matches 3 run scoreboard players set @s bot.det 40
