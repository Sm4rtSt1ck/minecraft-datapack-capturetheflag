from registry:shop import PAGES

# Give back a player's own item if it was swapped into the shop slot
function ctf_shop:internal/rescue with storage ctf_shop:tmp

# Locked inventory: nothing to buy
execute unless score @s shop_category matches (f"1..{len(PAGES)}") run return 0

# Menu
for i in range(len(PAGES)):
    page = PAGES[i]
    execute if score #slot shop.tmp matches (page["button"]["slot"]) run return run function ctf_shop:internal/switch {category: (i + 1)}

# Products
for i in range(len(PAGES)):
    page = PAGES[i]
    execute if score @s shop_category matches (i + 1) run return run function f"ctf_shop:page/{page['id']}/click"
