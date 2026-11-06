# As a bot: the intel of its enemy (bot.foe) known (younger than TEAM "known")? It gets the tag bk_foe
from registry:bots import TEAM
scoreboard players operation #who bots = @s bot.foe
execute as @e[type=marker, tag=bot_intel, scores={bk.age=(f"..{TEAM['known']}")}] if score @s bk.id = #who bots run tag @s add bk_foe
execute if entity @e[type=marker, tag=bk_foe] run return 1
return 0
