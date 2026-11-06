# The flag is delivered by a non-player (ctf_bots: a bot carrying it), as the carrier: the delivery
# money (like ctf_flag:internal/bring), the attack wins
function ctf_econ:give {key: "bring", reason: "the flag was delivered"}
function ctf:match/round/win_attack
