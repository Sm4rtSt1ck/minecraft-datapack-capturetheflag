say match/helpers/tnt_explode

execute positioned as @s run summon minecraft:creeper ~ ~ ~ {\
  Fuse:0,\
  ExplosionRadius:3\
}

execute positioned as @s run kill @n[tag=trap_display, tag=trap.tnt, distance=1.3..1.4]
kill @s
