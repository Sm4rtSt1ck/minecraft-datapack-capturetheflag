# As a bot starting to fall back (learning on), a wind charge left, on the ground: where players used
# wind charges (a point within 6 with lrn.ws LEARN "wind_min"+) or its enemy within 4: a wind charge jump
# up and away from him (the gust, a charge spent)
from registry:bots import LEARN
execute unless score Bots_learn settings matches 1 run return 0
execute unless score @s bot.wind matches 1.. run return 0
execute unless predicate {condition: "minecraft:entity_properties", entity: "this", predicate: {flags: {is_on_ground: true}}} run return 0
scoreboard players set #ok lrn 0
execute if entity @e[type=marker, tag=lrn_pt, distance=..6, scores={lrn.ws=(f"{LEARN['wind_min']}..")}] run scoreboard players set #ok lrn 1
execute if entity @p[tag=bot_want, distance=..4] run scoreboard players set #ok lrn 1
execute if score #ok lrn matches 0 run return 0
scoreboard players remove @s bot.wind 1
tag @s add bot_jumper
execute facing entity @p[tag=bot_want] feet rotated ~180 0 run summon marker ^ ^ ^1 {Tags: ["bot_vec"]}
function ctf_bots:internal/combat/motion {speed: "0.0005", entity: "zombified_piglin", tag: "bot_jumper"}
data modify entity @s Motion[1] set value 0.9d
tag @s remove bot_jumper
tag @s add bot_fall
particle minecraft:gust_emitter_small ~ ~ ~ 0 0 0 0 1 force @a[tag=!lobby]
playsound minecraft:entity.wind_charge.wind_burst neutral @a[tag=!lobby] ~ ~ ~ 1 1
