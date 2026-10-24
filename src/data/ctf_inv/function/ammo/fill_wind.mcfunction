# The mace comes with 10 wind charges: filled up to 10 (never above)
function ctf_inv:limits/count {pred: '*[custom_data~{wpn:"mace"}]'}
execute if score #n inv.tmp matches ..0 run return 0
function ctf_inv:limits/count {pred: 'wind_charge'}
scoreboard players set #m inv.tmp 10
scoreboard players operation #m inv.tmp -= #n inv.tmp
execute if score #m inv.tmp matches ..0 run return 0
execute store result storage ctf_inv:tmp wind.count int 1 run scoreboard players get #m inv.tmp
function ctf_inv:give/wind with storage ctf_inv:tmp wind
