# #ctf:tick/freeze, #ctf:tick/combat
execute as @a[tag=player, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data~{action:"ultimate"}] run function ctf_ult:internal/check_points
