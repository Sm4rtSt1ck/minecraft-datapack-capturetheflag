# A placed stun trap: it works against the team of the enemies of the player who placed it (the nearest)
execute as @p[distance=..8, gamemode=!spectator] if entity @s[tag=defense] run tag @e[type=armor_stand, tag=ctf.stun_new, distance=..0.1, limit=1] add ctf.stun_vs_attack
execute unless entity @s[tag=ctf.stun_vs_attack] run tag @s add ctf.stun_vs_defense
tag @s remove ctf.stun_new
