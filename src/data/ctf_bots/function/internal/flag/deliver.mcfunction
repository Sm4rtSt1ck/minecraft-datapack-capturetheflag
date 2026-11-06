# The bot carrying the flag is at the win trigger: delivered like a player's (ctf_flag:api/bring:
# money, ultimate points, the attack wins; its glowing ends with the round: ctf_flag:on/end_round_start)
kill @e[type=marker, tag=bot_flag_pos]
function ctf_flag:api/bring
function ctf_bots:internal/money/flush
tag @s remove bot_carrier
