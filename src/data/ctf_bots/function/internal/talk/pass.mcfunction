# As a bot handing the flag over (always said): "Kate, take the flag!"
scoreboard players set #talk bots 10
tellraw @a [{"text": "[", "color": "dark_gray"}, {"selector": "@s"}, {"text": "] ", "color": "dark_gray"}, {"selector": "@n[type=zombified_piglin, tag=bot_rcv]"}, {"text": ", take the flag!", "color": "gold"}]
