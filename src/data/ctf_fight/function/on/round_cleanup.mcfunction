# Ends every death camera right away (start of freeze, team swap, end of the match)
execute as @a[tag=ctf.dc_on] run function ctf_fight:internal/deathcam/stop
execute as @e[type=enderman, tag=ctf.dc] run function ctf_fight:internal/deathcam/remove_entity
