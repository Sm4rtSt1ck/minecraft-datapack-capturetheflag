# #ctf:on/freeze_start
from registry:traps import TRAPS

# A trap kind can be bought again when no defender carries one (registry TRAPS; rare event: nbt is fine)
for t in TRAPS:
    execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", (f"trap.{t['id']}")]}}}]}] run scoreboard players set f"{t['id']}_trap" bought.item 0

execute as @a[tag=player] run function ctf_shop:open
# Round purchase limits (grenade, totem, shield, potions, chorus)
execute as @a[tag=player] at @s run function ctf_shop:limits/reset
