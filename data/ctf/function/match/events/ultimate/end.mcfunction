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

kill @n[type=trident]
weather clear

tag @s remove ultimate
tag @s remove invisible
