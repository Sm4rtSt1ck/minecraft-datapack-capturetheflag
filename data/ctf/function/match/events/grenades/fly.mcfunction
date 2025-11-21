execute positioned as @s unless entity @n[type=potion,nbt={Item:{components:{"minecraft:custom_data":{tags:["he_grenade"]}}}}, distance=..1.5] unless score game state = freeze state run function ctf:combine_commands {command_1: "summon minecraft:creeper ~ ~ ~ {Fuse: 0b, ExplosionRadius: 2}", command_2: "particle minecraft:campfire_cosy_smoke ~ ~ ~ 0 0 0 0.5 100 normal"}
execute positioned as @s unless entity @n[type=potion, distance=..1.5] run kill @s

execute positioned as @s[tag=he_grenade] run tp @n[type=potion]
