# Can a bot talk now? (1: not within TALK "gap" of the last bot message; the gap starts again)
from registry:bots import TALK
execute if score #talk bots matches 1.. run return 0
scoreboard players set #talk bots (TALK["gap"])
return 1
