# Give back a player's own item if it was swapped into the shop slot
function ctf_shop:internal/rescue with storage ctf_shop:tmp

# Locked inventory: nothing to buy
execute unless score @s shop_category matches 1..5 run return 0

# Menu
execute if score #slot shop.tmp matches 9 run return run function ctf_shop:internal/switch {category: 1}
execute if score #slot shop.tmp matches 11 run return run function ctf_shop:internal/switch {category: 2}
execute if score #slot shop.tmp matches 13 run return run function ctf_shop:internal/switch {category: 3}
execute if score #slot shop.tmp matches 15 run return run function ctf_shop:internal/switch {category: 4}
execute if score #slot shop.tmp matches 17 run return run function ctf_shop:internal/switch {category: 5}

# Products
execute if score @s shop_category matches 1 run return run function ctf_shop:page/weapons/click
execute if score @s shop_category matches 2 run return run function ctf_shop:page/defense/click
execute if score @s shop_category matches 3 run return run function ctf_shop:page/stuff/click
execute if score @s shop_category matches 4 run return run function ctf_shop:page/traps/click
execute if score @s shop_category matches 5 run return run function ctf_shop:page/ultimate/click
