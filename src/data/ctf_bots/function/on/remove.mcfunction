# #ctf:on/swap (and ctf_bots:on/match_end): no bots out of the rounds
kill @e[type=zombified_piglin, tag=ctf_bot]
kill @e[type=marker, tag=bot_wallet]
function ctf_bots:internal/flag/clear
scoreboard players set attack bots 0
