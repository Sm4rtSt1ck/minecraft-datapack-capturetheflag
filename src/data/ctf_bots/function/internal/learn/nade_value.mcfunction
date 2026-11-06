# As a point: its grenade value (lrn.nd x 2 + lrn.hd + the bots' hits x 3); the best so far gets lrn_best
scoreboard players operation #v lrn = @s lrn.nd
scoreboard players operation #v lrn += @s lrn.nd
scoreboard players operation #v lrn += @s lrn.hd
scoreboard players operation #v lrn += @s lrn.nh
scoreboard players operation #v lrn += @s lrn.nh
scoreboard players operation #v lrn += @s lrn.nh
execute unless score #v lrn > #best lrn run return 0
scoreboard players operation #best lrn = #v lrn
tag @e[type=marker, tag=lrn_best] remove lrn_best
tag @s add lrn_best
