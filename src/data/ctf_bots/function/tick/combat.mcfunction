# #ctf:tick/combat (round, end_round)
# The flag broken: the players carrying it (the defense bots chase them: they glow, seen from
# anywhere) and the flag items on the ground (also the ones dropped at a death)
tag @a remove bot_flag_player
execute if score broken flag_state matches 1 as @a[tag=attack, tag=player, tag=!dead] if items entity @s container.* magenta_banner run tag @s add bot_flag_player
execute if score broken flag_state matches 1 as @a[tag=attack, tag=player, tag=!dead] if items entity @s weapon.offhand magenta_banner run tag @s add bot_flag_player
execute if score broken flag_state matches 1 as @e[type=item, tag=!bot_flag_item] if items entity @s contents magenta_banner run tag @s add bot_flag_item

# The flag carried by a bot: its last position; the bot died: the flag drops there
execute as @e[type=zombified_piglin, tag=bot_carrier] run tp @e[type=marker, tag=bot_flag_pos] @s
execute if entity @e[type=marker, tag=bot_flag_pos] unless entity @e[type=zombified_piglin, tag=bot_carrier] run function ctf_bots:internal/flag/drop

# A bot with a gap ahead (armed at its think: ctf_bots:internal/brain/leap_scan) checks the edge every
# tick and jumps over it
execute as @e[type=zombified_piglin, tag=bot_leap] at @s run function ctf_bots:internal/brain/leap_tick

# The bots holding a ranged weapon at their target shoot (every tick)
execute as @e[type=zombified_piglin, tag=bot_shoot] at @s run function ctf_bots:internal/combat/shoot_tick

# The brain: each bot thinks 4 times a second, the bots spread over the ticks (bot.slot)
scoreboard players add #t bots 1
scoreboard players operation #slot bots = #t bots
scoreboard players operation #slot bots %= #5 bots
execute as @e[type=zombified_piglin, tag=ctf_bot] if score @s bot.slot = #slot bots at @s run function ctf_bots:internal/brain/think
