# A learned link $(a) -> $(b) (kind $(t), seen $(n) times, bots failed $(f) / passed $(s) times): both points
# nodes of the graph? The baked link gets dearer by its failures (ctf_bots:internal/learn/link_cost); not
# baked but seen LEARN "observed"+ times: a link of its kind (ctf_bots:internal/learn/link_new)
from registry:bots import LEARN
$scoreboard players set #la lrn $(a)
$scoreboard players set #lb lrn $(b)
$scoreboard players set #lt2 lrn $(t)
$scoreboard players set #ln lrn $(n)
$scoreboard players set #lf lrn $(f)
$scoreboard players set #ls lrn $(s)
execute as @e[type=marker, tag=nav_node] if score @s lrn.id = #la lrn run tag @s add lrn_A
execute as @e[type=marker, tag=nav_node] if score @s lrn.id = #lb lrn run tag @s add lrn_B
execute if entity @e[type=marker, tag=lrn_A] if entity @e[type=marker, tag=lrn_B] run function ctf_bots:internal/learn/link_both
tag @e[type=marker, tag=lrn_A] remove lrn_A
tag @e[type=marker, tag=lrn_B] remove lrn_B
