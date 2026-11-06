# As a bot whose way along the graph is blocked: "Can't get through here, trying another way"
execute unless function ctf_bots:internal/talk/free run return 0
tellraw @a [{"text": "[", "color": "dark_gray"}, {"selector": "@s"}, {"text": "] ", "color": "dark_gray"}, {"text": "Can't get through here, trying another way", "color": "white"}]
