# Runs as the dropped ammo: moved to the nearest dropped weapon of its type, with the same motion
execute unless entity @e[type=item, tag=ctf.wpn_drop, limit=1] run return 0
tp @s @e[type=item, tag=ctf.wpn_drop, sort=nearest, limit=1]
data modify entity @s Motion set from entity @e[type=item, tag=ctf.wpn_drop, sort=nearest, limit=1] Motion
