# Advancement reward, right at the hit: the player hurt a trap marker not directly (an arrow, fireworks,
# a wind charge, a trident...). The hurt marker (below its 1024 HP) remembers him: when it goes off
# (ctf_traps:internal/hurt, next tick), its kills are credited to him (any team)
advancement revoke @s only ctf_traps:trap_shot
execute as @e[type=frog, tag=trap_marker, tag=!triggered] store result score @s kc.tmp run data get entity @s Health
scoreboard players operation @e[type=frog, tag=trap_marker, tag=!triggered, scores={kc.tmp=..1023}] kc.by = @s player_id
scoreboard players set @e[type=frog, tag=trap_marker, tag=!triggered, scores={kc.tmp=..1023}] kc.time 5
