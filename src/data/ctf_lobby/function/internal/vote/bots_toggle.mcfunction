# A click on the bots button: the bots are turned on / off for the match, every lobby player's
# button is redrawn
execute store success score Bots settings if score Bots settings matches 0
execute as @a[tag=lobby] run function ctf_lobby:internal/vote/bots_give
execute if score Bots settings matches 1 run tellraw @a[tag=lobby] [{"selector": "@s"}, {"text": " turned the bots ON: ", "color": "green"}, {"score": {"name": "Bots_count", "objective": "settings"}, "color": "green"}, {"text": " bots against all players", "color": "green"}]
execute if score Bots settings matches 0 run tellraw @a[tag=lobby] [{"selector": "@s"}, {"text": " turned the bots OFF", "color": "yellow"}]
