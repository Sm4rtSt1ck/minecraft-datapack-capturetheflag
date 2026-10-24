execute positioned as @s unless entity @n[type=potion,nbt={Item:{components:{"minecraft:custom_data":{tags:["he_grenade"]}}}}, distance=..1.5] unless score game state = freeze state run function ctf_grenades:internal/explode
execute positioned as @s unless entity @n[type=potion, distance=..1.5] run kill @s

execute positioned as @s[tag=he_grenade] run tp @n[type=potion]
