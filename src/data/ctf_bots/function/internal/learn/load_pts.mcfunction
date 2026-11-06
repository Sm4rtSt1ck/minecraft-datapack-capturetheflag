# Positioned at the arena corner: the stored points (storage ctf_bots:learn work) one by one
# (ctf_bots:internal/learn/load_pt)
execute unless data storage ctf_bots:learn work[0] run return 0
function ctf_bots:internal/learn/load_pt with storage ctf_bots:learn work[0]
data remove storage ctf_bots:learn work[0]
function ctf_bots:internal/learn/load_pts
