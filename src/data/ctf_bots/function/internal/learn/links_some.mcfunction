# The next learned link (storage work[0]), #lc lrn of them
execute unless data storage ctf_bots:learn work[0] run return 0
function ctf_bots:internal/learn/link_apply with storage ctf_bots:learn work[0]
data remove storage ctf_bots:learn work[0]
scoreboard players remove #lc lrn 1
execute if score #lc lrn matches 1.. run function ctf_bots:internal/learn/links_some
