# Category buttons (registry PAGES); the active one glints
from registry:shop import PAGES

for i in range(len(PAGES)):
    page = PAGES[i]
    b = page["button"]
    execute if score @s shop_category matches (i + 1) run function ctf_shop:ui/button {slot: (b["slot"]), model: (b["model"]), name: (b["name"]), color: (b["color"]), glint: true}
    execute unless score @s shop_category matches (i + 1) run function ctf_shop:ui/button {slot: (b["slot"]), model: (b["model"]), name: (b["name"]), color: (b["color"]), glint: false}
