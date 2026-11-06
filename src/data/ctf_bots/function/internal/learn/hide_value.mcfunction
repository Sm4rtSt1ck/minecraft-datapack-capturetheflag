# As a flag spot / point: its value = its hiding count + (rounds held + 10) x 100 / (rounds + 20) + a random
# 0..40 (the counts of the point within 1); the best so far gets lrn_best
scoreboard players set #v lrn 0
scoreboard players set #hw lrn 0
scoreboard players set #hl lrn 0
execute as @n[type=marker, tag=lrn_pt, distance=..1] run scoreboard players operation #v lrn = @s lrn.hide
execute as @n[type=marker, tag=lrn_pt, distance=..1] run scoreboard players operation #hw lrn = @s lrn.hw
execute as @n[type=marker, tag=lrn_pt, distance=..1] run scoreboard players operation #hl lrn = @s lrn.hl
scoreboard players operation #den lrn = #hw lrn
scoreboard players operation #den lrn += #hl lrn
scoreboard players add #den lrn 20
scoreboard players add #hw lrn 10
scoreboard players set #k lrn 100
scoreboard players operation #hw lrn *= #k lrn
scoreboard players operation #hw lrn /= #den lrn
scoreboard players operation #v lrn += #hw lrn
execute store result score #r lrn run random value 0..40
scoreboard players operation #v lrn += #r lrn
execute unless score #v lrn > #best lrn run return 0
scoreboard players operation #best lrn = #v lrn
tag @e[type=marker, tag=lrn_best] remove lrn_best
tag @s add lrn_best
