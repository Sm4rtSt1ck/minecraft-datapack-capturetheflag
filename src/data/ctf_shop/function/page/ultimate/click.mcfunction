# Keep costs in sync with render.mcfunction

execute if score #slot shop.tmp matches 18 run return run function ctf_shop:buy/ultimate {category: 1, cost: 0}
execute if score #slot shop.tmp matches 20 run return run function ctf_shop:buy/ultimate {category: 2, cost: 0}
execute if score #slot shop.tmp matches 22 run return run function ctf_shop:buy/ultimate {category: 3, cost: 0}
execute if score #slot shop.tmp matches 24 run return run function ctf_shop:buy/ultimate {category: 4, cost: 0}
execute if score #slot shop.tmp matches 26 run return run function ctf_shop:buy/ultimate {category: 5, cost: 0}
