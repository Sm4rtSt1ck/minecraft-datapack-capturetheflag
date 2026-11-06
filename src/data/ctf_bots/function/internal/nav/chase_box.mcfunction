# As a bot, positioned at a player it chases: within NAV "chase" blocks and NAV "chase_up" up / down? (1)
from registry:bots import NAV
execute positioned (f"~-{NAV['chase']}") (f"~-{NAV['chase_up']}") (f"~-{NAV['chase']}") if entity @s[dx=(NAV["chase"] * 2), dy=(NAV["chase_up"] * 2), dz=(NAV["chase"] * 2)] run return 1
return 0
