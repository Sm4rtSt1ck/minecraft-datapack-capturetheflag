from registry:shop import PAGES

# Player's own items that ended up in slots 9-35 are moved to the hotbar (or dropped),
# so the redraw below never destroys them
execute store result score #all shop.tmp if items entity @s inventory.* *
execute store result score #ui shop.tmp if items entity @s inventory.* *[custom_data~{ctf_ui:{}}]
execute if score #all shop.tmp > #ui shop.tmp at @s run function ctf_shop:internal/evacuate

# Removes every UI item (cursor, hotbar, offhand, armor, 2x2 crafting grid)
# and draws the current page from scratch. Client gets only the final state.
clear @s *[custom_data~{ctf_ui:{}}]

function ctf_shop:ui/base

execute unless score @s shop_category matches (f"1..{len(PAGES)}") run return 0
function ctf_shop:ui/menu
for i in range(len(PAGES)):
    page = PAGES[i]
    execute if score @s shop_category matches (i + 1) run function f"ctf_shop:page/{page['id']}/render"
