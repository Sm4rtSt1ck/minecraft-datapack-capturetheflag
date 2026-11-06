# As a bot alive, the player tagged bk_who just killed one of its team (always said): "Steve got
# one of us: 9 hp left, assault rifle"
scoreboard players set #talk bots 10
tellraw @a [{"text": "[", "color": "dark_gray"}, {"selector": "@s"}, {"text": "] ", "color": "dark_gray"}, {"selector": "@p[tag=bk_who]"}, {"text": " got one of us: ", "color": "white"}, {"score": {"name": "@p[tag=bk_who]", "objective": "health"}, "color": "red"}, {"text": " hp left, ", "color": "red"}, {"nbt": "wpn", "storage": "ctf_bots:talk", "color": "yellow"}]
