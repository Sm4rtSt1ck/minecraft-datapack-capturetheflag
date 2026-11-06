# A step of 1 block from the bot's eyes to the trap tagged bot_trap_see: reached (#los bots 1), or a
# solid block on the way, or 6 steps
execute if entity @e[type=frog, tag=bot_trap_see, distance=..1.2] run return run scoreboard players set #los bots 1
execute unless block ~ ~ ~ #ctf_bots:gap run return 0
scoreboard players add #step bots 1
execute if score #step bots matches 6.. run return 0
execute positioned ^ ^ ^1 run function ctf_bots:internal/traps/los
