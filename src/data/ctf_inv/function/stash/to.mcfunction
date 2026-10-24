# Moves the buffer into the slot, or drops it if the slot is taken
$execute if items entity @a[tag=ctf.stash_owner, limit=1] $(slot) * run return run function ctf_inv:stash/drop
$item replace entity @a[tag=ctf.stash_owner, limit=1] $(slot) from entity @s contents
kill @s
