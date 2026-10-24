# #ctf:tick/combat (round, end_round)
execute as @a[scores={just_killed=1..}] run function ctf:match/events/fight/kill
execute as @a[scores={just_died=1..}] run function ctf:match/events/fight/die
tag @a remove just_killed
execute as @a[scores={just_used_totem=1..}] run function ctf:match/events/fight/use_totem
