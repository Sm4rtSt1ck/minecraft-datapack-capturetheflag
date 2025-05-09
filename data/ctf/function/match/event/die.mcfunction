scoreboard players set @s just_died 0

# execute positioned as @s run spawnpoint @s ~ ~ ~ ~
tag @s add just_died
gamemode spectator @s

tag @s add dead

schedule function ctf:match/helpers/tp_dead_killed 2t
