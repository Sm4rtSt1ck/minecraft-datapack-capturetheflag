# No place for the item: it becomes a normal dropped item at the player's feet
tp @s @a[tag=ctf.stash_owner, limit=1]
tag @s remove ctf.buf
tag @s remove ctf.seen
data merge entity @s {PickupDelay: 40s, NoGravity: false, Motion: [0.0d, 0.2d, 0.0d]}
