# As an attack bot searching the flag (role search, the flag not found yet): to its spot (claimed by
# it: bot.sc = its number, not checked yet), else a new one (ctf_bots:internal/team/search_pick)
execute as @e[type=marker, tag=bot_nav, tag=!bot_chk] if score @s bot.sc = #me bots run tag @s add bot_sdest
execute unless entity @e[type=marker, tag=bot_sdest] run function ctf_bots:internal/team/search_pick
execute at @n[type=marker, tag=bot_sdest] run function ctf_bots:internal/brain/lure_here
tag @e[type=marker, tag=bot_sdest] remove bot_sdest
return 1
