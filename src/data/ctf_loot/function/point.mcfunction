# A landing point of the map (ctf:match/maps/<map>/loot): the crate of the next waiting attacker.
# x, y, z - the block where the shulker box lands
execute unless entity @a[tag=ctf.loot_pending, limit=1] run return 0
$data modify storage ctf_loot:tmp p set value {x: $(x), y: $(y), z: $(z)}
execute as @a[tag=ctf.loot_pending, limit=1] run function ctf_loot:point_player with storage ctf_loot:tmp p
