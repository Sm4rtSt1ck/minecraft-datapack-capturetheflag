# Same damage as to a player (the damage types bypass the damage cooldown; fallback: arrow damage)
$execute unless score #bot gun.tmp matches 1 if score #gun gun.tmp matches 1 store success score #ok gun.tmp run damage @e[type=zombified_piglin, tag=gun.hit_b, limit=1] $(sniper_damage) ctf_guns:sniper by @a[tag=gun.shooter, limit=1]
$execute if score #bot gun.tmp matches 1 if score #gun gun.tmp matches 1 store success score #ok gun.tmp run damage @e[type=zombified_piglin, tag=gun.hit_b, limit=1] $(sniper_damage) ctf_guns:sniper by @e[type=zombified_piglin, tag=gun.shooter, limit=1]
$execute unless score #bot gun.tmp matches 1 if score #gun gun.tmp matches 2 store success score #ok gun.tmp run damage @e[type=zombified_piglin, tag=gun.hit_b, limit=1] $(rifle_damage) ctf_guns:rifle by @a[tag=gun.shooter, limit=1]
$execute if score #bot gun.tmp matches 1 if score #gun gun.tmp matches 2 store success score #ok gun.tmp run damage @e[type=zombified_piglin, tag=gun.hit_b, limit=1] $(rifle_damage) ctf_guns:rifle by @e[type=zombified_piglin, tag=gun.shooter, limit=1]
execute if score #ok gun.tmp matches 1 run return 1
$execute unless score #bot gun.tmp matches 1 if score #gun gun.tmp matches 1 run damage @e[type=zombified_piglin, tag=gun.hit_b, limit=1] $(sniper_damage) minecraft:arrow by @a[tag=gun.shooter, limit=1]
$execute if score #bot gun.tmp matches 1 if score #gun gun.tmp matches 1 run damage @e[type=zombified_piglin, tag=gun.hit_b, limit=1] $(sniper_damage) minecraft:arrow by @e[type=zombified_piglin, tag=gun.shooter, limit=1]
$execute unless score #bot gun.tmp matches 1 if score #gun gun.tmp matches 2 run damage @e[type=zombified_piglin, tag=gun.hit_b, limit=1] $(rifle_damage) minecraft:arrow by @a[tag=gun.shooter, limit=1]
$execute if score #bot gun.tmp matches 1 if score #gun gun.tmp matches 2 run damage @e[type=zombified_piglin, tag=gun.hit_b, limit=1] $(rifle_damage) minecraft:arrow by @e[type=zombified_piglin, tag=gun.shooter, limit=1]
