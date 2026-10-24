# Limited per round (ctf_shop:limits/chorus). The cost: registry shop
# The item itself comes from ctf_inv:give/chorus (the only chorus item of the game)
from registry:shop import product
_cost = product("chorus")["cost"]

execute unless function ctf_shop:limits/chorus run return 0
execute unless score @s money matches (f"{_cost}..") run return run function ctf_shop:feedback/no_money
execute store result score #ok shop.tmp run function ctf_shop:internal/space {offhand: 0, free: 1}
execute if score #ok shop.tmp matches 0 run return run function ctf_shop:feedback/no_space

function ctf_inv:give/chorus {count: 1}
scoreboard players remove @s money _cost
scoreboard players add @s shop.lim.chorus 1
function ctf_shop:feedback/bought
return 1
