# Run every tick (ctf:match/events/handle): a trap goes off from ANY damage to its marker: shots (arrows,
# fireworks, wind charges, tridents), explosions (grenades, another trap), fire, effects...
# Markers have 1024 HP (a hit never kills them), so a hurt one is below max health.
# A hit with the hand removes it without going off (ctf:match/events/traps/hit_by_hand, earlier)
execute as @e[type=frog, tag=trap_marker, tag=!triggered] store result score @s kc.tmp run data get entity @s Health
execute as @e[type=frog, tag=trap_marker, tag=!triggered, scores={kc.tmp=..1023}] at @s run function ctf:match/events/traps/hurt_one
# Explosion credit of markers (credit/mark_traps) expires
scoreboard players remove @e[type=frog, tag=trap_marker, scores={kc.time=1..}] kc.time 1
