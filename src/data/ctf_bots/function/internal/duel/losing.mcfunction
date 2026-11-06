# As a bot in a duel: it dies much faster (its time to kill x 2 < his), it may retreat (not the flag
# carrier, not the breaker at the flag, not again within DUEL "retreat_again" thinks) and a teammate
# to fight beside is within 32 (farther than 6)? (1)
execute if entity @s[tag=bot_carrier] run return 0
execute if score @s bot.role matches 2 if entity @e[type=armor_stand, tag=flag, distance=..4] run return 0
execute if score @s bot.retcd matches 1.. run return 0
execute if entity @s[tag=attack] unless entity @e[type=zombified_piglin, tag=ctf_bot, tag=attack, distance=6..32] run return 0
execute if entity @s[tag=defense] unless entity @e[type=zombified_piglin, tag=ctf_bot, tag=defense, distance=6..32] run return 0
scoreboard players operation #a bots = #ttk_me bots
scoreboard players operation #a bots += #ttk_me bots
execute if score #a bots < #ttk_him bots run return 1
return 0
