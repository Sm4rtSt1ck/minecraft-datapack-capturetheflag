# As a sly defender holding its spot in ambush (#dist bots: the enemy tagged bot_cand): it shows itself
# only when he is within TRICKS "ambush" or near the flag (1)
from registry:bots import TRICKS, TEAM
execute if score #dist bots matches (f"..{TRICKS['ambush']}") run return 1
execute at @n[type=armor_stand, tag=flag] if entity @p[tag=bot_cand, distance=(f"..{TEAM['anchor']}")] run return 1
return 0
