execute store result score origin posX run data get entity @n[tag=clone_marker] Pos[0] 1
execute store result score origin posY run data get entity @n[tag=clone_marker] Pos[1] 1
execute store result score origin posZ run data get entity @n[tag=clone_marker] Pos[2] 1

summon minecraft:armor_stand -200 -52 -200 {Tags:["clone", "clone_target_marker"]}
execute store result score target posX run data get entity @n[tag=clone_target_marker] Pos[0] 1
execute store result score target posY run data get entity @n[tag=clone_target_marker] Pos[1] 1
execute store result score target posZ run data get entity @n[tag=clone_target_marker] Pos[2] 1

scoreboard players operation offset posX = target posX
scoreboard players operation offset posY = target posY
scoreboard players operation offset posZ = target posZ

scoreboard players operation offset posX -= origin posX
scoreboard players operation offset posY -= origin posY
scoreboard players operation offset posZ -= origin posZ

execute positioned as @n[tag=clone_marker] as @e[dx=128, dy=128, dz=128, tag=!clone_marker, tag=!clone_target_marker, tag=!map_entity, type=!player] run function ctf:match/prepare/entity_clone/clone_one

kill @e[tag=clone_target_marker]
