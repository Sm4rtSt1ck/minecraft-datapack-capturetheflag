execute positioned as @s unless block ~ ~ ~ air run tp @s ~-1 ~ ~
execute positioned as @s unless block ~ ~ ~ air run tp @s ~2 ~ ~
execute positioned as @s unless block ~ ~ ~ air run tp @s ~-1 ~ ~-1
execute positioned as @s unless block ~ ~ ~ air run tp @s ~ ~ ~2

execute positioned as @s unless block ~ ~ ~ air run tp @s ~1 ~ ~
execute positioned as @s unless block ~ ~ ~ air run tp @s ~-2 ~ ~
execute positioned as @s unless block ~ ~ ~ air run tp @s ~ ~ ~-2
execute positioned as @s unless block ~ ~ ~ air run tp @s ~2 ~ ~

execute positioned as @s if block ~ ~-1 ~ air run function ctf:match/events/flag/place/fall_loop

execute positioned as @s unless block ~ ~-1 ~ air unless block ~ ~ ~ air run tp @s ~-1 ~ ~1
execute positioned as @s unless block ~ ~-1 ~ air unless block ~ ~ ~-1 air run setblock ~ ~ ~ yellow_banner[rotation=0]{"patterns": [{"color": "red","pattern": "minecraft:curly_border"},{"color": "orange","pattern": "minecraft:gradient"},{"color": "red","pattern": "minecraft:circle"},{"color": "red","pattern": "minecraft:cross"},{"color": "orange","pattern": "minecraft:flower"},{"color": "red","pattern": "minecraft:triangle_top"}]}
execute positioned as @s unless block ~ ~-1 ~ air unless block ~1 ~ ~ air run setblock ~ ~ ~ yellow_banner[rotation=4]{"patterns": [{"color": "red","pattern": "minecraft:curly_border"},{"color": "orange","pattern": "minecraft:gradient"},{"color": "red","pattern": "minecraft:circle"},{"color": "red","pattern": "minecraft:cross"},{"color": "orange","pattern": "minecraft:flower"},{"color": "red","pattern": "minecraft:triangle_top"}]}
execute positioned as @s unless block ~ ~-1 ~ air unless block ~ ~ ~1 air run setblock ~ ~ ~ yellow_banner[rotation=8]{"patterns": [{"color": "red","pattern": "minecraft:curly_border"},{"color": "orange","pattern": "minecraft:gradient"},{"color": "red","pattern": "minecraft:circle"},{"color": "red","pattern": "minecraft:cross"},{"color": "orange","pattern": "minecraft:flower"},{"color": "red","pattern": "minecraft:triangle_top"}]}
execute positioned as @s unless block ~ ~-1 ~ air unless block ~-1 ~ ~ air run setblock ~ ~ ~ yellow_banner[rotation=12]{"patterns": [{"color": "red","pattern": "minecraft:curly_border"},{"color": "orange","pattern": "minecraft:gradient"},{"color": "red","pattern": "minecraft:circle"},{"color": "red","pattern": "minecraft:cross"},{"color": "orange","pattern": "minecraft:flower"},{"color": "red","pattern": "minecraft:triangle_top"}]}
execute positioned as @s unless block ~ ~-1 ~ air if block ~ ~ ~-1 air if block ~1 ~ ~ air if block ~ ~ ~1 air if block ~-1 ~ ~ air run setblock ~ ~ ~ yellow_banner{"patterns": [{"color": "red","pattern": "minecraft:curly_border"},{"color": "orange","pattern": "minecraft:gradient"},{"color": "red","pattern": "minecraft:circle"},{"color": "red","pattern": "minecraft:cross"},{"color": "orange","pattern": "minecraft:flower"},{"color": "red","pattern": "minecraft:triangle_top"}]}
playsound block.stone.place block @a[tag=defense] ~ ~ ~ 1 1
