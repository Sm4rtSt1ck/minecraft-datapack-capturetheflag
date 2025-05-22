execute positioned as @s run summon minecraft:creeper ~ ~ ~ {\
  Fuse:0,\
  ExplosionRadius:2,\
  Invulnerable:true,\
  attributes: [{id:"movement_speed", base: 0}],\
}

execute positioned as @s run particle cloud ~ ~0.3 ~ 0.3 0.3 0.3 0.005 50 normal

execute positioned as @s run kill @n[tag=trap_display, tag=trap.tnt, distance=1.2..1.5]
kill @s
