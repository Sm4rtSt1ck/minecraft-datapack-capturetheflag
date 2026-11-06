# Freeze start, as a bot: it buys with the money of its wallet (ctf_bots:buy: a plan at random),
# the rest goes back into the wallet; @s money stays 0 (its gains are flushed into the wallet)
scoreboard players operation #me bots = @s bot.n
execute as @e[type=marker, tag=bot_wallet] if score @s bot.n = #me bots run tag @s add bot_mywallet
scoreboard players operation @s money = @e[type=marker, tag=bot_mywallet, limit=1] money
function ctf_bots:internal/buy/pick
scoreboard players operation @e[type=marker, tag=bot_mywallet] money = @s money
scoreboard players set @s money 0
tag @e[type=marker, tag=bot_mywallet] remove bot_mywallet
