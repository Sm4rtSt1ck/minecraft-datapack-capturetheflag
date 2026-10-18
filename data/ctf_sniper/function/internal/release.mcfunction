# The player stopped aiming. A shot is fired only if the sniper rifle is still in the hand:
# switching the slot / dropping the rifle while aiming cancels the shot.
# The aim was started during freeze: no shot (ctf_sniper:internal/aiming)
execute if entity @s[tag=sn.cancel] unless score game state = freeze state run return run tag @s remove sn.cancel
tag @s remove sn.cancel

execute unless items entity @s weapon.mainhand spyglass[custom_data~{wpn:"sniper"}] run return 0
execute if entity @s[gamemode=spectator] run return 0

execute unless score game state = round state unless score game state = end_round state run return run title @s actionbar {"text": "You can't shoot now", "color": "red"}
execute if score @s sn.reload matches 1.. run return run function ctf_sniper:internal/no_shot {text: "Reloading..."}
execute unless items entity @s container.* *[custom_data~{ammo:"sniper"}] run return run function ctf_sniper:internal/no_shot {text: "No ammo"}

function ctf_sniper:shoot
