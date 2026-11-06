# As a free defend spot: its learned value (the point here: kills x 2 - deaths) the best so far?
scoreboard players set #v lrn 0
execute as @n[type=marker, tag=lrn_pt, distance=..1] run scoreboard players operation #v lrn = @s lrn.dk
scoreboard players operation #v lrn += #v lrn
execute as @n[type=marker, tag=lrn_pt, distance=..1] run scoreboard players operation #v lrn -= @s lrn.dg
execute unless score #v lrn > #hb lrn run return 0
scoreboard players operation #hb lrn = #v lrn
tag @e[type=marker, tag=bot_pick] remove bot_pick
tag @s add bot_pick
