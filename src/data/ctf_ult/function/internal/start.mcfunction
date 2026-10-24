function ctf_flag:api/summon_flag {target: '@s[nbt={Inventory:[{id:"minecraft:magenta_banner"}]}]'}
clear @s magenta_banner
execute as @s run function ctf_flag:api/drop

scoreboard players reset @s ultimate

tag @s add ultimate

execute if score @s ultimate_category matches 1 run function ctf_ult:internal/categories/ghost
execute if score @s ultimate_category matches 2 run function ctf_ult:internal/categories/scale
execute if score @s ultimate_category matches 3 run function ctf_ult:internal/categories/trident
execute if score @s ultimate_category matches 4 run function ctf_ult:internal/categories/bomber
execute if score @s ultimate_category matches 5 run function ctf_ult:internal/categories/foot_eater

# The bar shows the time left of the ultimate
scoreboard players operation @s ult.dur = @s timer
function ctf_ult:internal/render
