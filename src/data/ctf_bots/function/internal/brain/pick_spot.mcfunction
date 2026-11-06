from registry:bots import MEMORY
# Round start, as a defense bot: its defend spot (a free one; the nearest to the flag 2 times of 3,
# else a random one; with the mace: the highest one within 24 of the flag, to jump down on enemies).
# No free spot: it stays near the flag
execute store result score #p bots run random value 1..3
execute if score @s bot.mw matches 9 run function ctf_bots:internal/brain/pick_high
execute unless entity @e[type=marker, tag=bot_pick] if predicate {condition: "minecraft:random_chance", chance: (1.0 / MEMORY["hot_spot"])} run function ctf_bots:internal/trick/pick_hot
execute unless entity @e[type=marker, tag=bot_pick] if score #p bots matches 1..2 at @n[type=armor_stand, tag=flag] as @e[type=marker, tag=bot_defend, tag=!bot_taken, sort=nearest, limit=1] run tag @s add bot_pick
execute unless entity @e[type=marker, tag=bot_pick] as @e[type=marker, tag=bot_defend, tag=!bot_taken, sort=random, limit=1] run tag @s add bot_pick
scoreboard players operation @e[type=marker, tag=bot_pick] bot.own = @s bot.n
tag @e[type=marker, tag=bot_pick] add bot_taken
tag @e[type=marker, tag=bot_pick] remove bot_pick
