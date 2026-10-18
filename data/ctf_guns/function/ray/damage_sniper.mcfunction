# Damage types are registry entries: they exist only after the world was loaded with this datapack
# (/reload doesn't add them). Fallback: arrow damage + a warning for admins.
$execute store success score #ok gun.tmp run damage @a[tag=gun.hit, limit=1] $(sniper_damage) ctf_guns:sniper by @a[tag=gun.shooter, limit=1]
execute if score #ok gun.tmp matches 1 run return run function ctf_guns:ray/push
$damage @a[tag=gun.hit, limit=1] $(sniper_damage) minecraft:arrow by @a[tag=gun.shooter, limit=1]

tellraw @a[tag=admin] {"text": "[ctf_guns] Damage types ctf_guns:* are not loaded: restart the world (rejoin) to load them. Using arrow damage for now.", "color": "red"}
