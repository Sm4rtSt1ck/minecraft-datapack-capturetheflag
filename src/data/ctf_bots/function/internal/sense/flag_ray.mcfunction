# A step of 1 block of the ray from the flag to the bot's eyes: reached (within 1 of its eyes): found;
# a block in the way (not see-through): not seen
from registry:bots import SEARCH
execute positioned ~ ~-1.7 ~ if entity @s[distance=..1] run return run function ctf_bots:internal/sense/flag_found
execute unless block ~ ~ ~ #ctf_bots:see run return 0
scoreboard players add #step bots 1
execute if score #step bots matches (f"{SEARCH['flag_sight'] + 2}..") run return 0
execute positioned ^ ^ ^1 run function ctf_bots:internal/sense/flag_ray
