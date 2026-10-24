# Same damage as to a player (the damage types bypass the damage cooldown; fallback: arrow damage)
$execute if score #gun gun.tmp matches 1 store success score #ok gun.tmp run damage @e[type=creeper, tag=gun.hit_c, limit=1] $(sniper_damage) ctf_guns:sniper by @a[tag=gun.shooter, limit=1]
$execute if score #gun gun.tmp matches 2 store success score #ok gun.tmp run damage @e[type=creeper, tag=gun.hit_c, limit=1] $(rifle_damage) ctf_guns:rifle by @a[tag=gun.shooter, limit=1]
execute if score #ok gun.tmp matches 1 run return 1
$execute if score #gun gun.tmp matches 1 run damage @e[type=creeper, tag=gun.hit_c, limit=1] $(sniper_damage) minecraft:arrow by @a[tag=gun.shooter, limit=1]
$execute if score #gun gun.tmp matches 2 run damage @e[type=creeper, tag=gun.hit_c, limit=1] $(rifle_damage) minecraft:arrow by @a[tag=gun.shooter, limit=1]
