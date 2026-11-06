# A bot off a narrow link: its speed again
execute unless entity @s[tag=bot_slow] run return 0
tag @s remove bot_slow
attribute @s minecraft:movement_speed modifier remove ctf_bots:narrow
