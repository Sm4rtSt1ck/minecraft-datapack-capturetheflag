# Freeze: bows and crossbows can't shoot. The projectile is removed and the ammo is given back
kill @e[type=arrow]
kill @e[type=firework_rocket]
execute as @a[scores={bow_used=1..}] run function ctf_inv:freeze_shot
execute as @a[scores={xbow_used=1..}] run function ctf_inv:freeze_shot
