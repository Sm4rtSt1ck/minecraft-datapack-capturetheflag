# No lures, no carried flag (freeze start, the bots removed)
kill @e[type=rabbit, tag=bot_lure]
kill @e[type=marker, tag=bot_flag_pos]
tag @e[type=zombified_piglin, tag=bot_carrier] remove bot_carrier
