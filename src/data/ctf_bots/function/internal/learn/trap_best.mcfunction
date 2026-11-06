# As a point: the most traps of a kind ($(stat)) so far? (lrn_best)
$execute unless score @s $(stat) > #hb lrn run return 0
$scoreboard players operation #hb lrn = @s $(stat)
tag @e[type=marker, tag=lrn_best] remove lrn_best
tag @s add lrn_best
