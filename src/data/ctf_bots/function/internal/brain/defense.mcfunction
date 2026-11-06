# A defense bot thinks
# A player carries the flag: chase him (he glows: seen from anywhere)
execute if entity @a[tag=bot_flag_player] run tag @p[tag=bot_flag_player] add bot_want
execute if entity @a[tag=bot_want] run return run function ctf_bots:internal/brain/target_want
# Fighting an attacker: go on; hit by an attacker: fight back; an attacker near: fight
execute on target if entity @s[type=player, tag=attack, tag=!dead] run return 1
execute on attacker if entity @s[type=player, tag=attack, tag=!dead, gamemode=!spectator] run tag @s add bot_want
execute unless entity @a[tag=bot_want] run tag @p[tag=attack, tag=player, tag=!dead, gamemode=!spectator, distance=..16] add bot_want
execute if entity @a[tag=bot_want] run return run function ctf_bots:internal/brain/target_want
# The flag on the ground: guard it
execute if entity @e[type=item, tag=bot_flag_item] at @n[type=item, tag=bot_flag_item] run return run function ctf_bots:internal/brain/lure_here
# Its defend spot (guarding there, asleep: no swinging at the lure), else the flag
execute as @e[type=marker, tag=bot_defend] if score @s bot.own = #me bots run tag @s add bot_dest
execute if entity @e[type=marker, tag=bot_dest, distance=..1.5] run function ctf_bots:internal/brain/guard
execute if entity @e[type=marker, tag=bot_dest] unless entity @e[type=marker, tag=bot_dest, distance=..1.5] at @n[type=marker, tag=bot_dest] run function ctf_bots:internal/brain/lure_here
execute unless entity @e[type=marker, tag=bot_dest] if entity @e[type=armor_stand, tag=flag, distance=..3] run function ctf_bots:internal/brain/guard
execute unless entity @e[type=marker, tag=bot_dest] if entity @e[type=armor_stand, tag=flag] unless entity @e[type=armor_stand, tag=flag, distance=..3] at @n[type=armor_stand, tag=flag] run function ctf_bots:internal/brain/lure_here
tag @e[type=marker, tag=bot_dest] remove bot_dest
