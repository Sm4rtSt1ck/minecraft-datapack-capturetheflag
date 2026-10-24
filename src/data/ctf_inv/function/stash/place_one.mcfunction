# Runs as a buffer item. Layout:
#   1 primary | 2 secondary | 3 grenade | 4-6 free | 7 ammo | 8 stick/flag | 9 ultimate
#   offhand: shield / wind charge / totem / fireworks only
from registry:items import GROUPS
from ctf_inv:lib import group_pred

# UI items are never kept
execute if items entity @s contents *[custom_data~{ctf_ui:{}}] run return run kill @s
execute if items entity @s contents *[custom_data~{ctf_craft:{}}] run return run kill @s
execute if items entity @s contents *[custom_data~{action:"exit"}] run return run kill @s
execute if items entity @s contents *[custom_data~{tags:["ultimate"]}] run return run kill @s

# Fixed items: only one copy in its own slot, they are given back automatically
execute if items entity @s contents carrot_on_a_stick[custom_data~{action:"ultimate"}] run return run function ctf_inv:stash/to_or_kill {slot: "hotbar.8"}
execute if items entity @s contents stick if function ctf_inv:api/flag_broken run return run kill @s
execute if items entity @s contents stick if entity @a[tag=ctf.stash_owner, tag=!attack] run return run kill @s
execute if items entity @s contents stick run return run function ctf_inv:stash/to_or_kill {slot: "hotbar.7"}

# Slot-bound items (registry GROUPS)
for g in GROUPS:
    if g["slot"]:
        execute if items entity @s contents group_pred(g["group"]) run return run function ctf_inv:stash/to {slot: g["slot"]}
execute if items entity @s contents *[custom_data~{ctf_ammo:1b}] run return run function ctf_inv:stash/to_ammo
execute if items entity @s contents magenta_banner run return run function ctf_inv:stash/to_flag
execute if items entity @s contents armor_stand run return run function ctf_inv:stash/to_flag

# Offhand items: offhand first, then a free slot
execute if items entity @s contents #ctf_inv:offhand unless items entity @a[tag=ctf.stash_owner, limit=1] weapon.offhand * run return run function ctf_inv:stash/to {slot: "weapon.offhand"}

# Everything else: free slots 4-6
function ctf_inv:stash/to_free
