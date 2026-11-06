# As a bot that sees the player tagged bk_who near its teammate tagged bk_warned, who doesn't face
# him (always said): "Max, Steve behind you!"
scoreboard players set #talk bots 10
tellraw @a [{"text": "[", "color": "dark_gray"}, {"selector": "@s"}, {"text": "] ", "color": "dark_gray"}, {"selector": "@n[type=zombified_piglin, tag=bk_warned]", "color": "white"}, {"text": ", ", "color": "white"}, {"selector": "@p[tag=bk_who]"}, {"text": " behind you!", "color": "gold"}]
