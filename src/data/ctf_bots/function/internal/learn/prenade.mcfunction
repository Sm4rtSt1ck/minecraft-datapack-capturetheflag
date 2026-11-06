# As an attack bot with a grenade and no target, within 28 of the flag (learning on): at random (1 in
# LEARN "prenade" a think, not again within 10 s: bot.pn) a grenade at the point in the grenade range where
# players threw grenades / defenders stood the most (lrn.nd x 2 + lrn.hd, 20+): where a defender may hide
from registry:bots import LEARN, GRENADE
execute unless score Bots_learn settings matches 1 run return 0
execute if score @s bot.pn matches 1.. run return 0
execute unless entity @e[type=armor_stand, tag=flag, distance=..28] run return 0
execute unless predicate {condition: "minecraft:random_chance", chance: (1.0 / LEARN["prenade"])} run return 0
scoreboard players set #best lrn 19
execute as @e[type=marker, tag=lrn_pt, distance=(f"{GRENADE['min']}..{GRENADE['max']}")] run function ctf_bots:internal/learn/nade_value
execute unless entity @e[type=marker, tag=lrn_best] run return 0
tag @e[type=marker, tag=lrn_best] add bot_nt
function ctf_bots:internal/combat/grenade
tag @e[type=marker, tag=lrn_best] remove bot_nt
tag @e[type=marker, tag=lrn_best] remove lrn_best
scoreboard players set @s bot.pn 40
