# Stronger sniper knockback: every hit of the "push" damage type (bypasses the damage cooldown,
# 0.01 damage) knocks the target back once more, away from the shooter
execute unless score #bot gun.tmp matches 1 run damage @a[tag=gun.hit, limit=1] 0.01 ctf_guns:push by @a[tag=gun.shooter, limit=1]
execute if score #bot gun.tmp matches 1 run damage @a[tag=gun.hit, limit=1] 0.01 ctf_guns:push by @e[type=zombified_piglin, tag=gun.shooter, limit=1]
execute unless score #bot gun.tmp matches 1 run damage @a[tag=gun.hit, limit=1] 0.01 ctf_guns:push by @a[tag=gun.shooter, limit=1]
execute if score #bot gun.tmp matches 1 run damage @a[tag=gun.hit, limit=1] 0.01 ctf_guns:push by @e[type=zombified_piglin, tag=gun.shooter, limit=1]
return 1
