# Round win (learning on, a map loaded): the flag spot of the defense bots won / lost (lrn.hw / lrn.hl);
# the attack routes counted (ctf_bots:internal/learn/routes_done)
execute unless score Bots_learn settings matches 1 run return 0
execute unless score #map lrn matches 1.. run return 0
execute if data storage ctf:round won{winner: "defense"} run scoreboard players add @e[type=marker, tag=lrn_fspot] lrn.hw 10
execute if data storage ctf:round won{winner: "attack"} run scoreboard players add @e[type=marker, tag=lrn_fspot] lrn.hl 10
tag @e[type=marker, tag=lrn_fspot] remove lrn_fspot
function ctf_bots:internal/learn/routes_done
execute as @e[type=marker, tag=bot_wallet] run function ctf_bots:internal/learn/bot_round
