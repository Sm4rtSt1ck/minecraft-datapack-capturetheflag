# A defense bot with the mace: the highest free defend spot within 24 of the flag gets the tag bot_pick
scoreboard players set #hy bots -1000000
execute at @n[type=armor_stand, tag=flag] as @e[type=marker, tag=bot_defend, tag=!bot_taken, distance=..24] run function ctf_bots:internal/brain/pick_high_one
