# Puts every buffer back into the player's inventory by the layout rules.
# If an item has no place, it is dropped at the player's feet.
tag @s add ctf.stash_owner
execute as @e[type=item, tag=ctf.buf] run function ctf_inv:stash/place_one
tag @s remove ctf.stash_owner
