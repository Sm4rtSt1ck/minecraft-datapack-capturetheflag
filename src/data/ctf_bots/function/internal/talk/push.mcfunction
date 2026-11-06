# As a bot pushing a weak enemy (bot_want; not again within DUEL "say" thinks): "Steve is weak, pushing!"
from registry:bots import DUEL
execute if score @s bot.say matches 1.. run return 0
execute unless function ctf_bots:internal/talk/free run return 0
scoreboard players set @s bot.say (DUEL["say"])
tellraw @a [{"text": "[", "color": "dark_gray"}, {"selector": "@s"}, {"text": "] ", "color": "dark_gray"}, {"selector": "@p[tag=bot_want]"}, {"text": " is weak, pushing!", "color": "gold"}]
