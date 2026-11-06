# A block down while there is no floor under it (#fh nav: blocks fallen)
from registry:bots import NAV
scoreboard players add #fh nav 1
execute if score #fh nav matches (f"{NAV['max_fall'] + 1}..") run return 0
execute unless block ~ ~-1 ~ #ctf_bots:gap run return run function ctf_bots:internal/nav/fall_land
execute positioned ~ ~-1 ~ run function ctf_bots:internal/nav/fall_down
