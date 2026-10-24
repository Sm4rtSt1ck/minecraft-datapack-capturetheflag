# #ctf:tick/combat (round, end_round)
execute as @a[scores={flag_broken=1..}] run function ctf_flag:internal/break
execute as @a[scores={wall_flag_broken=1..}] run function ctf_flag:internal/break
execute as @a[scores={flag_dropped=1..}] run function ctf_flag:api/drop
execute as @a[scores={flag_pickedup=1..}] run function ctf_flag:internal/pickup
execute as @e[type=armor_stand, tag=flag] at @s unless block ~ ~ ~ magenta_banner unless block ~ ~ ~ magenta_wall_banner run function ctf_flag:internal/break
