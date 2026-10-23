# x, y, z: the item goes back into the shulker box
$item replace block $(x) $(y) $(z) container.13 from entity @e[type=item, tag=ctf.returning, limit=1] contents
kill @e[type=item, tag=ctf.returning]
