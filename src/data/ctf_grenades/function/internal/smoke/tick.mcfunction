# Run every tick in freeze / round / end_round
execute as @e[type=marker, tag=ctf.smoke_fly] at @s run function ctf_grenades:internal/smoke/fly
execute as @e[type=marker, tag=ctf.smoke] at @s run function ctf_grenades:internal/smoke/cloud
