# Hurry (#hurry bots 1): the round time left < the breaker's way to the flag and from the flag to the
# delivery point (TEAM "speed" ticks a block) + TEAM "break" + "margin"
from registry:bots import TEAM
scoreboard players set #hurry bots 0
scoreboard players set #path bots 0
execute as @e[type=zombified_piglin, tag=bot_brk, limit=1] at @n[type=armor_stand, tag=flag] run function ctf_bots:internal/team/path
scoreboard players operation #eta bots = #path bots
scoreboard players set #dist bots 0
execute at @n[type=armor_stand, tag=flag] as @n[type=armor_stand, tag=win_trigger] run function ctf_bots:internal/team/dist
scoreboard players operation #eta bots += #dist bots
scoreboard players set #k bots (TEAM["speed"])
scoreboard players operation #eta bots *= #k bots
scoreboard players add #eta bots (TEAM["break"] + TEAM["margin"])
execute if score round timer < #eta bots run scoreboard players set #hurry bots 1
