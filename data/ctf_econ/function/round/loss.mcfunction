# CS rule: attackers who were still alive when the time ran out get no loss bonus
execute if score #reason econ.tmp matches 4 if entity @s[tag=attack, tag=!dead] run tellraw @s {"text": "No loss bonus: you survived until the time ran out", "color": "red"}
$execute unless score #reason econ.tmp matches 4 run function ctf_econ:round/loss_bonus {side: "$(side)"}
$execute if score #reason econ.tmp matches 4 unless entity @s[tag=attack, tag=!dead] run function ctf_econ:round/loss_bonus {side: "$(side)"}

# The attack lost the round, but broke the flag (like the bomb plant bonus in CS)
execute if entity @s[tag=attack] if score broken flag_state matches 1 run function ctf_econ:give {key: "broken_loss", reason: "the flag was broken"}
