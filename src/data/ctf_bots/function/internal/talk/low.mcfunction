# As a bot that sees the player tagged bk_who with low hp now: "Steve is low: 4 hp"
execute unless function ctf_bots:internal/talk/ready run return 0
tellraw @a [{"text": "[", "color": "dark_gray"}, {"selector": "@s"}, {"text": "] ", "color": "dark_gray"}, {"selector": "@p[tag=bk_who]"}, {"text": " is low: ", "color": "white"}, {"score": {"name": "@p[tag=bk_who]", "objective": "health"}, "color": "red"}, {"text": " hp", "color": "red"}]
