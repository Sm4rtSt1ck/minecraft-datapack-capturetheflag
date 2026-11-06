# As a bot about to fight the player tagged bot_want, 3..8 blocks away (learning on), 2+ wind charges, at
# a place where players used wind charges in fights (a point within 6 with lrn.wf LEARN "wind_min"+), not
# again within 3 s (bot.cd2): a wind charge thrown at him (it knocks him back)
from registry:bots import LEARN
execute unless score Bots_learn settings matches 1 run return 0
execute unless score @s bot.wind matches 2.. run return 0
execute if score @s bot.cd2 matches 1.. run return 0
execute unless score #dist bots matches 3..8 run return 0
execute unless entity @e[type=marker, tag=lrn_pt, distance=..6, scores={lrn.wf=(f"{LEARN['wind_min']}..")}] run return 0
scoreboard players remove @s bot.wind 1
scoreboard players set @s bot.cd2 12
execute anchored eyes facing entity @p[tag=bot_want] eyes positioned ^ ^ ^0.8 run summon wind_charge ~ ~ ~ {Tags: ["bot_wc"]}
execute anchored eyes facing entity @p[tag=bot_want] eyes positioned ^ ^ ^1.8 run summon marker ~ ~ ~ {Tags: ["bot_vec"]}
function ctf_bots:internal/combat/motion {speed: "0.0015", entity: "wind_charge", tag: "bot_wc"}
data modify entity @n[type=wind_charge, tag=bot_wc] Owner set from entity @s UUID
tag @e[type=wind_charge, tag=bot_wc] remove bot_wc
playsound minecraft:entity.wind_charge.throw neutral @a[tag=!lobby] ~ ~ ~ 1 1
