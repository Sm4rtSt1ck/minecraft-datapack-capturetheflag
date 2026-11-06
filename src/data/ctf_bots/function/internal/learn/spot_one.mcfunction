# As a learned point: the most defenders' heat so far? (lrn_best)
execute unless score @s lrn.hd > #hb lrn run return 0
scoreboard players operation #hb lrn = @s lrn.hd
tag @e[type=marker, tag=lrn_best] remove lrn_best
tag @s add lrn_best
