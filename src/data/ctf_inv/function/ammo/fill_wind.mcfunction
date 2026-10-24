# The mace comes with 10 wind charges: filled up to the carry limit (registry LIMITS), never above
from registry:items import limit
from ctf_inv:lib import count, wpn_pred

count(wpn_pred("mace"))
execute if score #n inv.tmp matches ..0 run return 0
count(limit("wind")["pred"])
scoreboard players set #m inv.tmp limit("wind")["max"]
scoreboard players operation #m inv.tmp -= #n inv.tmp
execute if score #m inv.tmp matches ..0 run return 0
execute store result storage ctf_inv:tmp wind.count int 1 run scoreboard players get #m inv.tmp
function ctf_inv:give/wind with storage ctf_inv:tmp wind
