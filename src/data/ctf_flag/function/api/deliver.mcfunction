# The flag is delivered by a non-player (ctf_bots: a bot carrying it), as the carrier: the delivery
# money (like ctf_flag:internal/bring), the attack wins
function ctf_econ:give {key: "bring", reason: "the flag was delivered"}
# The carrier's own wrap-up (ctf_bots: the money into its wallet) before the round ends
execute if entity @s[tag=bot_carrier] run function ctf_bots:api/money_flush
function ctf:match/round/win_attack
