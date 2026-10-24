# Items picked up during the ultimate are kept (load_inventory overwrites the hotbar).
# Not for the bomber: he dies, his inventory must be dropped, not given back
execute if entity @s[tag=ultimate, tag=player, tag=!bomber] at @s run function ctf_inv:api/stash_hotbar
function ctf:match/helpers/load_inventory

effect clear @s minecraft:invisibility
effect clear @s minecraft:speed
effect clear @s minecraft:weakness
effect clear @s minecraft:resistance
effect clear @s minecraft:jump_boost
effect clear @s minecraft:slowness

clear @s *[custom_data={tags:["ultimate"]}]
attribute @s minecraft:scale base reset

execute positioned as @s run kill @n[type=trident]

weather clear

# Kill credit for the bomber
execute if entity @s[tag=bomber] run scoreboard players operation #owner kc.tmp = @s player_id
execute if entity @s[tag=bomber] positioned as @s as @a[tag=player, distance=..8] run function ctf:match/events/credit/mark {time: 60, src: 3}

execute if entity @s[tag=bomber, tag=player] at @s run function ctf:match/events/ultimate/categories/bomber_explode

tag @s remove bomber
tag @s remove ultimate
tag @s remove invisible

# Back to the charge bar
function ctf:match/events/ultimate/render

execute if entity @e[type=item, tag=ctf.buf, limit=1] at @s run function ctf_inv:api/place
function ctf_inv:api/refresh
