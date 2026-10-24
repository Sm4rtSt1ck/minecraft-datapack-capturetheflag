# #ctf:on/freeze_start (after the shop opens)
# Chorus fruits can't be eaten during freeze
execute as @a[tag=player] at @s run function ctf_inv:limits/normalize_chorus
# Ammo of every weapon and the mace wind charges are restored to max
execute as @a[tag=player] at @s run function ctf_inv:ammo/fill_all
# Hotbar layout: gives the stick and the ultimate, ...
execute as @a[tag=player] run function ctf_inv:api/refresh
