# Runs every tick as a stun trap: faint pale particles; a defender within 1.5 blocks sets it off
# (loot crates are only for attackers, so the trap always works against the defense)
particle minecraft:dust{color:[0.85, 0.83, 0.72], scale: 0.4} ~ ~0.15 ~ 0.15 0.05 0.15 0 1 force @a[tag=!lobby]
execute if entity @a[tag=defense, tag=player, gamemode=!spectator, distance=..1.5] run function ctf_loot:reward/stun/trigger
