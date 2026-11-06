# As a node without a learned point: it becomes a point with a new id (no stats yet)
tag @s add lrn_pt
scoreboard players operation @s lrn.id = #next lrn
scoreboard players add #next lrn 1
