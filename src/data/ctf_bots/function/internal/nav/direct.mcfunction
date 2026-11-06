# As a bot, positioned where it must go: near (NAV "direct" blocks, 1.5 up / down) and in sight? (1)
from registry:bots import NAV
execute positioned (f"~-{NAV['direct']}") ~-1.5 (f"~-{NAV['direct']}") unless entity @s[dx=(NAV["direct"] * 2), dy=3, dz=(NAV["direct"] * 2)] run return 0
scoreboard players set #los nav 0
scoreboard players set #step nav 0
execute positioned ~ ~1 ~ facing entity @s eyes run function ctf_bots:internal/nav/los_me
return run scoreboard players get #los nav
