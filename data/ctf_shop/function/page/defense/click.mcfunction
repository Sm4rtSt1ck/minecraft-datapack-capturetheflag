# Keep costs in sync with render.mcfunction

execute if score #slot shop.tmp matches 18 run return run function ctf_shop:product/armor {cost: 150, material: "golden", max: 112}
execute if score #slot shop.tmp matches 20 run return run function ctf_shop:product/armor {cost: 250, material: "iron", max: 240}
# execute if score #slot shop.tmp matches 22 run return run function ctf_shop:product/armor {cost: 1500, material: "netherite"}
execute if score #slot shop.tmp matches 22 run return run function ctf_shop:product/feather_falling_boots {cost: 50}
execute if score #slot shop.tmp matches 24 run return run function ctf_shop:product/shield
execute if score #slot shop.tmp matches 26 run return run function ctf_shop:product/totem
