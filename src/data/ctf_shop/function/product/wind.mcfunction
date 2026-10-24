# Wind charges: up to "batch" per purchase, at most the carry limit in the inventory, "each" per
# charge (registry shop / items)
from registry:shop import product
from registry:items import limit
from ctf_inv:lib import count
_wind = product("wind")

count(limit("wind")["pred"])
scoreboard players set #k shop.tmp limit("wind")["max"]
scoreboard players operation #k shop.tmp -= #n inv.tmp
execute if score #k shop.tmp matches (f"{_wind['batch'] + 1}..") run scoreboard players set #k shop.tmp _wind["batch"]
execute if score #k shop.tmp matches ..0 run return run function ctf_shop:feedback/wind_limit

scoreboard players operation #c shop.tmp = #k shop.tmp
scoreboard players set #p shop.tmp _wind["each"]
scoreboard players operation #c shop.tmp *= #p shop.tmp
execute unless score @s money >= #c shop.tmp run return run function ctf_shop:feedback/no_money
execute if score #n inv.tmp matches ..0 if items entity @s weapon.offhand * unless function ctf_inv:api/has_free_slot run return run function ctf_shop:feedback/no_space

execute store result storage ctf_shop:tmp wind.count int 1 run scoreboard players get #k shop.tmp
function ctf_inv:give/wind with storage ctf_shop:tmp wind
scoreboard players operation @s money -= #c shop.tmp
function ctf_shop:feedback/bought
return 1
