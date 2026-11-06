# As a defense bot picking its spot (learning on): the free defend spot where the bots killed the most
# and died the least (its point: lrn.dk x 2 - lrn.dg, above 0) gets the tag bot_pick
scoreboard players set #hb lrn 0
execute as @e[type=marker, tag=bot_defend, tag=!bot_taken] at @s run function ctf_bots:internal/learn/good_one
