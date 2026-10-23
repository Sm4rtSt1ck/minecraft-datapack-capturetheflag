# Runs every tick as a stun trap: faint pale particles; an enemy within 1.5 blocks sets it off
particle minecraft:dust{color:[0.85, 0.83, 0.72], scale: 0.4} ~ ~0.15 ~ 0.15 0.05 0.15 0 1 force @a[tag=!lobby]
execute if entity @s[tag=ctf.stun_vs_defense] if entity @a[tag=defense, tag=player, gamemode=!spectator, distance=..1.5] run return run function ctf_loot:reward/stun/trigger {team: "defense"}
execute if entity @s[tag=ctf.stun_vs_attack] if entity @a[tag=attack, tag=player, gamemode=!spectator, distance=..1.5] run function ctf_loot:reward/stun/trigger {team: "attack"}
