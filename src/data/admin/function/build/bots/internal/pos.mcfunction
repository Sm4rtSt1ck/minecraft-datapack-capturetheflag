# As a marker: storage admin:build pos = [x, y, z] of its block (Pos rounded down)
data modify storage admin:build pos set value [0, 0, 0]
execute store result storage admin:build pos[0] int 1 run data get entity @s Pos[0]
execute store result storage admin:build pos[1] int 1 run data get entity @s Pos[1]
execute store result storage admin:build pos[2] int 1 run data get entity @s Pos[2]
