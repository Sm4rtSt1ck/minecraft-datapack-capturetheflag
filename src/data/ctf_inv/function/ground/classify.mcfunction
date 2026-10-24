# Runs once per item entity (the first tick it exists). The kinds: registry/items.bolt
from registry:items import GROUPS, AMMO, LIMITS
from ctf_inv:lib import group_pred, ammo_pred

tag @s add ctf.seen

# UI and fixed items can't be dropped
execute if items entity @s contents *[custom_data~{ctf_ui:{}}] run return run kill @s
execute if items entity @s contents *[custom_data~{ctf_craft:{}}] run return run kill @s
execute if items entity @s contents *[custom_data~{action:"exit"}] run return run kill @s
execute if items entity @s contents *[custom_data~{action:"ultimate"}] run return run kill @s
execute if items entity @s contents stick run return run kill @s
# Loot crate rewards belong to their owner (ctf_inv:ground/may_take)
execute if items entity @s contents *[custom_data~{ctf_bound:1b}] run function ctf_inv:ground/bound

# Leggings / boots of a set exist only while worn (the set is its chestplate)
execute if items entity @s contents *[custom_data~{ctf_part:1b}] run return run kill @s

# Armor is never picked up into the inventory: it is put on straight from the ground (ctf_inv:ground/wear)
execute if items entity @s contents *[custom_data~{ctf_set:{}}] run return run function ctf_inv:ground/armor {kind: "armor"}
execute if items entity @s contents #ctf_inv:helmets run return run function ctf_inv:ground/armor {kind: "helmet"}

# Restricted pickup (see ctf_inv:ground/tick)
execute if items entity @s contents magenta_banner run return run tag @s add ctf.r.banner
execute if items entity @s contents armor_stand run return run tag @s add ctf.r.flag
for g in GROUPS:
    execute if items entity @s contents group_pred(g["group"]) run return run tag @s add f"ctf.r.{g['kind']}"
for a in AMMO:
    execute if items entity @s contents ammo_pred(a["id"]) run return run tag @s add f"ctf.r.ammo_{a['id']}"
# Limited items with their own kind (their predicates don't overlap the trap items)
for l in LIMITS:
    if "kind" in l:
        execute if items entity @s contents l["pred"] run return run tag @s add f"ctf.r.{l['kind']}"
# Traps: defenders' traps only for defenders, the attackers' detector only for attackers
execute if items entity @s contents frog_spawn_egg run return run tag @s add ctf.r.trap_def
execute if items entity @s contents carrot_on_a_stick[custom_data~{tags:["trap"]}] run return run tag @s add ctf.r.trap_att
execute if items entity @s contents #ctf_inv:offhand run return run tag @s add ctf.r.off
tag @s add ctf.r.free
