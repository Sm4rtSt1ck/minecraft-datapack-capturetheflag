# A step of 1 block from the bot's eyes to the player tagged bot_see: reached (within 1.5 of his eyes:
# #los bots 1), or a solid block on the way (not seen), or #lmax steps
execute if entity @a[tag=bot_see, distance=..2.2] run return run scoreboard players set #los bots 1
execute unless block ~ ~ ~ #ctf_bots:gap run return 0
scoreboard players add #step bots 1
execute if score #step bots >= #lmax bots run return 0
execute positioned ^ ^ ^1 run function ctf_bots:internal/brain/los
