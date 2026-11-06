# Learning of the bots on / off (the setting Bots_learn; on by default; BOTS.md stage 11)
execute if score Bots_learn settings matches 1 run return run function ctf_test:bots/learn_off
scoreboard players set Bots_learn settings 1
tellraw @s {"text": "Bot learning: ON (from the next map load)", "color": "green"}
