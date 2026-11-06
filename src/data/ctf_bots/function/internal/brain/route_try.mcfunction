# The route #r has points? Else the next route (#try routes left; none: #r = 0)
scoreboard players set #c bots 0
execute as @e[type=marker, tag=bot_route] if score @s bot.r = #r bots run scoreboard players set #c bots 1
execute if score #c bots matches 1 run return 1
scoreboard players operation #r bots %= #4 bots
scoreboard players add #r bots 1
scoreboard players remove #try bots 1
execute if score #try bots matches ..0 run return run scoreboard players set #r bots 0
function ctf_bots:internal/brain/route_try
