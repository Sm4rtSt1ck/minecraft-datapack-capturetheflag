# Kill credit: everyone in the blast radius
function ctf:match/events/credit/owner
execute positioned as @s as @a[tag=player, distance=..6] run function ctf:match/events/credit/mark {time: 60, src: 2}
execute positioned as @s run function ctf:match/events/credit/mark_traps {r: 6}

execute positioned as @s run summon minecraft:creeper ~ ~ ~ {\
  Fuse:0,\
  CustomName:'"TNT trap"',\
  ExplosionRadius:3,\
  Invulnerable:true,\
  attributes: [{id:"movement_speed", base: 0}],\
}

execute positioned as @s run particle minecraft:campfire_cosy_smoke ~ ~ ~ 0 0 0 0.5 200 normal

execute positioned as @s run particle cloud ~ ~0.3 ~ 0.3 0.3 0.3 0.005 50 normal

execute positioned as @s run kill @n[tag=trap_display, tag=trap.tnt, distance=1.2..1.5]
kill @s
