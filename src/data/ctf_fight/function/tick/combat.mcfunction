# #ctf:tick/combat (round, end_round)
execute as @a[scores={just_killed=1..}] run function ctf_fight:internal/kill
execute as @a[scores={just_died=1..}] run function ctf_fight:internal/die
tag @a remove just_killed
execute as @a[scores={just_used_totem=1..}] run function ctf_fight:internal/use_totem
