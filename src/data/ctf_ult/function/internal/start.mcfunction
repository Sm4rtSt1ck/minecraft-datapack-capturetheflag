from registry:ultimates import ULTIMATES

function ctf_flag:api/summon_flag {target: '@s[nbt={Inventory:[{id:"minecraft:magenta_banner"}]}]'}
clear @s magenta_banner
execute as @s run function ctf_flag:api/drop

scoreboard players reset @s ultimate

tag @s add ultimate

# The chosen ultimate (registry ULTIMATES, 0 - none)
for i in range(1, len(ULTIMATES)):
    execute if score @s ultimate_category matches (i) run function f"ctf_ult:internal/categories/{ULTIMATES[i]['id']}"

# The bar shows the time left of the ultimate
scoreboard players operation @s ult.dur = @s timer
function ctf_ult:internal/render
