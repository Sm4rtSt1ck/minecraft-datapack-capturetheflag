# Keep costs in sync with render.mcfunction

execute if score #slot shop.tmp matches 18 run return run function ctf_shop:product/armor {cost: 150, material: "golden"}
execute if score #slot shop.tmp matches 20 run return run function ctf_shop:product/armor {cost: 250, material: "iron"}
# execute if score #slot shop.tmp matches 22 run return run function ctf_shop:product/armor {cost: 1500, material: "netherite"}

execute if score #slot shop.tmp matches 24 run return run function ctf_shop:product/shield
