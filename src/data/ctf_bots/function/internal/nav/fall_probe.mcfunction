# Is there a floor below here within NAV "max_fall" blocks? (1)
from registry:bots import NAV
for _h in range(1, NAV["max_fall"] + 1):
    execute unless block ~ (f"~-{_h}") ~ #ctf_bots:gap run return 1
return 0
