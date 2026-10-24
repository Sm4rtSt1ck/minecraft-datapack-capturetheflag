function ctf_econ:give {key: "bring", reason: "the flag was delivered"}

function ctf_ult:api/add_point {points: 60}

# Loot crate task
function ctf_loot:task {id: "flag_bring"}

function ctf:match/round/win_attack
