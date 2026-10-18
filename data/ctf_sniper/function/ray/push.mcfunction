# Stronger knockback: every hit of the "push" damage type (bypasses the damage cooldown,
# 0.01 damage) knocks the target back once more, away from the shooter
damage @a[tag=sn.hit, limit=1] 0.01 ctf_guns:push by @a[tag=sn.shooter, limit=1]
damage @a[tag=sn.hit, limit=1] 0.01 ctf_guns:push by @a[tag=sn.shooter, limit=1]
return 1
