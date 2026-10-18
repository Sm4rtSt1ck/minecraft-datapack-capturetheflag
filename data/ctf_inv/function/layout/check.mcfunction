# Runs as a player whose inventory has changed
tag @s remove ctf.inv_dirty

# The ultimate (ghost, trident...) swaps the inventory, don't touch it
execute if entity @s[tag=ultimate] run return 0
# The inventory was just closed: wait until ctf_inv:exit/after_close (keep the tag)
execute if entity @s[tag=ctf.exit_closed] run return run tag @s add ctf.inv_dirty

# Everything in a wrong slot is taken out and put back by the rules
function ctf_inv:layout/take_misplaced
execute if entity @e[type=item, tag=ctf.buf, limit=1] run function ctf_inv:api/place

# Carry limits: extra grenades, potions, chorus... are dropped
function ctf_inv:limits/enforce

# Stick and ultimate are always in their slots
function ctf_inv:layout/ensure

# What the player may pick up from the ground (see ctf_inv:ground/tick)
function ctf_inv:layout/caps
