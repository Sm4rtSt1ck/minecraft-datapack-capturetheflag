# As a bot in the air: falling 3+ blocks already? (1: it gets bot_fall, ctf_bots:internal/nav/fall_tick)
execute store result score #fd bots run data get entity @s FallDistance
execute if score #fd bots matches 3.. run return 1
return 0
