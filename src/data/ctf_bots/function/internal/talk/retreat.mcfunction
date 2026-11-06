# As a bot falling back (not again within DUEL "say" thinks): "Falling back, 5 hp"
from registry:bots import DUEL
execute if score @s bot.say matches 1.. run return 0
execute unless function ctf_bots:internal/talk/free run return 0
scoreboard players set @s bot.say (DUEL["say"])
tellraw @a [{"text": "[", "color": "dark_gray"}, {"selector": "@s"}, {"text": "] ", "color": "dark_gray"}, {"text": "Falling back, ", "color": "white"}, {"score": {"name": "#hp", "objective": "bots"}, "color": "red"}, {"text": " hp", "color": "red"}]
