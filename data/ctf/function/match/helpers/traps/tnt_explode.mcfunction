say match/helpers/tnt_explode

execute positioned as @s run summon minecraft:creeper ~ ~2 ~ {\
  Fuse:0,\
  ignited:1b,\
  ExplosionRadius:3\
}

kill @s
