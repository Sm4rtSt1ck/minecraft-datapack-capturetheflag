# ctf_sniper:bullet is a registry entry: it exists only after the world was loaded with this
# datapack (/reload doesn't add it). Without it the command fails -> fallback to arrow damage
# (reduced by armor) and a warning for admins, so the rifle never deals no damage at all.
$execute store success score #ok sn.tmp run damage @a[tag=sn.hit, limit=1] $(damage) ctf_sniper:bullet by @a[tag=sn.shooter, limit=1]
execute if score #ok sn.tmp matches 1 run return 1
$damage @a[tag=sn.hit, limit=1] $(damage) minecraft:arrow by @a[tag=sn.shooter, limit=1]
tellraw @a[tag=admin] {"text": "[ctf_sniper] Damage type ctf_sniper:bullet is not loaded: restart the world (rejoin) to load it. Using arrow damage for now.", "color": "red"}
