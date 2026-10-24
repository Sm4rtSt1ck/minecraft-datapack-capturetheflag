# #ctf:on/round_start
# Chorus fruits become edible
execute as @a[tag=player] at @s run function ctf_inv:limits/normalize_chorus
execute as @a[tag=player] run function ctf_inv:api/refresh
