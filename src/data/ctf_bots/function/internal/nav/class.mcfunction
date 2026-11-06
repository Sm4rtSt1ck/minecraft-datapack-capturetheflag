# As a bot: its class for the fields (#cls nav): 0 with a wind charge (soft landings, wind charge jumps),
# 1 without (ctf_bots:internal/nav/link_x)
scoreboard players set #cls nav 1
execute if score @s bot.wind matches 1.. run scoreboard players set #cls nav 0
