# Run once per tick in freeze / round / end_round.
# The aiming reward runs in the player tick (after the functions), so "no reward since
# the last tick" means the right mouse button was released.
execute as @a[scores={sn.aim=1..}] at @s run function ctf_sniper:internal/check
# Reload progress bar on the actionbar (while holding the rifle)
execute as @a[scores={sn.reload=1..}] if items entity @s weapon.mainhand spyglass[custom_data~{wpn:"sniper"}] run function ctf_sniper:internal/bar
scoreboard players remove @a[scores={sn.reload=1..}] sn.reload 1
execute as @a[scores={sn.reload=0}] at @s run function ctf_sniper:internal/reloaded
