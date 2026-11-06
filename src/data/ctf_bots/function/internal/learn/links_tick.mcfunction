# 25 learned links a tick (ctf_bots:internal/learn/link_apply); all done: the fields computed again, the
# graph ready
scoreboard players set #lc lrn 25
function ctf_bots:internal/learn/links_some
execute if data storage ctf_bots:learn work[0] run return run schedule function ctf_bots:internal/learn/links_tick 1t
function ctf_bots:internal/learn/graph_ready
