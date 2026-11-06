# As a defense bot that checked the last known place of its enemy (intel tagged bk_foe), nobody there
execute unless function ctf_bots:internal/talk/free run return 0
tellraw @a [{"text": "[", "color": "dark_gray"}, {"selector": "@s"}, {"text": "] ", "color": "dark_gray"}, {"text": "Nobody here, back to my spot", "color": "white"}]
