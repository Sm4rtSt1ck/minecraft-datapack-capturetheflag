# #ctf:on/freeze_start
scoreboard players reset * just_threw_grenade
scoreboard players reset * just_threw_smoke
# Smoke clouds of the last round
kill @e[type=marker, tag=ctf.smoke]
kill @e[type=marker, tag=ctf.smoke_fly]
