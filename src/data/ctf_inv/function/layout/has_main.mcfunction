# 1 if the player already owns a main weapon (the default golden sword doesn't count: it is replaced)
from ctf_inv:lib import count
count('*[custom_data~{tags:["main weapon"]}]')
scoreboard players operation #m inv.tmp = #n inv.tmp
count('golden_sword[custom_data~{tags:["main weapon"]}]')
scoreboard players operation #m inv.tmp -= #n inv.tmp
execute if score #m inv.tmp matches 1.. run return 1
return 0
