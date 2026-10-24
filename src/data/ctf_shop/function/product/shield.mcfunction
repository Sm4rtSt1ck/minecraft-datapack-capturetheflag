# Limited per round (ctf_shop:limits/shield). The cost and the banner of each team: registry shop
from registry:shop import product
_shield = product("shield")

execute unless function ctf_shop:limits/shield run return 0
scoreboard players set #ok shop.tmp 0
for team in _shield["looks"]:
    execute if entity @s[tag=f"{team}"] store result score #ok shop.tmp run function ctf_shop:buy/group {item: "shield", name: '{"text": "Shield"}', count: 1, cost: (_shield["cost"]), group: "shield or totem", wpn: "", bind: "0b", offhand: 1, free: 1, components: (f"damage=316, {_shield['looks'][team]['extra']}")}
execute if score #ok shop.tmp matches 1 run scoreboard players add @s shop.lim.shield 1
return run scoreboard players get #ok shop.tmp
