# As a defense bot intercepting: at the delivery point (within 2: on guard), else on its way there
execute if entity @e[type=armor_stand, tag=win_trigger, distance=..2] run return run function ctf_bots:internal/brain/guard
execute at @n[type=armor_stand, tag=win_trigger] run function ctf_bots:internal/brain/lure_here
