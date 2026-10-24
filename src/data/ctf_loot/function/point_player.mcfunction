# Runs as an attacker: his crate, with the rarity of his best task (rank = number in registry RARITIES). x, y, z
from registry:loot import RARITIES

tag @s remove ctf.loot_pending
for i in range(len(RARITIES)):
    execute if score @s loot.best matches (i + 1) run data modify storage ctf_loot:tmp p.rarity set value (RARITIES[i]["id"])
function ctf_loot:drop_for with storage ctf_loot:tmp p
tellraw @s {"text": "Your loot crate is falling onto your base!", "color": "gold"}
