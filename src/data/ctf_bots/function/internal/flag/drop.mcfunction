# The bot carrying the flag is dead: the flag drops where it was last
function ctf_flag:api/summon_flag {target: '@n[type=marker, tag=bot_flag_pos]'}
kill @e[type=marker, tag=bot_flag_pos]
