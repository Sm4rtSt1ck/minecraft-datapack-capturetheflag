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

# Climbing bots (ctf_bots:internal/climb), waiting bots (another weapon taken, a target come near:
# ctf_bots:internal/combat/wait)
execute as @e[type=zombified_piglin, tag=bot_climb] at @s run function ctf_bots:internal/climb/tick
execute as @e[type=zombified_piglin, tag=bot_wait] run function ctf_bots:internal/combat/wait_tick

# The bots holding a ranged weapon at their target shoot (every tick)
execute as @e[type=zombified_piglin, tag=bot_shoot] at @s run function ctf_bots:internal/combat/shoot_tick

# The brain: each bot thinks 4 times a second, the bots spread over the ticks (bot.slot)
scoreboard players add #t bots 1
scoreboard players operation #slot bots = #t bots
scoreboard players operation #slot bots %= #5 bots
execute as @e[type=zombified_piglin, tag=ctf_bot] if score @s bot.slot = #slot bots at @s run function ctf_bots:internal/brain/think

# Kill credit of the bots killed by a grenade / trap / ultimate: the marks follow the bots into their
# wallets; a wallet whose bot is gone gives the kill to the owner of the mark
execute as @e[type=zombified_piglin, tag=ctf_bot, scores={kc.time=1..}] run function ctf_bots:internal/credit/mirror
execute as @e[type=marker, tag=bot_wallet, tag=kc.watch] run function ctf_bots:internal/credit/watch
execute if score #vkill bots matches 1.. run scoreboard players remove #vkill bots 1
