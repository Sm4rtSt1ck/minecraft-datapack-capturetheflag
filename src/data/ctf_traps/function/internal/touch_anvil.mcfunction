# Runs as a player under an anvil trap (positioned at the column). Like ctf_traps:internal/touch
execute if entity @s[tag=attack] run scoreboard players operation @e[type=frog, tag=trap.anvil, tag=trap_marker, dx=0.25, dy=256, dz=0.25] kc.owner = @s player_id
execute as @e[type=frog, tag=trap.anvil, tag=trap_marker, dx=0.25, dy=256, dz=0.25] run function ctf_traps:internal/anvil/trigger
