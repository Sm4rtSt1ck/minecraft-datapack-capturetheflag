# As an attack bot (bk_me), the flag not found yet (#fknown bots 0): the flag item (glowing) or a
# player carrying it: known; the placed flag within SEARCH "flag_sight" (across the map) with nothing
# in the way (a ray from the middle of the flag to the bot's eyes, see-through blocks pass): found
# (ctf_bots:internal/sense/flag_found). The spots near the bot are checked
from registry:bots import SEARCH
tag @e[type=marker, tag=bot_nav, distance=(f"..{SEARCH['checked']}")] add bot_chk
execute if entity @e[type=item, tag=bot_flag_item] run return run scoreboard players set #fknown bots 1
execute if entity @a[tag=bot_flag_player] run return run scoreboard players set #fknown bots 1
execute unless entity @e[type=armor_stand, tag=flag, distance=(f"..{SEARCH['flag_sight']}")] run return 0
scoreboard players set #step bots 0
execute at @n[type=armor_stand, tag=flag] positioned ~ ~0.6 ~ facing entity @s eyes positioned ^ ^ ^0.6 run function ctf_bots:internal/sense/flag_ray
