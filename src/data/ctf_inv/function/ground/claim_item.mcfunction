# Runs as the claimed item: only the claimer can pick it up (it is reset next tick, ctf_inv:ground/tick)
data modify entity @s Owner set from entity @a[tag=ctf.claimer, limit=1] UUID
tag @s remove ctf.own0
