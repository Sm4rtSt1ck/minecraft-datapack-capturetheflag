# Runs as the grenade marker. Explosion radius 2 -> damage up to 4 blocks
function ctf:match/events/credit/owner
execute as @a[tag=player, distance=..4] run function ctf:match/events/credit/mark {time: 60, src: 1}
function ctf:match/events/credit/mark_traps {r: 4}

summon minecraft:creeper ~ ~ ~ {Fuse: 0b, ExplosionRadius: 2, CustomName: '"Grenade"'}
particle minecraft:campfire_cosy_smoke ~ ~ ~ 0 0 0 0.5 100 normal @a[tag=!lobby]
