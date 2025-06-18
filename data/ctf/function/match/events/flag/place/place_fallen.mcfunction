execute positioned as @s unless block ~ ~ ~ air run tp @s ~ ~1 ~
execute positioned as @s unless block ~ ~ ~ air run tp @s ~ ~-1 ~

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
execute positioned as @s unless block ~ ~-1 ~ air unless block ~ ~ ~-1 air run function ctf:match/helpers/setblock_flag {target: '@s', rotation: 0}
execute positioned as @s unless block ~ ~-1 ~ air unless block ~1 ~ ~ air run function ctf:match/helpers/setblock_flag {target: '@s', rotation: 4}
execute positioned as @s unless block ~ ~-1 ~ air unless block ~ ~ ~1 air run function ctf:match/helpers/setblock_flag {target: '@s', rotation: 8}
execute positioned as @s unless block ~ ~-1 ~ air unless block ~-1 ~ ~ air run function ctf:match/helpers/setblock_flag {target: '@s', rotation: 12}
execute positioned as @s unless block ~ ~-1 ~ air if block ~ ~ ~-1 air if block ~1 ~ ~ air if block ~ ~ ~1 air if block ~-1 ~ ~ air run function ctf:match/helpers/setblock_flag {target: '@s', rotation: 0}
playsound block.stone.place block @a[tag=defense] ~ ~ ~ 1 1
