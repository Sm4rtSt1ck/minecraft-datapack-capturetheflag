# #ctf:tick/combat (round, end_round)
# Kill credit: effect clouds of traps mark players inside; the credit expires
execute as @e[type=area_effect_cloud, tag=kc.cloud] at @s run function ctf_fight:internal/credit/cloud
scoreboard players remove @a[scores={kc.time=1..}] kc.time 1
