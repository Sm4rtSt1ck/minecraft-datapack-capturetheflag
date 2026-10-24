from registry:items import GROUPS
from ctf_inv:lib import group_pred

# 1-3 - primary weapon, secondary weapon, grenade (registry GROUPS)
for g in GROUPS:
    if g["slot"]:
        execute if items entity @s g["slot"] * unless items entity @s g["slot"] group_pred(g["group"]) run function ctf_inv:api/stash {slot: g["slot"]}
# 4-6 - anything that isn't bound to its own slot
execute if items entity @s hotbar.3 #ctf_inv:bound run function ctf_inv:api/stash {slot: "hotbar.3"}
execute if items entity @s hotbar.3 *[custom_data~{bind:1b}] run function ctf_inv:api/stash {slot: "hotbar.3"}
execute if items entity @s hotbar.4 #ctf_inv:bound run function ctf_inv:api/stash {slot: "hotbar.4"}
execute if items entity @s hotbar.4 *[custom_data~{bind:1b}] run function ctf_inv:api/stash {slot: "hotbar.4"}
execute if items entity @s hotbar.5 #ctf_inv:bound run function ctf_inv:api/stash {slot: "hotbar.5"}
execute if items entity @s hotbar.5 *[custom_data~{bind:1b}] run function ctf_inv:api/stash {slot: "hotbar.5"}
# 7 - ammo of the ranged weapon
execute if items entity @s hotbar.6 * unless items entity @s hotbar.6 *[custom_data~{ctf_ammo:1b}] run function ctf_inv:api/stash {slot: "hotbar.6"}
# 8 - stick (attack) / flag
execute if items entity @s hotbar.7 * unless items entity @s hotbar.7 #ctf_inv:flag_slot run function ctf_inv:api/stash {slot: "hotbar.7"}
# 9 - ultimate
execute if items entity @s hotbar.8 * unless items entity @s hotbar.8 carrot_on_a_stick[custom_data~{action:"ultimate"}] run function ctf_inv:api/stash {slot: "hotbar.8"}
# Offhand
execute if items entity @s weapon.offhand * unless items entity @s weapon.offhand #ctf_inv:offhand run function ctf_inv:api/stash {slot: "weapon.offhand"}
