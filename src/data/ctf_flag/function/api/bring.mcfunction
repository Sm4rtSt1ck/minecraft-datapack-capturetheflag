# The flag is delivered, as the carrier at the win trigger (a player: ctf_flag:tick/round_win; a bot:
# ctf_bots): money, ultimate points, the loot task (players only: ctf_loot:task), the attack wins
function ctf_econ:give {key: "bring", reason: "the flag was delivered"}

function ctf_ult:api/add_point {points: 60}

# Loot crate task
function ctf_loot:task {id: "flag_bring"}

function ctf:match/round/win_attack
