# As a bot, positioned at a player it chases: near (ctf_bots:internal/nav/chase_box) and it sees him
# (bk_seen: its sight at this think, see-through blocks too) or a free line from him to its eyes? (1)
from registry:bots import NAV
execute unless function ctf_bots:internal/nav/chase_box run return 0
execute if entity @p[tag=bk_seen, distance=..0.1] run return 1
scoreboard players set #los nav 0
scoreboard players set #step nav 0
execute positioned ~ ~1 ~ facing entity @s eyes run function ctf_bots:internal/nav/los_me
return run scoreboard players get #los nav
