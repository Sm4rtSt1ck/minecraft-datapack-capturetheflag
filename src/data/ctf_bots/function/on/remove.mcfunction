# #ctf:on/swap, #ctf:on/match_end, #ctf:on/reset: no bots out of the rounds
kill @e[type=husk, tag=ctf_bot]
kill @e[type=marker, tag=bot_wallet]
function ctf_bots:internal/flag/clear
scoreboard players set attack bots 0
