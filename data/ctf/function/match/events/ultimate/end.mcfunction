function ctf:match/helpers/load_inventory
# clear @s
xp set @s 0

effect clear @s minecraft:invisibility
effect clear @s minecraft:speed
effect clear @s minecraft:weakness
effect clear @s minecraft:resistance
effect clear @s minecraft:jump_boost

clear @s *[custom_data={tags:["ultimate"]}]
attribute @s minecraft:scale base reset

execute positioned as @s run kill @n[type=trident]

weather clear

execute positioned as @s[tag=bomber] run clear @s tnt
execute positioned as @s[tag=bomber] run summon creeper ~ ~ ~ {ExplosionRadius: 4, Fuse: 0}
execute as @s[tag=bomber] run function ctf:match/events/fight/die
tag @s[tag=bomber] remove just_died

tag @s remove bomber
tag @s remove ultimate
tag @s remove invisible
