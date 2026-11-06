# Lobby view, positioned at the template block of the map $(id): its learned points spawned there (the same
# places as in the arena); its data in storage cur for the learned links (nothing is saved in the lobby)
$data modify storage ctf_bots:learn cur set from storage ctf_bots:learn maps.$(id)
data modify storage ctf_bots:learn work set from storage ctf_bots:learn cur.pts
function ctf_bots:internal/learn/load_pts
