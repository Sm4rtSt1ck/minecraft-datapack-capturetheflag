# Freeze, the defense bots hide the flag (learning on): a flag spot (F) or a point where the players hid it
# (lrn.hide 10+), the best by value (ctf_bots:internal/learn/hide_value: hiding counts + the rounds it
# held + chance); the point at it remembers it (lrn_fspot) for the round result; 1 when placed
scoreboard players set #best lrn -1
execute as @e[type=marker, tag=bot_flag] run function ctf_bots:internal/learn/hide_value
execute as @e[type=marker, tag=lrn_pt, scores={lrn.hide=10..}] run function ctf_bots:internal/learn/hide_value
execute unless entity @e[type=marker, tag=lrn_best] run return 0
execute at @n[type=marker, tag=lrn_best] run function ctf_flag:api/place_here
execute at @n[type=marker, tag=lrn_best] as @n[type=marker, tag=lrn_pt, distance=..4] run tag @s add lrn_fspot
tag @e[type=marker, tag=lrn_best] remove lrn_best
return 1
