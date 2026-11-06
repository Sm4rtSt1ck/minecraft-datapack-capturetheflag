# Freeze start, as a bot: it buys with the money of its wallet (like the players of its situation:
# ctf_bots:internal/learn/bot_buy; else ctf_bots:buy: a plan at random),
# the rest goes back into the wallet; @s money stays 0 (its gains are flushed into the wallet)
scoreboard players operation #me bots = @s bot.n
execute as @e[type=marker, tag=bot_wallet] if score @s bot.n = #me bots run tag @s add bot_mywallet
scoreboard players operation @s money = @e[type=marker, tag=bot_mywallet, limit=1] money
execute unless function ctf_bots:internal/learn/bot_buy run function ctf_bots:internal/buy/pick
# What the bots learn from their purchases: its context and kills now on its wallet (ctf_bots:internal/learn/bot_round)
execute if score Bots_learn settings matches 1 as @e[type=marker, tag=bot_mywallet] run function ctf_bots:internal/learn/wallet_start
scoreboard players operation @e[type=marker, tag=bot_mywallet] money = @s money
scoreboard players set @s money 0
tag @e[type=marker, tag=bot_mywallet] remove bot_mywallet
