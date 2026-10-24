# Tags ctf.can.<kind>: the player may pick up an item of this kind from the ground
# (the kinds: registry/items.bolt)
from registry:items import GROUPS, LIMITS
from ctf_inv:lib import count

for g in GROUPS:
    tag @s remove f"ctf.can.{g['kind']}"
tag @s remove ctf.can.free
tag @s remove ctf.can.off
tag @s remove ctf.can.flag
for l in LIMITS:
    if "kind" in l:
        tag @s remove f"ctf.can.{l['kind']}"
tag @s remove ctf.can.trap_def
tag @s remove ctf.can.trap_att

# Groups: only if the player has no item of the group
for g in GROUPS:
    execute unless function f"ctf_inv:layout/has_{g['kind']}" run tag @s add f"ctf.can.{g['kind']}"
execute if function ctf_inv:api/has_free_slot run tag @s add ctf.can.free
execute unless items entity @s weapon.offhand * run tag @s add ctf.can.off
execute if entity @s[tag=ctf.can.free] run tag @s add ctf.can.off
# Limited items: only below the carry limit (otherwise they would be dropped right away),
# into a free slot / the offhand, or onto a stack the player already has
for l in LIMITS:
    if "kind" in l:
        count(l["pred"])
        execute if score #n inv.tmp matches (f"..{l['max'] - 1}") if entity @s[tag=f"ctf.can.{l['into']}"] run tag @s add f"ctf.can.{l['kind']}"
        if l["max"] > 1:
            execute if score #n inv.tmp matches (f"1..{l['max'] - 1}") run tag @s add f"ctf.can.{l['kind']}"

# Ammo
function ctf_inv:ammo/caps_all

# Traps: only for their team
execute if entity @s[tag=defense, tag=ctf.can.free] run tag @s add ctf.can.trap_def
execute if entity @s[tag=attack, tag=ctf.can.free] run tag @s add ctf.can.trap_att

# Flag in freeze: any defender (the flag pushes out whatever lies in slot 8)
execute if entity @s[tag=defense] if score game state = freeze state run tag @s add ctf.can.flag
