# As a bot throwing the flag down (always said): "Kate, catch the flag!"
scoreboard players set #talk bots 10
tellraw @a [{"text": "[", "color": "dark_gray"}, {"selector": "@s"}, {"text": "] ", "color": "dark_gray"}, {"selector": "@n[type=zombified_piglin, tag=bot_rcv]"}, {"text": ", catch the flag!", "color": "gold"}]
