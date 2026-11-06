# #ctf:on/round_win (first, before the round money of ctf_econ): the wallets of the dead bots are
# tagged dead (the CS rule of the loss bonus)
tag @e[type=marker, tag=bot_wallet] add dead
execute as @e[type=zombified_piglin, tag=ctf_bot] run function ctf_bots:internal/money/alive
