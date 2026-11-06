# The graph is baked: the learned links applied a few a tick (ctf_bots:internal/learn/links_tick), then the
# graph is ready (#ready nav 1); learning off / no map: ready now. The lobby view (#lshow nav): the learned
# links of its map
execute if score #lshow nav matches 1 unless data storage ctf_bots:learn cur.links run return run function ctf_bots:internal/learn/graph_ready
execute if score #lshow nav matches 1 run data modify storage ctf_bots:learn work set from storage ctf_bots:learn cur.links
execute if score #lshow nav matches 1 run return run function ctf_bots:internal/learn/links_tick
execute unless score Bots_learn settings matches 1 run return run scoreboard players set #ready nav 1
execute unless score #map lrn matches 1.. run return run scoreboard players set #ready nav 1
data modify storage ctf_bots:learn work set from storage ctf_bots:learn cur.links
function ctf_bots:internal/learn/links_tick
