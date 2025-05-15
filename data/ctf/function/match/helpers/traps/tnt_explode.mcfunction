say match/helpers/tnt_explode

execute positioned as @s run summon minecraft:creeper ~ ~ ~ {\
  Fuse:0,\
  ExplosionRadius:2\
}

execute positioned as @s run kill @n[tag=trap_display, tag=trap.tnt]
kill @s
