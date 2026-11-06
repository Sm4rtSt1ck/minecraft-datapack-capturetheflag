# As a bot taking cover from a sniper (intel bk_snp; not again within DUEL "say" thinks): "Sniper! Taking cover"
from registry:bots import DUEL
execute if score @s bot.say matches 1.. run return 0
execute unless function ctf_bots:internal/talk/free run return 0
scoreboard players set @s bot.say (DUEL["say"])
tellraw @a [{"text": "[", "color": "dark_gray"}, {"selector": "@s"}, {"text": "] ", "color": "dark_gray"}, {"text": "Sniper! Taking cover", "color": "gold"}]
