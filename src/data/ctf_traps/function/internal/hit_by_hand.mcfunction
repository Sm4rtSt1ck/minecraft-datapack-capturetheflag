# Advancement reward: the player hit a trap marker directly (with the hand / a melee weapon): the trap
# is removed without going off. It runs right at the hit, before ctf_traps:internal/hurt would
# set it off. Markers have 1024 HP: the hit one is below max health
advancement revoke @s only ctf_traps:trap_hit
execute as @e[type=frog, tag=trap_marker, tag=!triggered, distance=..8] store result score @s kc.tmp run data get entity @s Health
kill @e[type=frog, tag=trap_marker, tag=!triggered, distance=..8, scores={kc.tmp=..1023}]
