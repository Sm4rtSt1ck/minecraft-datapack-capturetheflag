# As a player who died, at his death place: the point within 8 counts a death (lrn.dg)
scoreboard players set @s lrn.death 0
execute as @n[type=marker, tag=lrn_pt, distance=..8] run scoreboard players add @s lrn.dg 10
