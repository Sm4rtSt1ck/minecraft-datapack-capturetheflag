# An attack bot after its route: escort the carrier (to the win trigger), else to the flag
execute if entity @e[type=zombified_piglin, tag=bot_carrier] at @n[type=armor_stand, tag=win_trigger] run return run function ctf_bots:internal/brain/lure_here
execute if entity @a[tag=bot_flag_player] at @n[type=armor_stand, tag=win_trigger] run return run function ctf_bots:internal/brain/lure_here
execute if entity @e[type=item, tag=bot_flag_item] at @n[type=item, tag=bot_flag_item] run return run function ctf_bots:internal/brain/lure_here
execute if entity @e[type=armor_stand, tag=flag] at @n[type=armor_stand, tag=flag] run return run function ctf_bots:internal/brain/lure_here
