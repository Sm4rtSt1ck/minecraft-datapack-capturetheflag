# Advancement reward: the player's inventory has changed.
# The layout is checked on the next ctf_inv:tick (only for such players).
tag @s add ctf.inv_dirty
advancement revoke @s only ctf_inv:inventory_changed
