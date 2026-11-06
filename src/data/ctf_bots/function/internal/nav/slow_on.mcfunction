# A bot on a narrow link: slower (NAV "narrow": it doesn't overshoot a turn and fall off)
from registry:bots import NAV
execute if entity @s[tag=bot_slow] run return 0
tag @s add bot_slow
attribute @s minecraft:movement_speed modifier add ctf_bots:narrow (NAV["narrow"]) add_multiplied_total
