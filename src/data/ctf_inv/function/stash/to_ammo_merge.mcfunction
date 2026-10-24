# type, count
$execute unless items entity @a[tag=ctf.stash_owner, limit=1] hotbar.6 *[custom_data~{ammo:"$(type)"}] unless items entity @a[tag=ctf.stash_owner, limit=1] weapon.offhand *[custom_data~{ammo:"$(type)"}] run return run function ctf_inv:stash/drop
$execute as @a[tag=ctf.stash_owner, limit=1] run function ctf_inv:ammo/give/$(type) {count: $(count)}
kill @s
