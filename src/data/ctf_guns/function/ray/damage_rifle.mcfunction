# ctf_guns:rifle bypasses the damage cooldown, so every bullet deals damage (4 hits per second).
# Its knockback is weakened for the target only during this hit
$attribute @a[tag=gun.hit, limit=1] minecraft:knockback_resistance modifier add ctf_guns:rifle_hit $(rifle_knockback_resistance) add_value
$execute store success score #ok gun.tmp run damage @a[tag=gun.hit, limit=1] $(rifle_damage) ctf_guns:rifle by @a[tag=gun.shooter, limit=1]
$execute if score #ok gun.tmp matches 0 run damage @a[tag=gun.hit, limit=1] $(rifle_damage) minecraft:arrow by @a[tag=gun.shooter, limit=1]
attribute @a[tag=gun.hit, limit=1] minecraft:knockback_resistance modifier remove ctf_guns:rifle_hit
execute if score #ok gun.tmp matches 1 run return 1

tellraw @a[tag=admin] {"text": "[ctf_guns] Damage types ctf_guns:* are not loaded: restart the world (rejoin) to load them. Using arrow damage for now.", "color": "red"}
