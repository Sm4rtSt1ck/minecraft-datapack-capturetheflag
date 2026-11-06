# As a bot breaching a wall (always said): "Breaching the wall to Steve!"
scoreboard players set #talk bots 10
tellraw @a [{"text": "[", "color": "dark_gray"}, {"selector": "@s"}, {"text": "] ", "color": "dark_gray"}, {"text": "Breaching the wall to ", "color": "gold"}, {"selector": "@p[tag=bot_jt]"}, {"text": "!", "color": "gold"}]
